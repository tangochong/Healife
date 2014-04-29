//
//  HosSelectedViewController.h
//  Healife
//
//  Created by zoro on 14-4-20.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "NerveAreaSelectorViewController.h"

@protocol HospitalSeDelegate <NSObject>

@optional
-(void) getHospitalName:(NSString *) name :(NSString *) about;
@end

@interface HosSelectedViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *SeHospital;
@property (nonatomic,retain) NSArray *SeHospitalArray;
@property (nonatomic,retain) NSArray *AreaArray;
@property (nonatomic,retain)   NSString *AreaName;
@property (nonatomic,retain)   NSString *selectArea;
@property (nonatomic,retain)   NSString *hospitalName;
@property (nonatomic,retain)   NSString *selectHosName;
@property (nonatomic,assign) id <HospitalSeDelegate> delegate;

@end
