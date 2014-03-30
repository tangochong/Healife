//
//  BaseViewController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "UIFactory.h"

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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
