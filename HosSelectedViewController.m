//
//  HosSelectedViewController.m
//  Healife
//
//  Created by zoro on 14-4-20.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "HosSelectedViewController.h"
#import <Parse/Parse.h>
#import "HomeViewController.h"

@interface HosSelectedViewController ()

@end

@implementation HosSelectedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getSeHospitalName];
    // Do any additional setup after loading the view from its nib.
}

-(void) getSeHospitalName{

    PFQuery *query = [PFQuery queryWithClassName:@"Hospitals"];
    [query orderByDescending:@"createAt"];
    NSLog(@"%@",_hospitalName);
    [query whereKey:@"Province" equalTo:_AreaName];
    [query whereKey:@"City" equalTo:_selectArea];
    [super showHUD:@"正在加载..." isDim:YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *object,NSError *error){
        
        if (!error) {
            if (object != NULL) {
                self.SeHospitalArray = object;
                [super hideHUD];
                [self.SeHospital reloadData];
                NSLog(@"count:%ld",self.SeHospitalArray.count);
            }
            else{
                UIAlertView *nullAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"没有值" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [nullAlertView show];
            }
           
        }
        else{
            NSString *errorString = [[error userInfo]objectForKey:@"error"];
            NSLog(@"Error:%@",errorString);
        }
        
    }];

}

#pragma uitabledatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.SeHospitalArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    PFObject *hobject = [self.SeHospitalArray objectAtIndex:indexPath.row];
    //网络加载图片
    PFFile *image = (PFFile *)[hobject objectForKey:@"HoImage"];
    cell.imageView.image =[UIImage imageWithData:image.getData];
    cell.textLabel.text = [hobject objectForKey:@"HoName"];
    cell.detailTextLabel.text = [ hobject objectForKey:@"About"];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *namedic = [self.SeHospitalArray objectAtIndex:indexPath.row];
    NSString *name = [namedic objectForKey:@"HoName"];
    NSString *about = [namedic objectForKey:@"About"];
    [self.delegate getHospitalName:name :about];
    [self.navigationController popViewControllerAnimated:YES];
//    NSLog(@"tt%@",[self.SeHospitalArray objectAtIndex:indexPath.row]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
