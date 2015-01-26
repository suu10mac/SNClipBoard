//
//  LoginViewController.m
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import "LoginViewController.h"
#import "ALAlertBanner.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark- --------------------View Lifecycle-------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    secure_show=NO;
    [txt_password addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
    
    NSString *str_username=[NSString stringWithFormat:@"%@",txt_username.text];
    NSString *str_password=[NSString stringWithFormat:@"%@",txt_password.text];
    //Process with the login API
    //Submit and show discover page
    if (str_username.length==0 || str_password.length==0)
    {
        if (str_password.length==0) {
            ALAlertBannerPosition position = ALAlertBannerPositionTop;
            ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
            ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please enter Password" tappedBlock:^(ALAlertBanner *alertBanner) {
                NSLog(@"tapped!");
                [alertBanner hide];
            }];
            banner.secondsToShow = 3.5;
            banner.showAnimationDuration = 0.25;
            banner.hideAnimationDuration = 0.25;
            [banner show];
        }
        else if(str_username.length==0)
        {
            ALAlertBannerPosition position = ALAlertBannerPositionTop;
            ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
            ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please enter Username" tappedBlock:^(ALAlertBanner *alertBanner) {
            NSLog(@"tapped!");
            [alertBanner hide];
            }];
            banner.secondsToShow = 3.5;
            banner.showAnimationDuration = 0.25;
            banner.hideAnimationDuration = 0.25;
            [banner show];
        }
    }
    else
    {
        [APP.window bringSubviewToFront:APP.Alertview];
        [APP.Alertview setHidden:NO];
        [APP.activity startAnimating];
        [APP.lbl setText:@"Loading.."];
        dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //this will start the image loading in bg
        dispatch_async(concurrentQueue, ^{
            
            NSURL *strUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%slogin.php?u_name=%@&password=%@",kServerUrl,str_username,[str_password md5]]];
            NSLog(@"the url is:%@",strUrl);
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:strUrl];
            NSData *strResponseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self process_login:strResponseData];
                [APP.Alertview setHidden:YES];
                [APP.activity stopAnimating];
                
            });
            
        });
    
    
    }

}
-(IBAction)btn_fgtPassword:(id)sender
{
    NSLog(@"forgot clicked");
    
    ALAlertBannerPosition position = ALAlertBannerPositionTop;
    ALAlertBannerStyle randomStyle = ALAlertBannerStyleNotify;
    ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please Check your mail" tappedBlock:^(ALAlertBanner *alertBanner) {
        NSLog(@"tapped!");
        [alertBanner hide];
    }];
    banner.secondsToShow = 3.5;
    banner.showAnimationDuration = 0.25;
    banner.hideAnimationDuration = 0.25;
    [banner show];
    
}
-(IBAction)btn_show_entry:(id)sender
{
    if (secure_show==NO) {
        txt_password.secureTextEntry=NO;
        secure_show=YES;
        [btn_secure_show setImage:[UIImage imageNamed:@"eye_visible"] forState:UIControlStateNormal];
    }
    else
    {
        txt_password.secureTextEntry=YES;
        secure_show=NO;
        [btn_secure_show setImage:[UIImage imageNamed:@"eye_disable"] forState:UIControlStateNormal];
    }
   
}
#pragma mark- -----------------TextField Delegate-----------------------------
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (txt_password.text.length>=1) {
        btn_done.hidden=NO;
        btn_frgot.hidden=YES;
        btn_secure_show.hidden=NO;
    }
    else
    {
        btn_frgot.hidden=NO;
        btn_done.hidden=YES;
         btn_secure_show.hidden=YES;
    }
}
-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);

    if (theTextField.text.length>=1) {
        btn_done.hidden=NO;
        btn_frgot.hidden=YES;
    }
    else
    {
        btn_frgot.hidden=NO;
        btn_done.hidden=YES;
    }
}
#pragma mark- ----------------Process Login------------------------------------
-(void)process_login:(NSData *)response
{
    NSString *responseString=[[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"The Response String is:%@",responseString);
    
    NSArray *responseArray=[[responseString JSONValue]valueForKey:@"ClipBoard"];
    
    NSString *str_message=[NSString stringWithFormat:@"%@",[[responseArray objectAtIndex:0] valueForKey:@"Success"]];
    NSLog(@"the response is:%@",str_message);
    if ([str_message isEqualToString:@"0"])
    {
        ALAlertBannerPosition position = ALAlertBannerPositionTop;
        ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
        ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please check your username and password" tappedBlock:^(ALAlertBanner *alertBanner) {
            NSLog(@"tapped!");
            [alertBanner hide];
        }];
        banner.secondsToShow = 3.5;
        banner.showAnimationDuration = 0.25;
        banner.hideAnimationDuration = 0.25;
        [banner show];
    }
    else
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
        TimelineViewController *viw_timeline=
        [storyboard instantiateViewControllerWithIdentifier:@"timeline"];
        
        [self presentViewController:viw_timeline
                           animated:YES
                         completion:nil];
    }

}
@end
