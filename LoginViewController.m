//
//  LoginViewController.m
//  Healife
//
//  Created by zoro on 14-3-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "LoginViewController.h"
#import "BZGFormField.h"
#import "SignUpViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.Name.textField.placeholder = @"Email";
    __weak LoginViewController *weakSelf = self;
    [self.Name setTextValidationBlock:^BOOL(NSString *text) {
        // from https://github.com/benmcredmond/DHValidation/blob/master/DHValidation.m
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        if (![emailTest evaluateWithObject:text]) {
            weakSelf.Name.alertView.title = @"Invalid email address";
            return NO;
        } else {
            return YES;
        }
    }];
    self.Name.delegate = self;
    
    self.passWord.textField.placeholder = @"Password";
    self.passWord.textField.secureTextEntry = YES;
    [self.passWord setTextValidationBlock:^BOOL(NSString *text) {
        if (text.length < 8) {
            weakSelf.passWord.alertView.title = @"Password is too short";
            return NO;
        } else {
            return YES;
        }
    }];
    self.passWord.delegate = self;
}
#pragma mark - BZGFormFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SignUp:(UIButton *)sender {
    SignUpViewController *signup = [[SignUpViewController alloc]init];
    [self.navigationController pushViewController:signup animated:YES];
}
@end
