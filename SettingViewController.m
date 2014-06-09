//
//  SettingViewController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"设置";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return 3;
    } else if (section == 2){
        return 3;
    } else
    {
        return 1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.row==0 &&indexPath.section == 0) {
        cell.textLabel.text = @"我的预约单";
    }
    else if(indexPath.section == 1 && indexPath.row == 0){
        cell.textLabel.text = @"就诊人管理";
    }else if(indexPath.section == 1&&indexPath.row == 1){
        cell.textLabel.text = @"账号信息";
    }else if (indexPath.section == 1&&indexPath.row == 2){
        cell.textLabel.text = @"修改密码";
    }else if (indexPath.section == 2 && indexPath.row == 0){
        cell.textLabel.text = @"意见反馈";
    }else if (indexPath.section == 2 && indexPath.row == 1){
         cell.textLabel.text = @"给我们评分";
    }else if (indexPath.section == 2 && indexPath.row == 2){
         cell.textLabel.text = @"关于";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1&&indexPath.row == 1) {
        LoginViewController *loginView = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:loginView animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
