//
//  HBBaseNavController.h
//  LoggerTech
//
//  Created by MeetLucky on 2017/10/8.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBBaseNavController : UINavigationController <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

/// 忽略底部标签栏隐藏的视图控制器类名数组
@property (strong, nonatomic) NSArray *hb_cancelHidesBottomBar;


#pragma mark -  导航栏为透明时可能需要用到
/// 导航栏为透明时可能需要用到
- (UIImageView *)hb_findBarBottomBaseLine;


#pragma mark -  视图控制器中包含滚动视图导致侧滑返回失效处理
/**
 视图控制器中包含滚动视图导致侧滑返回失效处理
 
 使用方法:
- (void)viewDidLoad {
	[super viewDidLoad];
 
    // 视图加载时间中添加如下代码
	HBBaseNavController *nav = (HBBaseNavController *)self.navigationController;
 
     UIScreenEdgePanGestureRecognizer *edge = [nav screenEdgePanGestureRecognizer];
     if ( edge ) { // 指定滑动手势在侧滑返回手势失效后响应
         [self.scrollView.panGestureRecognizer requireGestureRecognizerToFail:edge];
     }
 
     ...
}

 @return 获取屏幕边缘滑动手势
 */
- (UIScreenEdgePanGestureRecognizer *)hb_screenEdgePanGestureRecognizer;


#pragma mark -  屏幕边缘滚动视图处理或者按上面的方法处理
/// 屏幕边缘滚动视图处理或者按上面的方法处理
- (void)hb_screenEdgePanGestureWithScrollView:(UIScrollView *)scrollView;

@end
