//
//  UINavigationItem+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/12.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (HuBan)

- (void)hb_leftItemWithImage:(UIImage *)image  target:(id)target action:(SEL)action;
- (void)hb_rightItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

- (void)hb_leftItemWithImageName:(NSString *)name  target:(id)target action:(SEL)action;
- (void)hb_rightItemWithImageName:(NSString *)name target:(id)target action:(SEL)action;

- (void)hb_leftItemWithTitle:(NSString *)title  target:(id)target action:(SEL)action;
- (void)hb_rightItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
