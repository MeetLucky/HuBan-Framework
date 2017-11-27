//
//  HBFixedViewController.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/9/30.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBFixedViewController.h"

@interface HBFixedViewController ()

@end

@implementation HBFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -  不支持屏幕旋转
- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
