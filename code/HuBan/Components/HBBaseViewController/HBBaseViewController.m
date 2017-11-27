//
//  HBBaseViewController.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/9/30.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBBaseViewController.h"

@interface HBBaseViewController ()

@end

@implementation HBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //  设置左滑返回支持
    [self handleGestureAction];
}


#pragma mark -  设置左滑返回支持
- (void)handleGestureAction {
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -  UIStatusBarAction
- (BOOL)prefersStatusBarHidden {
    return self.hb_isStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ( self.hb_isStatusBarStyleLightContent ) {
        return UIStatusBarStyleLightContent;
    }
    
    return UIStatusBarStyleDefault;
}


- (BOOL)prefersHomeIndicatorAutoHidden {
    return self.hb_isHomeIndicatorAutoHidden;
}


@end
