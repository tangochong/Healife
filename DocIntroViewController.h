//
//  DocIntroViewController.h
//  Healife
//
//  Created by zoro on 14-4-11.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"

@interface DocIntroViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *DocTableView;
@property (nonatomic,retain) NSArray *DoctorsArray;
@end
