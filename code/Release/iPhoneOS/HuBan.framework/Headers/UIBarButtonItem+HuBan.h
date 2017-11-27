//
//  UIBarButtonItem+HuBan.h
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HuBan)

#pragma mark -  导航栏的后退按钮样式
/// 导航栏的后退按钮样式
+ (UIBarButtonItem *)hb_backBarButtonItem:(NSString *)imageName target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)hb_backBarButtonBundle:(NSString *)imageName target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)hb_barButtonItem:(UIBarButtonSystemItem)item target:(id)target action:(SEL)action;

@end
