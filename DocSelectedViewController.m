//
//  DocSelectedViewController.m
//  Healife
//
//  Created by zoro on 14-4-27.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "DocSelectedViewController.h"
#import  <Parse/Parse.h>
@interface DocSelectedViewController ()

@end

@implementation DocSelectedViewController

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
    [self getSeDoctorNames];
    // Do any additional setup after loading the view from its nib.
}
-(void)getSeDoctorNames{
    PFQuery *query = [PFQuery queryWithClassName:@"Doctors"];
    [query orderByAscending:@"createAt"];
     [query whereKey:@"HoName" equalTo:self.hospitalName];
    [super showHUD:@"正在加载...." isDim:YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *object,NSError *error){
        self.seDoctorsArray = object;
        [self.DocSeViewCell reloadData];
        [super hideHUD];
    }];
    //    self.DoctorsArray =   [query findObjects];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.SeDoctorsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    PFObject *hobject = [self.SeDoctorsArray objectAtIndex:indexPath.row];
    //网络加载图片
    
    PFFile *image = (PFFile *)[hobject objectForKey:@"image"];
    cell.imageView.image =[UIImage imageWithData:image.getData];
    cell.textLabel.text = [hobject objectForKey:@"Name"];
    cell.detailTextLabel.text = [ hobject objectForKey:@"About"];
    return cell;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
