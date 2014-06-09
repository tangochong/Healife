//
//  MainViewController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "ReservationViewController.h"
#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "ThemeButton.h"
#import "UIFactory.h"
#import "UIViewExt.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
          [self.tabBar setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self _initViewController];
    [self _initTabbarView];
    //每60秒请求未读数接口
    //[NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];

}
-(void)showBadge:(BOOL)show
{
    _badgeView.hidden = !show;
}
-(void)showTabbar:(BOOL)show
{
    [UIView animateWithDuration:0.35 animations:^{
        if (show) {
            _tabbarView.left = 0;
        } else
        {
            _tabbarView.left = -ScreenWidth;
        }
    }];
    [self _resizeView:show];
}

-(void) _resizeView:(BOOL)showTabbar
{
    for (UIView *subView in self.view.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            if (showTabbar) {
                subView.height = ScreenHeight - 49;
            }else
            {
                subView.height = ScreenHeight;
            }
        }
    }
}

-(void) _initViewController{
    HomeViewController *home = [[HomeViewController alloc] init];
    ReservationViewController *reserva = [[ReservationViewController alloc]init];
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    SettingViewController *setting = [[SettingViewController alloc]init];
    NSArray *views = @[home,reserva,profile,setting];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:4];
    for (UIViewController *viewController in views) {
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:nav];
        nav.delegate = self;
    }
    self.viewControllers = viewControllers;
}
//创建自定义tabBar
- (void)_initTabbarView {
    _tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0,ScreenHeight-49, ScreenWidth, 49)];
    [self.view addSubview:_tabbarView];
    
    UIImageView *tabbarGroundImage = [UIFactory createImageView:@"tabbar_background.png"];
    tabbarGroundImage.frame = _tabbarView.bounds;
    [_tabbarView addSubview:tabbarGroundImage];
    NSArray *background = @[@"tabbar_home.png",@"tabbar_message_center.png",@"tabbar_profile2.png",@"tabbar_more.png"];
    NSArray *heightBackground = @[@"tabbar_home_highlighted.png",@"tabbar_message_center_highlighted.png",@"tabbar_profile_highlighted2.png",@"tabbar_more_highlighted.png"];
    for (int i=0; i<background.count; i++) {
        NSString *backImage = background[i];
        NSString *heightImage = heightBackground[i];
        ThemeButton *button = [[ThemeButton alloc] initWithImage:backImage highlighted:heightImage];
        button.showsTouchWhenHighlighted = YES;
        button.frame = CGRectMake((80-30)/2+(i*80), (49-30)/2, 30, 30);
        button.tag = i;
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
    _silderView = [UIFactory createImageView:@"tabbar_slider.png"];
    _silderView.backgroundColor = [UIColor clearColor];
    _silderView.frame = CGRectMake((64-15)/2, 5, 15, 44);
    [_tabbarView addSubview:_silderView];

}
- (void)selectedTab:(UIButton *)button {
    
  
    float x = button.left + (button.width-_silderView.width)/2;
    [UIView animateWithDuration:0.2 animations:^{
        _silderView.left = x;
    }];
    self.selectedIndex = button.tag;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UINavigationController delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //导航控制器的子控制器的个数
    long count = navigationController.viewControllers.count;
    if (count == 2) {
        [self showTabbar:NO];
    }
    else if (count == 1)
    {
        [self showTabbar:YES];
    }
}

@end
