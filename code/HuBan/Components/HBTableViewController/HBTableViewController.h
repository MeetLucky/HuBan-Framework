//
//  HBTableViewController.h
//  HuBan
//
//  Created by MeetLucky on 2017/11/6.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBTableViewController : UITableViewController <UIGestureRecognizerDelegate>

/// 是否隐藏状态栏: 值为 YES 表示隐藏状态栏; 为 NO 表示显示状态栏
@property (assign, nonatomic) BOOL hb_isStatusBarHidden;

/// 显示状态栏为显示的状态下: 值为 YES 表示白色; 为 NO 表示黑色
@property (assign, nonatomic) BOOL hb_isStatusBarStyleLightContent;

/// 底部 Home 指示器是否自动隐藏 iPhoneX 需要兼容
@property (assign, nonatomic) BOOL hb_isHomeIndicatorAutoHidden;

@end
