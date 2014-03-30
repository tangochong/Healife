//
//  SignUpViewController.m
//  Healife
//
//  Created by zoro on 14-3-29.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SignUpButton:(UIButton *)sender {
    PFUser *user = [PFUser user];
    user.username = self.NameField.textField.text;
    user.password = self.PasswordField.textField.text;
//    [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
    [user signUpInBackgroundWithBlock:^(BOOL successed,NSError *error){
        if (!error) {
            NSLog(@"successful");
        }
        else{
            NSString *errorString = [[error userInfo]objectForKey:@"error"];
            UIAlertView *errorAlerView = [[UIAlertView alloc] initWithTitle:@"error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [errorAlerView show];
        }
    }];
    
}
@end
