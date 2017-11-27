//
//  UIApplication+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/12.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIApplication+HuBan.h"
#import "Defines.h"

@implementation UIApplication (HuBan)

- (UIWindow *)hb_statusBarWindow {
    return [HBApplication valueForKey:@"_statusBarWindow"];
}

@end
