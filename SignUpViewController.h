//
//  SignUpViewController.h
//  Healife
//
//  Created by zoro on 14-3-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "BaseViewController.h"
#import "BZGFormField.h"

@interface SignUpViewController : BaseViewController
@property (weak, nonatomic) IBOutlet BZGFormField *NameField;
@property (weak, nonatomic) IBOutlet BZGFormField *PasswordField;
@property (weak, nonatomic) IBOutlet BZGFormField *ConfirmPassField;
- (IBAction)SignUpButton:(UIButton *)sender;

@end
