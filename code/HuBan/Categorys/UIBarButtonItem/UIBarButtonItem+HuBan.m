//
//  UIBarButtonItem+HuBan.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIBarButtonItem+HuBan.h"
#import "UIImage+HuBan.h"

@implementation UIBarButtonItem (HuBan)

+ (UIBarButtonItem *)hb_backBarButtonItem:(NSString *)imageName target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [self backBarButton:image target:target action:action];
}


+ (UIBarButtonItem *)hb_backBarButtonBundle:(NSString *)imageName target:(id)target action:(SEL)action {
    UIImage *image = [UIImage hb_assetsWithName:imageName];
    
    return [self backBarButton:image target:target action:action];
}


+ (UIBarButtonItem *)backBarButton:(UIImage *)image target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds                      = CGRectMake(0, 0, 40, 40);
    button.imageEdgeInsets             = UIEdgeInsetsMake(0, -10, 0, 0);
    button.adjustsImageWhenHighlighted = NO;
    
    button.imageView.contentMode = UIViewContentModeLeft;
    
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

+ (UIBarButtonItem *)hb_barButtonItem:(UIBarButtonSystemItem)item target:(id)target action:(SEL)action {
   UIBarButtonItem *result = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item target:target action:action];
    
    return result;
}

@end
