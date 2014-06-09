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
#import "DocIntroViewController.h"
#import "NerveAreaSelectorViewController.h"
#import "HosSelectedViewController.h"
#import "DocSelectedViewController.h"

@interface HomeViewController ()


@end


@implementation HomeViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"欢迎登录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.search resignFirstResponder];
    _AreaName = @"地区选择";
    _selectArea = @"选择就医地点";
    _hospitalName = @"医院选择";
    _selectHosName = @"选择就医医院";
    _docseName = @"医师选择";
    // ;Do any additional setup after loading the view from its nib.
   UIButton *locationBut = [UIFactory createButtonWithBackground:@"compose_locatebutton_background.png" backgroundHighlighted:@"compose_locatebutton_background_highlighted.png"];
    locationBut.frame = CGRectMake(0, 0, 34, 27);
    [locationBut addTarget:self action:@selector(getlocation) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *locationItem = [[UIBarButtonItem alloc] initWithCustomView:locationBut];
    self.navigationItem.leftBarButtonItem =locationItem;
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
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
        cell.textLabel.text = _AreaName;
        cell.detailTextLabel.text = _selectArea;
        [cell.imageView setImage:[UIImage imageNamed:@"default_hospital_cell.png"]];
    }
    else if(indexPath.section == 1 &&indexPath.row == 1){
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = _hospitalName;
        cell.detailTextLabel.text = _selectHosName;
        [cell.imageView setImage:[UIImage imageNamed:@"default_hospital_cell.png"]];
    }
    else if(indexPath.section == 1 &&indexPath.row == 2){
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"医师选择";
        cell.detailTextLabel.text = @"选择医院医师";
        [cell.imageView setImage:[UIImage imageNamed:@"default_hospital_cell.png"]];
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
        DocIntroViewController *doctor = [[DocIntroViewController alloc]init];
        [self.navigationController pushViewController:doctor animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }else if(indexPath.section == 1 && indexPath.row == 0){
        NerveAreaSelectorViewController *nerveArea = [[NerveAreaSelectorViewController alloc]init];
        nerveArea.delegate = self;
        [self presentViewController:nerveArea animated:YES completion:^{
            NSLog(@"call back");
        }];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 1){
        if ([_AreaName isEqualToString:@"地区选择"]) {
            UIAlertView *selectalert =[[UIAlertView alloc]initWithTitle:@"警告" message:@"您还没有选择地区！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [selectalert show];
        } else{
            HosSelectedViewController *hoselect  = [[HosSelectedViewController alloc] init];
            hoselect.AreaName = _AreaName;
            hoselect.selectArea = _selectArea;
            hoselect.delegate = self;
            [self.navigationController pushViewController:hoselect animated:YES];
        }
       
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 2){
        if ([_hospitalName  isEqualToString: @"医院选择"]) {
            UIAlertView *selectalert =[[UIAlertView alloc]initWithTitle:@"警告" message:@"您还没有选择医院！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [selectalert show];
        } else{
        DocSelectedViewController *docse = [[DocSelectedViewController alloc]init];
        docse.hospitalName = _hospitalName;
        [self.navigationController pushViewController:docse animated:YES];
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//}

#pragma neverdelegate
-(void)changeLabelText:(NSString *)text{
    NSLog(@"%@",text);
    if (text != nil) {
        NSArray *array = [text componentsSeparatedByString:@" "];
        _AreaName = [array objectAtIndex:0];
        _selectArea = [array objectAtIndex:1];
        [self.DoctorNav reloadData];
    }
   
}
-(void) getHospitalName:(NSString *) name :(NSString *) about
{
    NSLog(@"%@",name);
    if (name != nil) {
        _hospitalName = name;
        _selectHosName = about;
        [self.DoctorNav reloadData];
    }

}


@end
