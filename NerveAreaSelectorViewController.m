//
//  NerveAreaSelectorViewController.m
//  BUS966800
//  用于目的地选择的控件
//  Created by chonour on 13-5-17.
//  Copyright (c) 2013年 chonour. All rights reserved.
//

#import "NerveAreaSelectorViewController.h"

@interface NerveAreaSelectorViewController ()
    
@end

@implementation NerveAreaSelectorViewController

@synthesize areaTX;
@synthesize cannelBtn;
@synthesize okBtn;
@synthesize areaTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithDelegate:(id<NerveAreaSelectDelegate>)targetDelegate{
    delegate = targetDelegate;
    
    [self readData];
    
    selectType = PROVINCE;
    self.navigationController.navigationBarHidden = NO;
    self.title = @"ssss";
    
    
    UIBarButtonItem* leftB = [[UIBarButtonItem alloc] init];
    leftB.title = @"ss";
    self.navigationItem.backBarButtonItem = leftB;
    
    return self;
}

-(void) readData{
    provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil]];
    NSLog(@"tt%@",province);
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.areaTX.placeholder = @"手动输入目的地...";
    province = @"";
    city = @"";
    area = @"";
    selectType = PROVINCE;
    [self initWithDelegate:delegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 ======================================
 BEGIN 表格接口 实现
 ======================================
 */

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (selectType) {
        case PROVINCE:
            return [provinces count];
        case CITY:
            return [cities count];
        default:
            return [areas count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    //int section = [indexPath section];
    static NSString* CustomCellIdentifier = @"NerveAreaSelectorCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CustomCellIdentifier];
    }
    
    switch (selectType) {
        case PROVINCE:
            cell.textLabel.text = [[provinces objectAtIndex:index]
                                   objectForKey:@"State"];
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case CITY:
            cell.textLabel.text = [[cities objectAtIndex:index]
                                   objectForKey:@"city"];
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        default:
            cell.textLabel.text = [areas objectAtIndex:index];
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"选择目的地";
}

//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 78.0;
//}

//表格被选择
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger selectIndex = [indexPath row];
    NSInteger cellCount = 0;
    switch (selectType) {
        case PROVINCE:
            province = [[provinces objectAtIndex:selectIndex] objectForKey:@"State"];
            cities = [[provinces objectAtIndex:selectIndex] objectForKey:@"Cities"];
            
            selectType = CITY;
            cellCount = [cities count];
            [areaTableView reloadData];
            break;
            
        case CITY:
            city = [[cities objectAtIndex:selectIndex] objectForKey:@"city"];
            areas = [[cities objectAtIndex:selectIndex] objectForKey:@"lat"];
//            selectType = AREA;
//            cellCount = [areas count];
            break;
            
        default:
            area = [areas objectAtIndex:selectIndex];
            break;
    }
    NSString* areaValue = [NSString stringWithFormat:@"%@ %@ %@",province, city,area];
    NSLog(@"select=%@", areaValue);
    self.areaTX.text = areaValue;
    if(cellCount > 0){
        NSIndexPath* topIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        [areaTableView scrollToRowAtIndexPath:topIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

/*
 ======================================
 END 表格接口 实现
 ======================================
 */

- (void)viewDidUnload {
    [self setCannelBtn:nil];
    [self setAreaTX:nil];
    [self setOkBtn:nil];
    [self setAreaTableView:nil];
    [super viewDidUnload];
}
- (IBAction)onOkBtnClick:(id)sender {
    NSLog(@"OK click");
    [delegate onAreaSelect:areaTX.text];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)okCannelBtnClick:(id)sender {
    [delegate onAreaCannel];
}

- (IBAction)exitInput:(id)sender {
    [sender resignFirstResponder];
}
@end
