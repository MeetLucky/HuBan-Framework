//
//  NSString+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/11.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSString+HuBan.h"
#import "NSDateFormatter+HuBan.h"
#import "HBFormatManager.h"

@implementation NSString (HuBan)

#pragma mark    去除两端空白格
- (instancetype)hb_trim {
    NSCharacterSet *cs = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSString *result = [self stringByTrimmingCharactersInSet:cs];
    
    return result;
}

- (instancetype)hb_started:(NSString *)str {
    NSString *result = [NSString stringWithFormat:@"%@%@", str, self];
    return result;
}

- (instancetype)hb_append:(NSString *)str {
    NSString *result = [NSString stringWithFormat:@"%@%@", self, str];
    return result;
}

- (CGSize)hb_sizeWithFont:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName:font};
    
    NSStringDrawingOptions so = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGRect result = [self boundingRectWithSize:CGSizeMake(0, MAXFLOAT) options:so attributes:attr context:nil];
    
    return result.size;
}


/// 字符串匹配是否是邮箱格式
- (BOOL)hb_isMatchEmail {
    NSString    *str = @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    
    NSPredicate *result = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [result evaluateWithObject:self];
}


/// 查询字符串转为字典
- (NSDictionary *)hb_urlToDic {
    //  判断是否有参数
    NSRange whether = [self rangeOfString:@"?"];
    
    if ( whether.location == NSNotFound ) {
        return nil;
    }
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    // 截取参数部分的字符串
    NSString *txt = [self substringFromIndex:whether.location + 1];
    
    // 判断是单个参数还是多个参数
    if ( [txt containsString:@"&"] ) {
        //  分割参数列表
        NSArray *list = [txt componentsSeparatedByString:@"&"];
        
        for ( NSString *item in list ) {
            // 生成 Key / Value
            NSArray *keyValues = [item componentsSeparatedByString:@"="];
            
            NSString *key   = [keyValues.firstObject stringByRemovingPercentEncoding];
            key = [NSString hb_urlDecode:key];
            
            NSString *value = [keyValues.lastObject stringByRemovingPercentEncoding];
            value = [NSString hb_urlDecode:value];
            
            // 不能为空否则会闪退
            if ( key == nil || value == nil ) {
                continue;
            }
            
            id existValue = [result valueForKey:key];
            
            if ( existValue != nil ) {  // 已存在的值，生成数组
                if ( [existValue isKindOfClass:[NSArray class]] ) { // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [result setValue:items forKey:key];
                } else {    // 非数组
                    [result setValue:value forKey:key];
                }
            } else {    // 设置值
                [result setValue:value forKey:key];
            }
        }
	} else {    // 单个参数
        NSArray *keyValues = [txt componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if ( keyValues.count == 1 ) {
            return nil;
        }
        
        // 分隔值
        NSString *key   = [keyValues.firstObject stringByRemovingPercentEncoding];
        key = [NSString hb_urlDecode:key];
        
        NSString *value = [keyValues.lastObject stringByRemovingPercentEncoding];
        value = [NSString hb_urlDecode:value];

        // 不能为空
        if ( key == nil || value == nil ) {
            return nil;
        }
        
        // 设置值
        [result setValue:value forKey:key];
    }
    
    return result;
}

/// 字符串编码
+ (NSString *)hb_urlEncode:(NSString *)txt {
    NSString *value = [NSString stringWithFormat:@"%@", txt];
    
    NSString *str = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)value, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    return str;
}

/// 字符串解码
+ (NSString *)hb_urlDecode:(NSString *)txt {
    NSString *value = [NSString stringWithFormat:@"%@", txt];
    
    NSString *str = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)value, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return str;
}

/**
 转换日期为指定格式
 
 @param date   日期
 @param format 格式
 @return 日期字符串
 */
+ (instancetype)hb_stringWithDate:(NSDate *)date fromat:(NSString *)format {
    HBFormatManager *manager = [HBFormatManager hb_sharedManager];
    
    NSString *result = [manager.hb_format hb_convertDate:date toFormat:format];
    
    return result;
}

/**
 将字符串转为指定格式的日期类型
 
 @param format 转换的格式
 @return 日期
 */
- (NSDate *)hb_convertToDateFormat:(NSString *)format {
    NSDateFormatter *date = [HBFormatManager hb_sharedManager].hb_format;
    date.dateFormat = format;
    
    NSDate *result = [date dateFromString:self];
    
    return result;
}


#pragma mark -  去掉多余的小数点和零字符
+ (instancetype)hb_removeMoreZero:(NSString *)txt {
    if ( txt.length < 1 ) {
        return @"";
    }
    
    NSInteger offset  = txt.length - 1;
    NSString  *string = @"";
    
    NSRange range = [txt rangeOfString:@"."];
    
    while ( offset ) {
        string = [txt substringWithRange:NSMakeRange(offset, 1)];
        
        if ( offset > range.location ) {
            if ( [string isEqualToString:@"0"] ) {
                offset--;
            } else {
                break;
            }
        } else {
            if ( [string isEqualToString:@"."] ) {
                offset--;
                
                break;
            }
        }
    }
    
    NSString *result = [txt substringToIndex:offset + 1];
    
    return result;
}

@end
