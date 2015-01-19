//
//  LoginViewController.m
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark- --------------------View Lifecycle-------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    secure_show=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark- ------------------Custom Control Functions----------------------
-(IBAction)btn_back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)btn_done:(id)sender
{
    //Process with the login API
    //Submit and show discover page
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    TimelineViewController *viw_timeline=
    [storyboard instantiateViewControllerWithIdentifier:@"timeline"];
    
    [self presentViewController:viw_timeline
                       animated:YES
                     completion:nil];

}
-(IBAction)btn_fgtPassword:(id)sender
{
    
}
-(IBAction)btn_show_entry:(id)sender
{
    if (secure_show==NO) {
        txt_password.secureTextEntry=NO;
        secure_show=YES;
    }
    else
    {
        txt_password.secureTextEntry=YES;
        secure_show=NO;
    }
   
}
#pragma mark- -----------------TextField Delegate-----------------------------
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
