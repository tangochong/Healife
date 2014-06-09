//
//  DetailTitleViewController.m
//  Healife
//
//  Created by zoro on 14-5-26.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "DetailTitleViewController.h"

@interface DetailTitleViewController ()

@end

@implementation DetailTitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"健康大讲堂";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
