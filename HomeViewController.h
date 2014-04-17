//
//  HomeViewController.h
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "NerveAreaSelectorViewController.h"

@interface HomeViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,NerveAreaSelectDelegate>
@property (weak, nonatomic) IBOutlet UITableView *DoctorNav;


@end
