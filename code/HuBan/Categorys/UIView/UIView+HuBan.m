//
//  UIView+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIView+HuBan.h"
#import "Defines.h"

@implementation UIView (HuBan)

- (void)hb_setBorderRadius:(CGFloat)radius {
    self.layer.masksToBounds  = YES;
    self.layer.cornerRadius   = radius;
    self.layer.borderColor    = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor;
    self.layer.borderWidth    = 0.5;
}

/// 设置底部或者顶部细线
- (void)hb_setThinLine:(UIColor *)color isBottom:(BOOL)isBottom {
    CGFloat offset = 0;
    
    if ( isBottom ) {
        offset = CGRectGetHeight(self.bounds) - 0.3;
    }
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(0, offset, HBScreenWidth, 0.3);
    lineLayer.backgroundColor = color.CGColor;
    
    [self.layer addSublayer:lineLayer];
}

@end
