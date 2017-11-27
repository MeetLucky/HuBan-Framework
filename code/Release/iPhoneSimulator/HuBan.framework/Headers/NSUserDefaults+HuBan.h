//
//  NSUserDefaults+HuBan.h
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/8.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (HuBan)

/// 保存并同步布尔值
- (BOOL)hb_saveBool:(BOOL)value forKey:(NSString *)key;

/// 保存并同步整形
- (BOOL)hb_saveInteger:(NSInteger)value forKey:(NSString *)key;

/// 保存并同步单精度浮点数
- (BOOL)hb_saveFloat:(float)value forKey:(NSString *)key;

/// 保存并同步双精度浮点数
- (BOOL)hb_saveDouble:(double)value forKey:(NSString *)key;

/// 保存并同步长整形
- (BOOL)hb_saveLongLong:(u_int64_t)value forKey:(NSString *)key;

/// 保存并同步对象
- (BOOL)hb_saveObject:(id)value forKey:(NSString *)key;

/// 保存并同步字符串
- (BOOL)hb_saveString:(NSString *)value forKey:(NSString *)key;

@end
