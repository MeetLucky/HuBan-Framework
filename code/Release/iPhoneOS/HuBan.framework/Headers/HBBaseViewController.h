//
//  HBBaseViewController.h
//  LoggerTech
//
//  Created by MeetLucky on 2017/9/30.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBBaseViewController : UIViewController <UIGestureRecognizerDelegate>

typedef void(^HBAlertActionHandler)(void); // 对话框点击回调


/// 是否隐藏状态栏: 值为 YES 表示隐藏状态栏; 为 NO 表示显示状态栏
@property (assign, nonatomic) BOOL hb_isStatusBarHidden;

/// 显示状态栏为显示的状态下: 值为 YES 表示白色; 为 NO 表示黑色
@property (assign, nonatomic) BOOL hb_isStatusBarStyleLightContent;

/// 底部 Home 指示器是否自动隐藏 iPhoneX 需要兼容
@property (assign, nonatomic) BOOL hb_isHomeIndicatorAutoHidden;



#pragma mark -  递归查找导航栏底部横线
/// 导航栏为透明时可能需要用到
- (UIImageView *)hb_findNavBottomBaseLine;



#pragma mark -  显示对话框公共方法
#pragma mark    显示对话框标题和提示内容: 只有一个确认按钮默认无动作
/// 显示对话框标题和提示内容: 只有一个确认按钮默认无动作
- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message;

#pragma mark    显示对话框标题和提示内容: 只有一个自定义标题的按钮默认无动作
/// 显示对话框标题和提示内容: 只有一个自定义标题的按钮默认无动作
- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message action:(NSString *)action;

#pragma mark    显示对话框标题和提示内容: 只有一个自定义回调的动作触发
/// 显示对话框标题和提示内容: 只有一个自定义回调的动作触发
- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message action:(NSString *)action handler:(HBAlertActionHandler)handler;


#pragma mark -  两个操作按钮的对话框
#pragma mark    显示权限错误提示对话框: 按钮不能自定义
/// 显示权限错误提示对话框: 按钮不能自定义
- (void)hb_showPermissionsControllerTitle:(NSString *)title message:(NSString *)message;

#pragma mark    显示对话框显示两个操作按钮: 按钮标题和动作自定义
/// 显示对话框显示两个操作按钮: 按钮标题和动作自定义
- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message first:(NSString *)firstTitle firstAction:(HBAlertActionHandler)firstAction second:(NSString *)secondTitle secondAction:(HBAlertActionHandler)secondAction;


@end
