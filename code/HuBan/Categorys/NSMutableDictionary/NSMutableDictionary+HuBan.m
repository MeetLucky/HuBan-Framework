//
//  NSMutableDictionary+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/13.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSMutableDictionary+HuBan.h"

@implementation NSMutableDictionary (HuBan)

- (NSString *)hb_dicToJSON {
    NSData   *data   = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return result;
}

@end
