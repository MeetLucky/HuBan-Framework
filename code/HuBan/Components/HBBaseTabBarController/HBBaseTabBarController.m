//
//  HBBaseTabBarController.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBBaseTabBarController.h"

@interface HBBaseTabBarController ()

@end

@implementation HBBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -  状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.selectedViewController.preferredStatusBarStyle;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.selectedViewController;
}

#pragma mark    指示器隐藏
- (BOOL)prefersHomeIndicatorAutoHidden {
    return self.selectedViewController.prefersHomeIndicatorAutoHidden;
}

#pragma mark    屏幕旋转
- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.selectedViewController.supportedInterfaceOrientations;
}

@end
