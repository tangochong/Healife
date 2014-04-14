//
//  HospIntroViewController.h
//  Healife
//
//  Created by zoro on 14-3-30.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"

@interface HospIntroViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *HosIntroName;
@property (nonatomic,retain) NSArray *HospitalArray;
//@property (nonatomic,retain) NSMutableArray *HospitalNames;
@end
