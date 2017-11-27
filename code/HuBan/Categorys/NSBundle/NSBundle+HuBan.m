//
//  NSBundle+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSBundle+HuBan.h"
#import "Defines.h"

@implementation NSBundle (HuBan)

+ (instancetype)hb_bundle {
    NSString *filePath = [HBBundle pathForResource:@"Bundle" ofType:@"bundle"];
    
    NSBundle *bundle = [NSBundle bundleWithPath:filePath];
    
    return bundle;
}

@end
