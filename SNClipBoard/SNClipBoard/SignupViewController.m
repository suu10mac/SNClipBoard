//
//  SignupViewController.m
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import "SignupViewController.h"

#import "ALAlertBanner.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

#pragma mark- ---------------------View Lifecycle-----------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    viw_page1.hidden=NO;
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
        if (txt_username.text.length==0)
        {
            ALAlertBannerPosition position = ALAlertBannerPositionTop;
            ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
            ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please Enter username " tappedBlock:^(ALAlertBanner *alertBanner) {
                NSLog(@"tapped!");
                [alertBanner hide];
            }];
            banner.secondsToShow = 3.5;
            banner.showAnimationDuration = 0.25;
            banner.hideAnimationDuration = 0.25;
            [banner show];

        }
        else if (txt_email.text.length==0)
        {
            ALAlertBannerPosition position = ALAlertBannerPositionTop;
            ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
            ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please Enter Email" tappedBlock:^(ALAlertBanner *alertBanner) {
                NSLog(@"tapped!");
                [alertBanner hide];
            }];
            banner.secondsToShow = 3.5;
            banner.showAnimationDuration = 0.25;
            banner.hideAnimationDuration = 0.25;
            [banner show];
        }
        else if (txt_password.text.length==0)
        {
            ALAlertBannerPosition position = ALAlertBannerPositionTop;
            ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
            ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please Enter Password" tappedBlock:^(ALAlertBanner *alertBanner) {
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
            NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            BOOL myStringMatchesRegEx=[emailTest evaluateWithObject:txt_email.text];
            
            if (myStringMatchesRegEx==YES)
            {
               
                viw_page2.hidden=NO;
            }
            else
            {
                ALAlertBannerPosition position = ALAlertBannerPositionBottom;
                ALAlertBannerStyle randomStyle = ALAlertBannerStyleNotify;
                ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please check your email" tappedBlock:^(ALAlertBanner *alertBanner) {
                    NSLog(@"tapped!");
                    [alertBanner hide];
                }];
                banner.secondsToShow = 3.5;
                banner.showAnimationDuration = 0.25;
                banner.hideAnimationDuration = 0.25;
                [banner show];

            }
        }
    }
    else
    {
        if (txt_fullname.text.length==0) {
            ALAlertBannerPosition position = ALAlertBannerPositionTop;
            ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
            ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Please Enter Fullname" tappedBlock:^(ALAlertBanner *alertBanner) {
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
            NSString *str_username=[NSString stringWithFormat:@"%@",txt_username.text];
            NSString *str_email=[NSString stringWithFormat:@"%@",txt_email.text];
            NSString *str_pasword=[NSString stringWithFormat:@"%@",txt_password.text];
            NSString *str_fullname=[NSString stringWithFormat:@"%@",txt_fullname.text];
            NSString *str_phone=[NSString stringWithFormat:@"%@",txt_phone.text];
            
            [APP.window bringSubviewToFront:APP.Alertview];
            [APP.Alertview setHidden:NO];
            [APP.activity startAnimating];
            [APP.lbl setText:@"Loading"];
            
            dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            //this will start the image loading in bg
            dispatch_async(concurrentQueue, ^{
                //http://dreammtechnologies.com/pers/clip/api/register.php?f_name=<FULLNAME>&email=<MAILID>&mobile=<MOBILE>&u_name=<USERNAME>&password=<PASSWORD>
                NSURL *strUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%sregister.php?f_name=%@&email=%@&mobile=%@&u_name=%@&password=%@",kServerUrl,str_fullname,str_email,str_phone,str_username,[str_pasword md5]]];
                NSLog(@"the url is:%@",strUrl);
                NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:strUrl];
                NSData *strResponseData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                NSString *responseString=[[NSString alloc]initWithData:strResponseData encoding:NSUTF8StringEncoding];
                NSLog(@"The Response String is:%@",responseString);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self process_signup:strResponseData];
                      [APP.Alertview setHidden:YES];
                      [APP.activity stopAnimating];
                    
                });
                
            });
            
            
        }
        //Submit and show discover page
      //  UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                //                                             bundle:nil];
     //   TimelineViewController *viw_timeline=
     //   [storyboard instantiateViewControllerWithIdentifier:@"timeline"];
        
     //   [self presentViewController:viw_timeline
           //                animated:YES
             //            completion:nil];
    }
}
-(void)process_signup:(NSData *)response
{
    NSString *responseString=[[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"The Response String is:%@",responseString);
    
    NSArray *responseArray=[[responseString JSONValue]valueForKey:@"ClipBoard"];
    
    NSString *str_message=[NSString stringWithFormat:@"%@",[[responseArray objectAtIndex:0] valueForKey:@"Success"]];
    NSLog(@"the response is:%@",str_message);
    
    if ([str_message isEqualToString:@"1"])
    {
        ALAlertBannerPosition position = ALAlertBannerPositionBottom;
        ALAlertBannerStyle randomStyle = ALAlertBannerStyleSuccess;
        ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Hurray account created successfully" tappedBlock:^(ALAlertBanner *alertBanner) {
            NSLog(@"tapped!");
            [alertBanner hide];
        }];
        banner.secondsToShow = 3.5;
        banner.showAnimationDuration = 0.25;
        banner.hideAnimationDuration = 0.25;
        [banner show];
      //  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(call_time:) userInfo:nil repeats:NO];
    }
    else
    {
        ALAlertBannerPosition position = ALAlertBannerPositionBottom;
        ALAlertBannerStyle randomStyle = ALAlertBannerStyleFailure;
        ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:randomStyle position:position title:@KAppname subtitle:@"Something went wrong..." tappedBlock:^(ALAlertBanner *alertBanner) {
            NSLog(@"tapped!");
            [alertBanner hide];
        }];
        banner.secondsToShow = 3.5;
        banner.showAnimationDuration = 0.25;
        banner.hideAnimationDuration = 0.25;
        [banner show];
    }
}
-(void)call_time:(NSTimer *)t
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    TimelineViewController *viw_login =
    [storyboard instantiateViewControllerWithIdentifier:@"timeline"];
    
    [self presentViewController:viw_login
                       animated:YES
                     completion:nil];
}
#pragma mark- ------------------Uitext field Deleagte------------------------
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
