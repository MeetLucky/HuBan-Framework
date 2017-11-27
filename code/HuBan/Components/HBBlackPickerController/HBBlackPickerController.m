//
//  HBBlackPickerController.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/16.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBBlackPickerController.h"

@interface HBBlackPickerController ()

@end

@implementation HBBlackPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -  UIStatusBarAction
- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}


#pragma mark -  屏幕旋转: 返回仅支持竖屏
- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
