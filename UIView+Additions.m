//
//  UIView+Additions.m
//  zobo
//
//  Created by zoro on 14-2-28.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

-(UIViewController *) viewController
{
    //下一个响应者
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

@end
