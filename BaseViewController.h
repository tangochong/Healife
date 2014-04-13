//
//  BaseViewController.h
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MBProgressHUD;
@interface BaseViewController : UIViewController{
    UIView *_lodaView;
    UIWindow *_tipWindow;
}



@property(nonatomic,assign) BOOL isBackButton;
@property(nonatomic,assign) BOOL isCancelButton;
@property(nonatomic,assign) MBProgressHUD *hud;

//提示
-(void) showLoad:(BOOL) show;
-(void) showHUD:(NSString *)titile isDim:(BOOL)isDim;
-(void) hideHUD;
-(void) showHUDComplete:(NSString *)title;
//状态栏的提示
-(void) showStatusTip:(BOOL)show title:(NSString *)title;
@end
