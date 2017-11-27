//
//  NSData+HuBan.m
//  WeNews
//
//  Created by MeetLucky on 2017/10/16.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSData+HuBan.h"

@implementation NSData (HuBan)

- (NSString *)hb_base64 {
    NSString *result = [self base64EncodedStringWithOptions:0];
    return result;
}

@end
