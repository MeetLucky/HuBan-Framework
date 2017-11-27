//
//  NSDateFormatter+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/27.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSDateFormatter+HuBan.h"

@implementation NSDateFormatter (HuBan)

/**
 将日期类型转换为对应的日期时间字符串
 
 @param date 要转换的日期时间
 @param format 指定的日期时间字符串格式
 @return 日期时间字符串
 */
- (NSString *)hb_convertDate:(NSDate *)date toFormat:(NSString *)format {
    self.dateFormat = format;
    
    NSString *result = [self stringFromDate:date];
    
    return result;
}


/**
 将时间戳转换为对应的日期时间字符串
 
 @param interval 要转换的时间戳
 @param format 指定的日期时间字符串格式
 @return 日期时间字符串
 */
- (NSString *)hb_convertInterval:(NSTimeInterval)interval toFormat:(NSString *)format {
    NSDate *result = [NSDate dateWithTimeIntervalSince1970:interval / 1000]; // 从毫秒转为秒
    
    return [self hb_convertDate:result toFormat:format];
}

@end
