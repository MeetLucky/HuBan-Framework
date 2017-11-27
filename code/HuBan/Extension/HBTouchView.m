//
//  HBTouchView.m
//  HuBan
//
//  Created by MeetLucky on 2017/10/10.
//  Copyright © 2017年 杭州互办网络科技有限公司. All rights reserved.
//

#import "HBTouchView.h"

@implementation HBTouchView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
    
    [super touchesBegan:touches withEvent:event];
}

@end
