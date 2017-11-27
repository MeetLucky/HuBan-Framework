//
//  UIStoryboard+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/11.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UIStoryboard+HuBan.h"

@implementation UIStoryboard (HuBan)

+ (UIViewController *)initViewController:(NSString *)name {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *result = [storyboard instantiateViewControllerWithIdentifier:name];
    
    return result;
}

@end
