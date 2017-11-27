//
//  HBFormatManager.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/27.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBFormatManager.h"

@implementation HBFormatManager

#pragma mark    实例化日期时间格式化单例
+ (instancetype)hb_sharedManager {
    static HBFormatManager *instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[HBFormatManager alloc] init];
        
        instance.hb_format = [[NSDateFormatter alloc] init];
        instance.hb_format.locale = [NSLocale currentLocale]; // 设置当前时区
    });
    
    
    return instance;
}

@end
