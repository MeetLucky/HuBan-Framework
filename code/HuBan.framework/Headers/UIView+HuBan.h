//
//  UIView+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HuBan)

/// 设置圆角边框
- (void)hb_setBorderRadius:(CGFloat)radius;

/// 设置底部或者顶部细线
- (void)hb_setThinLine:(UIColor *)color isBottom:(BOOL)isBottom;

@end
