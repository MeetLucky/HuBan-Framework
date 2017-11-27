//
//  UIColor+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIColor+HuBan.h"

@implementation UIColor (HuBan)

#pragma mark -  让颜色变暗
- (instancetype)hb_darken {
    CGFloat components[4];
    
    [self components:components forColor:self];
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    r *= 0.85;
    g *= 0.85;
    b *= 0.85;
    
    UIColor *result = [UIColor hb_colorWithQuick:r green:g blue:b];
    
    return result;
}

//  根据颜色获取颜色的三原色数据值
- (void)components:(CGFloat [4])components forColor:(UIColor *)color {
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    unsigned char   pixel[4];
    CGContextRef    context = CGBitmapContextCreate(&pixel, 1, 1, 8, 4, space, kCGImageAlphaNoneSkipLast);
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    CGContextRelease(context);
    CGColorSpaceRelease(space);
    
    for ( int component = 0; component < 4; component++ ) {
        components[component] = pixel[component];
    }
}


#pragma mark -  根据色相创建颜色
+ (instancetype)hb_colorWithSome:(CGFloat)some {
    UIColor *result = [UIColor colorWithRed:some / 255.0 green:some / 255.0 blue:some / 255.0 alpha:1.0];
    return result;
}


#pragma mark    快速设置颜色
+ (instancetype)hb_colorWithQuick:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    UIColor *result = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
    return result;
}


#pragma mark -  默认颜色设置
+ (instancetype)hb_defaultColor {
    UIColor *result = [UIColor hb_colorWithQuick:255 green:89 blue:89];
    return result;
}


#pragma mark    默认深一点颜色
+ (instancetype)hb_darkenColor {
    UIColor *result = [[UIColor hb_defaultColor] hb_darken];
    return result;
}


#pragma mark    UITableViewCell 选择的背景色
+ (instancetype)hb_selectedColor {
    UIColor *result = [UIColor colorWithWhite:0.96 alpha:1];
    return result;
}


#pragma mark    UITableView 的空白处背景颜色
+ (instancetype)hb_sectionColor {
    UIColor *result = [UIColor hb_colorWithSome:250];
    return result;
}


#pragma mark    分割线颜色
+ (instancetype)hb_lineColor {
    UIColor *result = [UIColor colorWithWhite:0.8 alpha:0.5];
    return result;
}


#pragma mark    警告确认颜色
+ (instancetype)hb_confirmColor {
    UIColor *result = [UIColor hb_colorWithQuick:255 green:102 blue:118];
    
    return result;
}


#pragma mark    禁用颜色
+ (instancetype)hb_disableColor {
    UIColor *result = [UIColor hb_colorWithSome:181];
    return result;
}

@end
