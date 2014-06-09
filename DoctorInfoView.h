//
//  DoctorInfoView.h
//  Healife
//
//  Created by zoro on 14-4-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DoctorModel;
@interface DoctorInfoView : UIView

@property(nonatomic,retain) DoctorModel *doctorModel;
@property(nonatomic,assign) int Number;
@property (weak, nonatomic) IBOutlet UIImageView *DoctorImage;
@property (weak, nonatomic) IBOutlet UILabel *DoctorName;
@property (weak, nonatomic) IBOutlet UILabel *DoctorTitle;
@property (weak, nonatomic) IBOutlet UILabel *DoctorEducation;
@property (weak, nonatomic) IBOutlet UILabel *DoctorWorkAge;
@property (weak, nonatomic) IBOutlet UILabel *DoctorClass;
@property (weak, nonatomic) IBOutlet UILabel *ReserveCount;
@property (nonatomic,retain) NSDictionary *docdictionary;

@end
