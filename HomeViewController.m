//
//  HomeViewController.m
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "HomeViewController.h"
#import "UIFactory.h"
#import "HospIntroViewController.h"
#import "DoctorIntroViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.title = @"主页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   UIButton *locationBut = [UIFactory createButtonWithBackground:@"compose_locatebutton_background.png" backgroundHighlighted:@"compose_locatebutton_background_highlighted.png"];
    locationBut.frame = CGRectMake(0, 0, 34, 27);
    [locationBut addTarget:self action:@selector(getlocation) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *locationItem = [[UIBarButtonItem alloc] initWithCustomView:locationBut];
    self.navigationItem.leftBarButtonItem =locationItem;
//    UISearchBar *mySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 69, 260, 27)];
//    
//    mySearchBar.delegate = self;
//    [self.view addSubview:mySearchBar];
}
-(void)getlocation
{
    NSLog(@"定位");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else{
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    if (indexPath.section == 0 &&indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"推荐医院";
        cell.detailTextLabel.text = @"选择进入医院详情";
        [cell.imageView setImage:[UIImage imageNamed:@"default_hospital_cell.png"]];
    }
    else if(indexPath.section == 0 &&indexPath.row == 1)
    {
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"热门医师";
        cell.detailTextLabel.text = @"选择进入医生详情";
        [cell.imageView setImage:[UIImage imageNamed:@"default_hospital_cell.png"]];

    }
    else if(indexPath.section == 1 &&indexPath.row == 0){
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"地区选择";
        cell.detailTextLabel.text = @"选择就医地点";
        [cell.imageView setImage:[UIImage imageNamed:@"page_image_loading.png"]];
    }
    else if(indexPath.section == 1 &&indexPath.row == 1){
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"医院选择";
        cell.detailTextLabel.text = @"选择就医医院";
        [cell.imageView setImage:[UIImage imageNamed:@"page_image_loading.png"]];
    }
    else if(indexPath.section == 1 &&indexPath.row == 2){
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"科室选择";
        cell.detailTextLabel.text = @"选择医院科室";
        [cell.imageView setImage:[UIImage imageNamed:@"page_image_loading.png"]];
    }

    return cell;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
         return @"就医导航";
    }
    else{
        return @"选择去处";
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        HospIntroViewController *hospital = [[HospIntroViewController alloc] init];
        [self.navigationController pushViewController:hospital animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }else if(indexPath.section == 0 && indexPath.row == 1){
        DoctorIntroViewController *doctor = [[DoctorIntroViewController alloc]init];
        [self.navigationController pushViewController:doctor animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//}
@end
