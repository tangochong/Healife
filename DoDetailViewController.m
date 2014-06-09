//
//  DoDetailViewController.m
//  Healife
//
//  Created by zoro on 14-4-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "DoDetailViewController.h"
#import "DoctorInfoView.h"
#import <Parse/Parse.h>
#import "DoctorModel.h"



@interface DoDetailViewController ()

@end

@implementation DoDetailViewController

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
    // Do any additional setup after loading the view from its nib.
    self.title = @"预约详情";
    self.doctorInfo = [[DoctorInfoView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    self.doctorimage.image = [UIImage imageNamed:@"icon.png"];
    self.detailimage.image = [UIImage imageNamed:@"zlz.png"];
//    [self loadDoctorData];
}

//
//-(void)loadDoctorData{
//    PFQuery *query = [PFQuery queryWithClassName:@"Doctors"];
//    [query orderByAscending:@"Number"];
//    
////    NSString *stringint = [NSString stringWithFormat:@"%d",self.Number];
//    NSLog(@"stinrg:%@",self.Name);
//    [query whereKey:@"Name" equalTo:self.Name];
//    [super showHUD:@"正在加载......" isDim:YES];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects,NSError *error){
//        NSMutableArray *myobjects = [NSMutableArray arrayWithArray:objects];
//        self.doctordetailArray = myobjects;
////        [self.doctordetailArray removeObject:@"image"];
//        
//        NSLog(@"array:%ld",self.doctordetailArray.count);
//        self.namedic = [self.doctordetailArray lastObject];
//        DoctorInfoView *info = [[DoctorInfoView alloc]init];
//        info.docdictionary = self.namedic;
//        NSLog(@"dic:%@",self.namedic);
//        [self loadDoctorDataFinish:self.namedic];
//
//        [super hideHUD];
//    }];
//    
//}


//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text = @"1111";
//    return  cell;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
