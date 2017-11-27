//
//  UINavigationBar+HuBan.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/9.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "UINavigationBar+HuBan.h"

@implementation UINavigationBar (HuBan)

#pragma mark -  递归查找导航栏下面的细黑线
- (UIImageView *)hb_findBottomBaseLine {
    return [self findBottomLineView:self];
}

- (UIImageView *)findBottomLineView:(UIView *)view {
    if ( [view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0 ) {
        return (UIImageView *)view;
    }
    
    for ( UIView *item in view.subviews ) {
        // 递归查找
        UIImageView *imageView = [self findBottomLineView:item];
        if ( imageView ) {
            return imageView;
        }
    }
    
    return nil;
}

@end
