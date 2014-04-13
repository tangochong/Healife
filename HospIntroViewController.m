//
//  HospIntroViewController.m
//  Healife
//
//  Created by zoro on 14-3-30.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "HospIntroViewController.h"
#import <Parse/Parse.h>

@interface HospIntroViewController ()


@end

@implementation HospIntroViewController

@synthesize HospitalArray = _HospitalArray;
//@synthesize HospitalNames = _HospitalNames;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"推荐医院";
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [super showHUD:@"正在加载..." isDim:YES];
    [self getHospitalsName];
    
    // Do any additional setup after loading the view from its nib.
}


-(void) viewWillAppear:(BOOL)animated
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.HospitalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    PFObject *hobject = [self.HospitalArray objectAtIndex:indexPath.row];
    //网络加载图片
    PFFile *image = (PFFile *)[hobject objectForKey:@"HoImage"];
    cell.imageView.image =[UIImage imageWithData:image.getData];
    cell.textLabel.text = [hobject objectForKey:@"HoName"];
    cell.detailTextLabel.text = [ hobject objectForKey:@"About"];
    return cell;
}

-(void) getHospitalsName{
    PFQuery *query = [PFQuery queryWithClassName:@"Hospitals"];
    [query orderByDescending:@"createAt"];
//    _HospitalNames = [[NSMutableArray alloc] init];
    self.HospitalArray =   [query findObjects];
//    for (PFObject *hospiobject in self.HospitalArray) {
//        NSString *name = [hospiobject objectForKey:@"About"];
//        NSLog(@"object:%@",hospiobject);
//        [_HospitalNames  addObject:name];
//        NSLog(@"names:%@",_HospitalNames);
//    }
      [super hideHUD];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
