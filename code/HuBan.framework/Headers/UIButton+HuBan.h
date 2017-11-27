//
//  UIButton+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HuBan)

/**
 设置按钮纯色背景
 
 @param color 设置的颜色
 @param state 对应的状态
 */
- (void)hb_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;



/**
 设置按钮标题颜色和按钮点击时的颜色

 @param titleColor 标题颜色
 @param touchColor 点击颜色
 
 相当于下面四句的组合
 [self.interfaceButton setTitleColor:titleColor   forState:UIControlStateNormal];
 [self.interfaceButton setTitleColor:titleColor   forState:UIControlStateHighlighted];
 [self.interfaceButton hb_setBackgroundColor:touchColor             forState:UIControlStateNormal];
 [self.interfaceButton hb_setBackgroundColor:touchColor.hb_darken   forState:UIControlStateHighlighted];
 */
- (void)hb_setButtonTitleColor:(UIColor *)titleColor touchColor:(UIColor *)touchColor;


/// 文字图标垂直间距
- (void)hb_verticalAlignment:(CGFloat)value;

@end
