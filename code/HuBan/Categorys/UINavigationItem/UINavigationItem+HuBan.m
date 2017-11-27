//
//  UINavigationItem+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/12.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UINavigationItem+HuBan.h"

@implementation UINavigationItem (HuBan)

- (void)hb_leftItemWithImage:(UIImage *)image  target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame           = CGRectMake(0, 0, 40, 40);;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [button  setImage:image  forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    //  手势返回
    UIViewController *controller = (UIViewController *)target;
    controller.navigationController.interactivePopGestureRecognizer.delegate = target;
}
- (void)hb_rightItemWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame           = CGRectMake(0, 0, 40, 40);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    [button  setImage:image  forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}


- (void)hb_leftItemWithImageName:(NSString *)name  target:(id)target action:(SEL)action {
    [self hb_leftItemWithImage:[UIImage imageNamed:name] target:target action:action];
}
- (void)hb_rightItemWithImageName:(NSString *)name target:(id)target action:(SEL)action {
    [self hb_rightItemWithImage:[UIImage imageNamed:name] target:target action:action];
}


- (void)hb_leftItemWithTitle:(NSString *)title  target:(id)target action:(SEL)action {
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14]};
    
    [self.leftBarButtonItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    [self.leftBarButtonItem setTitleTextAttributes:attr forState:UIControlStateHighlighted];
}


#pragma mark    自定义导航栏右侧文字按钮
- (void)hb_rightItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14]};
    
    [self.rightBarButtonItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    [self.rightBarButtonItem setTitleTextAttributes:attr forState:UIControlStateHighlighted];
}

@end
