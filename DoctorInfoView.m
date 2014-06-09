//
//  DoctorInfoView.m
//  Healife
//
//  Created by zoro on 14-4-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "DoctorInfoView.h"
#import "DoctorModel.h"

@implementation DoctorInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"DoctorInfoView" owner:self options:nil] lastObject];
        [self addSubview:view];
        self.size = view.size;
           }
    return self;
}

-(void) layoutSubviews{
    [super layoutSubviews];
//    NSLog(@"%@",self.doctorModel);
    NSLog(@"asdfjasdfasd%@",self.docdictionary);

    //头像
//    [self.DoctorImage setImage:[UIImage imageWithData:self.doctorModel.image.getData]];
    //姓名
    self.DoctorName.text = self.doctorModel.Name;
    //职称
    self.DoctorTitle.text = self.doctorModel.Title;
    //学历
    self.DoctorEducation.text = self.doctorModel.Education;
    //工龄
    self.DoctorWorkAge.text = self.doctorModel.WorkAge;
    //擅长领域
    self.DoctorClass.text = self.doctorModel.Class;
    //预约数量
    self.ReserveCount.text = self.doctorModel.ReserverCount;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
