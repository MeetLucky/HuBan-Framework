//
//  UIImage+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIImage+HuBan.h"
#import "NSBundle+HuBan.h"

@implementation UIImage (HuBan)

+ (UIImage *)hb_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}


- (UIImage *)hb_tintColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

+ (instancetype)hb_assetsWithName:(NSString *)name {
    NSBundle *bundle = [NSBundle hb_bundle];
    
    UIImage *result = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    
    return result;
}


#pragma mark -  将图片的方向转为正确的方向
- (UIImage *)hb_orientation {
    if ( self.imageOrientation == UIImageOrientationUp )
        return self;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch ( self.imageOrientation ) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
            
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch ( self.imageOrientation ) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef context = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                                 CGImageGetBitsPerComponent(self.CGImage), 0,
                                                 CGImageGetColorSpace(self.CGImage),
                                                 CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(context, transform);
    
    switch ( self.imageOrientation ) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(context, CGRectMake(0, 0, self.size.height, self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(context, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
            break;
    }
    
    CGImageRef image   = CGBitmapContextCreateImage(context);
    UIImage    *result = [UIImage imageWithCGImage:image];
    
    CGContextRelease(context);
    CGImageRelease(image);
    
    return result;
}

/**
 图片缩放至指定大小
 
 @param size 指定宽度和高度
 
 @return 缩放后的图片
 */
- (UIImage *)hb_imageWithScaleSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}


/**
 缩放指定系数
 
 @param scale 系数
 @return 缩放后的图片
 */
- (UIImage *)hb_imageWithProportion:(CGFloat)scale {
    CGSize  size   = self.size;
    
    CGFloat width  = size.width;
    CGFloat height = size.height;
    
    CGFloat scaledWidth  = width * scale;
    CGFloat scaledHeight = height * scale;
    
    UIGraphicsBeginImageContext(size);
    
    [self drawInRect:CGRectMake(0, 0, scaledWidth, scaledHeight)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}


/// Base64 转换为图片
+ (UIImage *)hb_imageFromBase64:(NSString *)base {
    NSURL  *url  = [NSURL URLWithString:base];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *result = [UIImage imageWithData:data];
    
    return result;
}


/// 将图片转换位 Base64 编码
- (NSString *)hb_imageToBase64 {
    NSData   *imageData = nil;
    NSString *mimeType = nil;
    
    //  判断图片的类型
    if ( [self imageHasAlpha:self] ) {
        mimeType = @"image/png";
        
        imageData = UIImagePNGRepresentation(self);
    } else {
        mimeType = @"image/jpeg";
        
        imageData = UIImageJPEGRepresentation(self, 1.0f);
    }
    
    NSString *base   = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSString *result = [NSString stringWithFormat:@"data:%@;base64,%@", mimeType, base];
    
    return result;
}


/// 判断图片上方有透明通道
- (BOOL)imageHasAlpha:(UIImage *)image {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    
    BOOL result = ( alpha == kCGImageAlphaFirst || alpha == kCGImageAlphaLast  ||
                    alpha == kCGImageAlphaPremultipliedFirst || alpha == kCGImageAlphaPremultipliedLast );
    
    return result;
}


/// 生成指定背景色的纯色图片
- (UIImage *)hb_createWithTintColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawInRect:rect];
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextFillRect(context, rect);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}


/// 把自己合成添加到参数的上面
- (UIImage *)hb_addToFront:(UIImage *)image {
    UIGraphicsBeginImageContext(self.size);
    
    // 在这里有先后顺序
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [self  drawInRect:CGRectMake(0, 0, self.size.width,  self.size.height)];
    
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
