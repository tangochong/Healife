//
//  AppDelegate.h
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "DDMenuController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain) MainViewController *mainCtrl;
@property (nonatomic,retain) DDMenuController *menuCtrl;

@end
