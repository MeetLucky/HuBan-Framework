//
//  UIViewController+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/11/6.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "NSURL+HuBan.h"
#import "UINavigationBar+HuBan.h"
#import "UIViewController+HuBan.h"

@implementation UIViewController (HuBan)

#pragma mark -  递归查找导航栏底部横线
- (UIImageView *)hb_findNavBottomBaseLine {
    UIImageView *line = [self.navigationController.navigationBar hb_findBottomBaseLine];
    
    return line;
}



#pragma mark -  显示对话框公共方法
- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message {
    [self hb_showAlertControllerTitle:title message:message action:@"确定" handler:nil];
}

- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message action:(NSString *)action {
    [self hb_showAlertControllerTitle:title message:message action:action handler:nil];
}


- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message action:(NSString *)action handler:(HBAlertActionHandler)handler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:action style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ( handler ) {
            handler();
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)hb_showPermissionsControllerTitle:(NSString *)title message:(NSString *)message {
    [self hb_showAlertControllerTitle:title message:message first:@"忽略" firstAction:nil second:@"设置" secondAction:^{
        [[NSURL URLWithString:UIApplicationOpenSettingsURLString] hb_browse];
    }];
}

/// 显示对话框显示两个操作按钮: 按钮标题和动作自定义
- (void)hb_showAlertControllerTitle:(NSString *)title message:(NSString *)message first:(NSString *)firstTitle firstAction:(HBAlertActionHandler)firstAction second:(NSString *)secondTitle secondAction:(HBAlertActionHandler)secondAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:firstTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if ( firstAction ) {
            firstAction();
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:secondTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ( secondAction ) {
            secondAction();
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
