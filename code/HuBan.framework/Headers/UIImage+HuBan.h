//
//  UIImage+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

//  导航栏白色返回图片
#define HB_NAV_BACK_W      @"nav_back-w"

@interface UIImage (HuBan)

typedef void(^HBCacheBlock)(void); // 成功回调

/**
 创建纯色图片
 
 @param color 图片的颜色
 
 @return 纯色图片
 */
+ (UIImage *)hb_imageWithColor:(UIColor *)color;


/// 图片着色
- (UIImage *)hb_tintColor:(UIColor *)color;


/// 从资源中的图片集加载图片
+ (instancetype)hb_assetsWithName:(NSString *)name;


/// 将图片的方向转为正确的方向
- (UIImage *)hb_orientation;


/**
 图片缩放至指定大小
 
 @param size 指定宽度和高度
 
 @return 缩放后的图片
 */
- (UIImage *)hb_imageWithScaleSize:(CGSize)size;


/**
 缩放指定系数: 保持图片宽和高比例
 
 @param scale 系数
 @return 缩放后的图片
 */
- (UIImage *)hb_imageWithProportion:(CGFloat)scale;


/// Base64 转换为图片
+ (UIImage *)hb_imageFromBase64:(NSString *)base;


/// 将图片转换位 Base64 编码
- (NSString *)hb_imageToBase64;


/// 生成指定背景色的纯色图片
- (UIImage *)hb_createWithTintColor:(UIColor *)color;


/// 把自己合成添加到参数的上面
- (UIImage *)hb_addToFront:(UIImage *)image;

@end
