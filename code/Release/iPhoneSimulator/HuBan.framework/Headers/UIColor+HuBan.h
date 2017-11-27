//
//  UIColor+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HuBan)

/// 让原来的颜色变暗
- (instancetype)hb_darken;


#pragma mark    根据色相创建颜色
/**
 根据色相创建颜色
 
 @param some 色相值
 @return 颜色
 */
+ (instancetype)hb_colorWithSome:(CGFloat)some;


#pragma mark    快速设置颜色
/**
 快速设置颜色
 
 @param red   红色色相
 @param green 绿色色相
 @param blue  蓝色色相
 @return 颜色
 */
+ (instancetype)hb_colorWithQuick:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;


/// 默认颜色设置
+ (instancetype)hb_defaultColor;


/// 默认颜色加深一点
+ (instancetype)hb_darkenColor;


/// UITableViewCell 选择的背景色
+ (instancetype)hb_selectedColor;


/// UITableView 的空白处背景颜色
+ (instancetype)hb_sectionColor;


/// 分割线颜色
+ (instancetype)hb_lineColor;


/// 警告提示颜色
+ (instancetype)hb_confirmColor;


/// 禁用颜色
+ (instancetype)hb_disableColor;

@end
