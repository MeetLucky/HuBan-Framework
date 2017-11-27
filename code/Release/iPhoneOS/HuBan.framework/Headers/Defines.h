//
//  Defines.h
//  LoggerTech
//
//  Created by MeetLucky on 2017/9/30.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

//  正式发布版本去掉打印
#ifndef __OPTIMIZE__
    #define NSLog(...) NSLog(__VA_ARGS__)
#else
    #define NSLog(...) {}
#endif


//  默认设置
#define HBUserDefaults          [NSUserDefaults standardUserDefaults]

//  通知中心
#define HBNotificaCenter        [NSNotificationCenter defaultCenter]

//  程序资源
#define HBBundle                [NSBundle mainBundle]

//  故事版加载
#define HBStoryboard(cls, name) (cls *)[UIStoryboard initViewController:name]

//  资源路径
#define HBFilePath(name)        [@"Bundle.bundle" stringByAppendingPathComponent:name]

//  类字符串
#define HBClass(cls)            NSStringFromClass([cls class])

//  方法选择器
#define HBSel(sel)              @selector(sel)

//  应用程序
#define HBApplication           [UIApplication sharedApplication]

//  弱引用定义
#define HBWeakSelf(object)      __weak typeof(object) weak##object = object;

//  强引用定义
#define HBStrongSelf(object)    __strong typeof(object) object = weak##object;


////  控制器或视图初始化
#define HBViewController(cls)   [[cls alloc] initWithNibName:NSStringFromClass([cls class]) bundle:nil]
#define HBNavController(cls)    [[HBBaseNavController alloc] initWithRootViewController: cls]
#define HBBundleXibNamed(cls)   [HBBundle loadNibNamed:NSStringFromClass([cls class]) owner: cls options: nil].firstObject


//  软件的版本
#define HBSoftwareVersion       [[HBBundle infoDictionary] objectForKey: @"CFBundleShortVersionString"]

//  软件的构建次数
#define HBSystemBundle          [[[HBBundle infoDictionary] objectForKey: @"CFBundleVersion"] integerValue]

//  手机系统版本
#define HBSystemVersion         [[[UIDevice currentDevice] systemVersion] floatValue]

//  屏幕大小
#define HBScreenBound           [UIScreen mainScreen].bounds
#define HBScreenWidth           [UIScreen mainScreen].bounds.size.width
#define HBScreenHeight          [UIScreen mainScreen].bounds.size.height
#define HBScreenScale           [UIScreen mainScreen].scale

//  状态栏
#define HBStatusHeight          [HBApplication statusBarFrame].size.height

//  导航栏
#define HBNavBarHeight          self.navigationController.navigationBar.frame.size.height

//  视图高
#define HBViewHeight            ( HBScreenHeight - HBStatusHeight - HBNavBarHeight )

//  网络连接
#define HBNetwork               [AFNetworkReachabilityManager sharedManager]
#define HBNetConnState          HBNetwork.networkReachabilityStatus
#define HBNetConnection         ( HBNetConnState < 1 )

//  管理对象上下文
#define HBManagedContext        [NSManagedObjectContext MR_defaultContext]

//  当前设备是否是 iPhoneX
#define iPhoneX                 ( HBScreenHeight == 812.f )

#endif /* Defines_h */
