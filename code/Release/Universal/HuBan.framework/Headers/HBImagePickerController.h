//
//  HBImagePickerController.h
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBImagePickerController : UIImagePickerController

/// 显示状态栏为显示的状态下: 值为 YES 表示白色; 为 NO 表示黑色
@property (assign, nonatomic) BOOL hb_isStatusBarStyleLightContent;

@end
