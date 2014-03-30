//
//  LoginViewController.h
//  Healife
//
//  Created by zoro on 14-3-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "BZGFormField.h"

@protocol BZGFormFieldDelegate;


@interface LoginViewController : BaseViewController<BZGFormFieldDelegate>
@property (weak, nonatomic) IBOutlet BZGFormField *Name;
@property (weak, nonatomic) IBOutlet BZGFormField *passWord;
- (IBAction)SignUp:(UIButton *)sender;

@end
