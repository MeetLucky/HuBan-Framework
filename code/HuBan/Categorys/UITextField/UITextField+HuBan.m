//
//  UITextField+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UITextField+HuBan.h"
#import "UIView+HuBan.h"

@implementation UITextField (HuBan)

/// 设置左侧图标并自定义输入框的边框圆角
- (void)hb_leftIconWithImage:(NSString *)imageName {
    self.borderStyle = UITextBorderStyleNone;
    
    
    //  设置圆角边框
    [self hb_setBorderRadius:3];
    
    
    // 一直显示左侧图标
    self.leftViewMode = UITextFieldViewModeAlways;
    
    
    CGFloat selfHeight = CGRectGetHeight(self.bounds);
    CGRect imageFrame  = CGRectMake(0, 0, selfHeight, selfHeight);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = [UIImage imageNamed:imageName];
    self.leftView = imageView;
}

- (void)hb_setPlaceholderColor:(UIColor *)color {
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
