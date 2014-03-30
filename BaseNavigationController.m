//
//  BaseNavigationController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManger.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadThemeImage];
    
    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    swipGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipGesture];
}
#pragma mark - actoins
-(void)swipAction:(UISwipeGestureRecognizer *)gesutre
{
    if(self.viewControllers.count > 1)
    {
        if (gesutre.direction == UISwipeGestureRecognizerDirectionRight) {
            [self popViewControllerAnimated:YES];
        }
    }
}

#pragma mark - NSNotification actions
- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
}
- (void)loadThemeImage {
        UIImage *image = [[ThemeManger shareInstance] getThemeImage:@"Bake.png"];
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
