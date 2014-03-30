//
//  MainViewController.h
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController<UINavigationControllerDelegate>
{
    UIView *_tabbarView;
    UIImageView *_silderView;
    UIImageView *_badgeView;
}
-(void)showBadge:(BOOL)show;
-(void)showTabbar:(BOOL)show;
@end
