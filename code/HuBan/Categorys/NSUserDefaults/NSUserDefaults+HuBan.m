//
//  NSUserDefaults+HuBan.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/8.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSUserDefaults+HuBan.h"

@implementation NSUserDefaults (HuBan)

#pragma mark -  保存并同步布尔值
- (BOOL)hb_saveBool:(BOOL)value forKey:(NSString *)key {
    [self setBool:value forKey:key];
    
    BOOL result = [self synchronize];
    
    return result;
}

#pragma mark    保存并同步整形
- (BOOL)hb_saveInteger:(NSInteger)value forKey:(NSString *)key {
    [self setInteger:value forKey:key];
    
    BOOL result = [self synchronize];
    
    return result;
}

#pragma mark    保存并同步单精度浮点数
- (BOOL)hb_saveFloat:(float)value forKey:(NSString *)key {
    [self setFloat:value forKey:key];
    
    BOOL result = [self synchronize];
    
    return result;
}

#pragma mark    保存并同步双精度浮点数
- (BOOL)hb_saveDouble:(double)value forKey:(NSString *)key {
    [self setDouble:value forKey:key];
    
    BOOL result = [self synchronize];
    
    return result;
}

#pragma mark    保存并同步长整形
- (BOOL)hb_saveLongLong:(u_int64_t)value forKey:(NSString *)key {
    NSString *txt = [NSString stringWithFormat:@"%llu", value];
    
   return [self hb_saveObject:txt forKey:key];
}

#pragma mark    保存并同步对象
- (BOOL)hb_saveObject:(id)value forKey:(NSString *)key {
    if ( [value isEqual:[NSNull null]] ) {
        NSLog(@"HuBan.framework: NSUserDefaults 不能保存空数据");
        
        return NO;
    }
    
    [self setObject:value forKey:key];
    
    BOOL result = [self synchronize];
    
    return result;
}

#pragma mark    保存并同步字符串
- (BOOL)hb_saveString:(NSString *)value forKey:(NSString *)key {
    return [self hb_saveObject:value forKey:key];
}

@end
