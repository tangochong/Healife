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
@synthesize HospitalNames = _HospitalNames;

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
}
-(void) viewWillAppear:(BOOL)animated
{
    [self getHospitalsName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
//    PFObject *Hospitals = (PFObject *)self.HospitalArray;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
//            PFFile *image = (PFFile *)[Hospitals objectForKey:@"HoImage"];
//        
//            cell.imageView.image =[UIImage imageWithData:image.getData];
//            NSLog(@"%@",image);
       cell.textLabel.text =  [_HospitalNames objectAtIndex:indexPath.row];
//        NSLog(@"is %@",[_HospitalNames objectAtIndex:indexPath.row]);

    }
        return cell;
}

-(void) getHospitalsName{
    PFQuery *query = [PFQuery queryWithClassName:@"Hospitals"];
    [query orderByDescending:@"createAt"];
    _HospitalNames = [[NSMutableArray alloc] init];
    self.HospitalArray =   [query findObjects];
    for (PFObject *hospiobject in self.HospitalArray) {
        NSString *name = [hospiobject objectForKey:@"About"];
        NSLog(@"object:%@",hospiobject);
        [_HospitalNames  addObject:name];
        NSLog(@"names:%@",_HospitalNames);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
