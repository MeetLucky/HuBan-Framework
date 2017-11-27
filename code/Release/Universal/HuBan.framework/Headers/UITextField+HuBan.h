//
//  UITextField+HuBan.h
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (HuBan)

/// 设置左侧图标并自定义输入框的边框圆角
- (void)hb_leftIconWithImage:(NSString *)imageName;

/// 设置占位提示文字颜色
- (void)hb_setPlaceholderColor:(UIColor *)color;

@end
