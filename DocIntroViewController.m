//
//  DocIntroViewController.m
//  Healife
//
//  Created by zoro on 14-4-11.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "DocIntroViewController.h"
#import <Parse/Parse.h>


@interface DocIntroViewController ()

@end

@implementation DocIntroViewController

@synthesize DoctorsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"推荐医师";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super showHUD:@"正在加载...." isDim:YES];
    [self getDoctorNames];
}

-(void)getDoctorNames{
    PFQuery *query = [PFQuery queryWithClassName:@"Doctors"];
    [query orderByAscending:@"createAt"];
    self.DoctorsArray =   [query findObjects];
    [super hideHUD];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DoctorsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    PFObject *hobject = [self.DoctorsArray objectAtIndex:indexPath.row];
    //网络加载图片
    
    PFFile *image = (PFFile *)[hobject objectForKey:@"image"];
    cell.imageView.image =[UIImage imageWithData:image.getData];
    cell.textLabel.text = [hobject objectForKey:@"Name"];
    cell.detailTextLabel.text = [ hobject objectForKey:@"About"];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
