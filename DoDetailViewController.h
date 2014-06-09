//
//  DoDetailViewController.h
//  Healife
//
//  Created by zoro on 14-4-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"

@class DoctorInfoView;
@interface DoDetailViewController : BaseViewController


@property(nonatomic,retain) DoctorInfoView *doctorInfo;
@property(nonatomic,assign) int Number;
@property (weak, nonatomic) IBOutlet UIImageView *doctorimage;
@property (weak, nonatomic) IBOutlet UIImageView *detailimage;
@property (nonatomic,retain) NSString *Name;
@property (nonatomic,retain) NSMutableArray *doctordetailArray;
@property (nonatomic,retain) NSDictionary *namedic;

@end
