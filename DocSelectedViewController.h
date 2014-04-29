//
//  DocSelectedViewController.h
//  Healife
//
//  Created by zoro on 14-4-27.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"

@interface DocSelectedViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *DocSeViewCell;
@property (nonatomic,retain) NSArray  *SeDoctorsArray;
@property (nonatomic,retain)   NSString *hospitalName;
@end
