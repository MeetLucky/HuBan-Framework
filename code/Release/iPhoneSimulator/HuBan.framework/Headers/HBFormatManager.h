//
//  HBFormatManager.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/27.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFormatManager : NSObject

/// 时间日期格式化
@property (strong, nonatomic) NSDateFormatter *hb_format;


/// 日期时间格式化单例
+ (instancetype)hb_sharedManager;

@end
