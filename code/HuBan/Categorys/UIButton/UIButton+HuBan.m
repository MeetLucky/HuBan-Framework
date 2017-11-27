//
//  UIButton+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIButton+HuBan.h"
#import "UIImage+HuBan.h"
#import "UIColor+HuBan.h"

@implementation UIButton (HuBan)

#pragma mark -   设置按钮纯色背景
- (void)hb_setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage hb_imageWithColor:color] forState:state];
}


- (void)hb_setButtonTitleColor:(UIColor *)titleColor touchColor:(UIColor *)touchColor {
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateHighlighted];
    
    [self hb_setBackgroundColor:touchColor           forState:UIControlStateNormal];
    [self hb_setBackgroundColor:touchColor.hb_darken forState:UIControlStateHighlighted];
}


#pragma mark -   文字图标垂直间距
- (void)hb_verticalAlignment:(CGFloat)value {
    NSDictionary *dic = @{NSFontAttributeName: self.titleLabel.font};
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize  = [self.titleLabel.text sizeWithAttributes:dic];
    
    
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if ( titleSize.width + 0.5 < frameSize.width ) {
        titleSize.width = frameSize.width;
    }
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + value);
    self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height), 0.0, 0.0, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(totalHeight - titleSize.height), 0);
}

@end
