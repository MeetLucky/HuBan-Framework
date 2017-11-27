//
//  HBFileManager.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/14.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFileManager : NSObject

/// 返回手机应用根目录   ~/
+ (NSString *)hb_homeFolder;

/// 返回文档目录路径    ~/Documents/
+ (NSString *)hb_documentsFolder;

/// 返回数据目录路径    ~/Library/
+ (NSString *)hb_libraryFolder;

/// 返回临时目录路径    ~/tmp/
+ (NSString *)hb_tmpFolder;

/// 返回数据主目录    ~/Library/Data/
+ (NSString *)hb_dataFolder;


/// 判断路径表示的文件夹是否存在
+ (BOOL)hb_folderExist:(NSString *)folderPath;

/// 创建目录表示的文件夹: 可以是多层级
+ (BOOL)hb_createFolder:(NSString *)folderPath;

/// 判断路径表示的文件是否存在
+ (BOOL)hb_fileExist:(NSString *)filePath;

/// 删除文件
+ (void)hb_deleteFile:(NSString *)filePath;

@end
