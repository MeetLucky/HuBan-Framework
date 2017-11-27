//
//  HBImagePickerController.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBImagePickerController.h"

@interface HBImagePickerController ()

@end

@implementation HBImagePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setHb_isStatusBarStyleLightContent:(BOOL)hb_isStatusBarStyleLightContent {
    _hb_isStatusBarStyleLightContent = hb_isStatusBarStyleLightContent;
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -  UIStatusBarAction
- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ( self.hb_isStatusBarStyleLightContent ) {
        return UIStatusBarStyleLightContent;
    }
    
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
