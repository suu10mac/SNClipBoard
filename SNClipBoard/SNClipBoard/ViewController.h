//
//  ViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"
#import "LoginViewController.h"
#import "SignupViewController.h"

@interface ViewController : UIViewController<EAIntroDelegate>
{
    //Oultlet for the Slide view
    IBOutlet UIView *viw_slide;
    IBOutlet UIButton *btn_login,*btn_signup;
}



@end

