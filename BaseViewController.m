//
//  BaseViewController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "UIFactory.h"
#import "MBProgressHUD.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.isBackButton = YES;
        self.isCancelButton = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 1 && self.isBackButton) {
        UIButton *button = [UIFactory createButton:@"navigationbar_back.png" highlighted:@"navigationbar_back_highlighted.png"];
        button.showsTouchWhenHighlighted = YES;
        button.frame = CGRectMake(0, 0, 24, 24);
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = backItem;
    }
    
    if (self.isCancelButton) {
        UIButton *button = [UIFactory createNavicationButton:CGRectMake(0, 0, 45, 30) title:@"取消" target:self action:@selector(cancelAction)];
        UIBarButtonItem *cancelbutton = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = cancelbutton;
    }
    
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)cancelAction
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)showLoad:(BOOL)show{
    if (_lodaView == nil) {
        _lodaView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight/2-80,ScreenWidth, 20)];
        //loading view
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activityView startAnimating];
        //正在加载文字
        UILabel *loadlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        loadlabel.backgroundColor = [UIColor clearColor];
        loadlabel.text = @"正在加载....";
        loadlabel.font = [UIFont boldSystemFontOfSize:16.0f];
        loadlabel.textColor = [UIColor blackColor];
        [loadlabel sizeToFit];
        loadlabel.left = (320-loadlabel.width)/2;
        activityView.right = loadlabel.left - 5;
        [_lodaView addSubview:loadlabel];
        [_lodaView addSubview:activityView];
    }
    if (show) {
        if (![_lodaView superview]) {
            [self.view addSubview:_lodaView];
        }
    }else{
        [_lodaView removeFromSuperview];
    }
}

-(void)showHUD:(NSString *)titile isDim:(BOOL)isDim{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.dimBackground = isDim;
    self.hud.labelText = titile;
}
-(void) hideHUD{
    [self.hud hide:YES];
}
-(void)showHUDComplete:(NSString *)title{
    self.hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    self.hud.mode = MBProgressHUDModeCustomView;
    if (title.length > 0 ) {
        self.hud.labelText = title;
    }
    [self.hud hide:YES afterDelay:1];
}

-(void) showStatusTip:(BOOL)show title:(NSString *)title{
    if (_tipWindow == nil) {
        _tipWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        _tipWindow.windowLevel = UIWindowLevelStatusBar;
        _tipWindow.backgroundColor = [UIColor blackColor];
        UILabel *tiplabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        tiplabel.textAlignment = NSTextAlignmentCenter;
        tiplabel.font = [UIFont systemFontOfSize:13];
        tiplabel.textColor = [UIColor clearColor];
        tiplabel.tag = 2014;
        [_tipWindow addSubview:tiplabel];
        UIImageView *progress = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"queue_statusbar_progress.png"]];
        progress.frame = CGRectMake(0, 20-6, 100, 6);
        progress.tag  = 2013;
        [_tipWindow addSubview:progress];
    }
    UIImageView *progress = (UIImageView *)[_tipWindow viewWithTag:2013];
    UILabel *tiplabel = (UILabel *)[_tipWindow viewWithTag:2014];
    if (show) {
        tiplabel.text = title;
        _tipWindow.hidden = NO;
        progress.left = 0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:2];
        [UIView setAnimationRepeatCount:1000];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        progress.left = ScreenWidth;
        [UIView commitAnimations];
    }else{
        progress.hidden = YES;
        tiplabel.text = title;
        [self performSelector:@selector(removeTipwindow) withObject:nil afterDelay:1.5];
    }
}
-(void)removeTipwindow{
    _tipWindow.hidden = YES;
    _tipWindow = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
