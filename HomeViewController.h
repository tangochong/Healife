//
//  HomeViewController.h
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "NerveAreaSelectorViewController.h"
#import "HosSelectedViewController.h"


@interface HomeViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,NerveAreaSelectDelegate,HospitalSeDelegate>{
}
@property (weak, nonatomic) IBOutlet UITableView *DoctorNav;

//选择省市
@property (nonatomic,retain)   NSString *AreaName;
@property (nonatomic,retain)   NSString *selectArea;

//选择医院，医院详情
@property (nonatomic,retain)   NSString *hospitalName;
@property (nonatomic,retain)   NSString *selectHosName;

@property (nonatomic,retain)   NSString *docseName;


@end
