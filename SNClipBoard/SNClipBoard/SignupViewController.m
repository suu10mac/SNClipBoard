//
//  SignupViewController.m
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

#pragma mark- ---------------------View Lifecycle-----------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    viw_page2.hidden=YES;
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
#pragma mark- -------------------Button Control Functions------------------
-(IBAction)btn_back:(id)sender
{
    if ([sender tag]==0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        viw_page2.hidden=YES;
    }
}
-(IBAction)btn_done:(id)sender
{
    if ([sender tag]==0) {
        viw_page2.hidden=NO;
    }
    else
    {
        //Submit and show discover page
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
        TimelineViewController *viw_timeline=
        [storyboard instantiateViewControllerWithIdentifier:@"timeline"];
        
        [self presentViewController:viw_timeline
                           animated:YES
                         completion:nil];
    }
}
#pragma mark- ------------------Uitext field Deleagte------------------------
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
