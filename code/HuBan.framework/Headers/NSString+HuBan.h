//
//  NSString+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/11.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (HuBan)

#pragma mark -  字符串操作
/// 去除两端空白格
- (instancetype)hb_trim;

/// 字符串开头字符拼接
- (instancetype)hb_started:(NSString *)str;

/// 字符串末尾拼接字符串
- (instancetype)hb_append:(NSString *)str;

#pragma mark -  字符串计算
- (CGSize)hb_sizeWithFont:(UIFont *)font;

#pragma mark -  字符串判断
/// 字符串匹配是否是邮箱格式
- (BOOL)hb_isMatchEmail;


#pragma mark -  模型转换
///  查询字符串转为字典
- (NSDictionary *)hb_urlToDic;


#pragma mark -  URL 编码
/// 字符串编码
+ (NSString *)hb_urlEncode:(NSString *)txt;

/// 字符串解码
+ (NSString *)hb_urlDecode:(NSString *)txt;


#pragma mark -  日期处理
/**
 转换日期为指定格式
 
 @param date   日期
 @param format 格式
 @return 日期字符串
 */
+ (instancetype)hb_stringWithDate:(NSDate *)date fromat:(NSString *)format;


/**
 将字符串转为指定格式的日期类型
 
 @param format 转换的格式
 @return 日期
 */
- (NSDate *)hb_convertToDateFormat:(NSString *)format;


/// 带有小数点的数值中去掉多余没有意义的零字符
+ (instancetype)hb_removeMoreZero:(NSString *)txt;

@end
