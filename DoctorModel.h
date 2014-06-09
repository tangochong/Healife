//
//  DoctorModel.h
//  Healife
//
//  Created by zoro on 14-4-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "WXBaseModel.h"
#import <Parse/Parse.h>

@interface DoctorModel : WXBaseModel

@property(nonatomic,copy) NSString *Name; //医生姓名
@property(nonatomic,assign) NSNumber *Number;
@property(nonatomic,copy) NSString *Class;
@property(nonatomic,copy) NSString *HoName;
//@property(nonatomic,copy) PFFile *image;
@property(nonatomic,copy) NSString *Title;
@property(nonatomic,copy) NSString *Education;
@property(nonatomic,copy) NSString *Hospital;
@property(nonatomic,copy) NSString *WorkAge;
@property(nonatomic,copy) NSString *ReserverCount;
@property(nonatomic,copy) NSString *Talent;
@property(nonatomic,copy) NSString *About;
@end
