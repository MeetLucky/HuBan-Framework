//
//  HBFileManager.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/14.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBFileManager.h"

@implementation HBFileManager

#pragma mark    返回手机应用根目录   ~/
+ (NSString *)hb_homeFolder {
    return NSHomeDirectory();
}


#pragma mark    返回文档目录路径    ~/Documents/
+ (NSString *)hb_documentsFolder {
    NSString *result = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    return result;
}


#pragma mark    返回数据目录路径    ~/Library/
+ (NSString *)hb_libraryFolder {
    NSString *result = [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    
    return result;
}


#pragma mark    返回临时目录路径    ~/tmp/
+ (NSString *)hb_tmpFolder {
    NSString *result = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    
    return result;
}


#pragma mark    返回数据主目录    ~/Library/Data/
+ (NSString *)hb_dataFolder {
    NSString *result = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Data"];
    
    return result;
}


#pragma mark    判断路径表示的文件夹是否存在
+ (BOOL)hb_folderExist:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;  //  存储判断的结果是文件还算目录,是目录值为 YES,文件则为 NO
    BOOL isDirectoryExist = [fileManager fileExistsAtPath:folderPath isDirectory:&isDirectory];
    
    if ( isDirectory ) {
        return isDirectoryExist;
    } else {
        return NO;
    }
}


#pragma mark    创建目录
+ (BOOL)hb_createFolder:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;
    BOOL isDirectoryExist = [fileManager fileExistsAtPath:folderPath isDirectory:&isDirectory];
    BOOL result      = NO;
    
    if ( isDirectory == NO && isDirectoryExist == NO ) {
        result = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return result;
}


#pragma mark    判断文件是否存在
+ (BOOL)hb_fileExist:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    
    return isExist;
}


#pragma mark    删除文件
+ (void)hb_deleteFile:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:filePath error:nil];
}

@end
