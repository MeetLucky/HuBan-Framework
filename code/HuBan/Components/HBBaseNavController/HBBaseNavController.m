//
//  HBBaseNavController.m
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/8.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBBaseNavController.h"
#import "Defines.h"
#import "UIImage+HuBan.h"
#import "UIBarButtonItem+HuBan.h"
#import "UINavigationBar+HuBan.h"

@interface HBBaseNavController ()

@end

@implementation HBBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
	[self customizeNavigation];
    [self customizeViewDesign];
}



#pragma mark -  自定义导航栏
- (void)customizeNavigation {
    //  设置标题字体大一些
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    [self.navigationController.navigationBar setTitleTextAttributes:attr];
}

#pragma mark -  自定义视图
- (void)customizeViewDesign {
    self.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -  状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

#pragma mark    指示器隐藏
- (BOOL)prefersHomeIndicatorAutoHidden {
    return self.topViewController.prefersHomeIndicatorAutoHidden;
}

#pragma mark    屏幕旋转
- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}


#pragma mark -  UINavigationControllerDelegate
//  自动设置后退按钮和左滑返回手势
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ( self.viewControllers.count >= 1 ) {
        NSString *vcs = NSStringFromClass(viewController.class);
        
        if ( self.hb_cancelHidesBottomBar && [self.hb_cancelHidesBottomBar containsObject:vcs] ) {
            //  如果有设置忽略底部隐藏的视图控制器则不隐藏
            viewController.hidesBottomBarWhenPushed = NO;
        } else {
            viewController.hidesBottomBarWhenPushed = YES;
        }
        
        HBWeakSelf(self)
        UIBarButtonItem *item = [UIBarButtonItem hb_backBarButtonBundle:HB_NAV_BACK_W target:weakself action:@selector(handleNavBackAction)];
        viewController.navigationItem.leftBarButtonItem = item;

        if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] ) {
            self.interactivePopGestureRecognizer.delegate = weakself;
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)handleNavBackAction {
    [self popViewControllerAnimated:YES];
}


#pragma mark -  递归查找导航栏底部横线
- (UIImageView *)hb_findBarBottomBaseLine {
    UIImageView *line = [self.navigationBar hb_findBottomBaseLine];
    
    return line;
}


#pragma mark -  兼容滚动视图的侧滑返回
- (UIScreenEdgePanGestureRecognizer *)hb_screenEdgePanGestureRecognizer {
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = nil;
    
    if ( self.view.gestureRecognizers.count > 0 ) { // 如果有手势的话
        for ( UIGestureRecognizer *item in self.view.gestureRecognizers) {
            if ( [item isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] ) {
                screenEdgePanGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)item;
                
                break;
            }
        }
    }
    
    return screenEdgePanGestureRecognizer;
}


#pragma mark    屏幕边缘滚动视图处理或者按上面的方法处理
- (void)hb_screenEdgePanGestureWithScrollView:(UIScrollView *)scrollView {
    UIScreenEdgePanGestureRecognizer *edge = [self hb_screenEdgePanGestureRecognizer];
    
    if ( edge ) { // 指定滑动手势在侧滑返回手势失效后响应
        [scrollView.panGestureRecognizer requireGestureRecognizerToFail:edge];
    }
}

@end
