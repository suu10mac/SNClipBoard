//
//  ViewController.m
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import "ViewController.h"

#import "SMPageControl.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark- -----------------------------View Lifecycle-----------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self ShowIntro];
    btn_signup.hidden=YES;
    btn_login.hidden=YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- -----------------------------Swipe Pagination Calls----------------------
-(void)ShowIntro
{
    //Calls the page intro page
    //Page 1
    EAIntroPage *page1 =[EAIntroPage page];
    page1.title =@"Clip Board";
    page1.desc=[NSString stringWithFormat:@"Amazing"];
    page1.bgImage = [UIImage imageNamed:@""];
    
    //Page2
    EAIntroPage *page2 =[EAIntroPage page];
    page2.title =@"Clip Board";
    page2.desc=[NSString stringWithFormat:@"Amazing"];
    page2.bgImage = [UIImage imageNamed:@""];
    
    //Page3 
    EAIntroPage *page3 =[EAIntroPage page];
    page3.title =@"Clip Board";
    page3.desc=[NSString stringWithFormat:@"Amazing"];
    page3.bgImage = [UIImage imageNamed:@""];
    
    EAIntroView *intro = [[EAIntroView alloc]initWithFrame:viw_slide.frame andPages:@[page1,page2,page3]];
    [intro setDelegate:self];
    
    [intro showInView:viw_slide animateDuration:0.3];
    
}
#pragma mark- ------------------------EAINTRO DELEGATES METHODS---------------------
-(void)introDidFinish:(EAIntroView *)introView
{
    NSLog(@"Intro did finish");
    viw_slide.hidden=YES;
    btn_login.hidden=NO;
    btn_signup.hidden=NO;
}
#pragma mark - ------------------------Button Call Functions---------------------------
-(IBAction)btn_login:(id)sender
{
    NSLog(@"Button login");
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    LoginViewController *viw_login =
    [storyboard instantiateViewControllerWithIdentifier:@"login"];
    
    [self presentViewController:viw_login
                       animated:YES
                     completion:nil];
}
-(IBAction)btn_signup:(id)sender
{
    NSLog(@"signup login");
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    SignupViewController *viw_signup =
    [storyboard instantiateViewControllerWithIdentifier:@"signup"];
    
    [self presentViewController:viw_signup
                       animated:YES
                     completion:nil];
}
@end
