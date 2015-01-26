//
//  SignupViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimelineViewController.h"
#import "Constant.h"

@interface SignupViewController : UIViewController<UITextFieldDelegate>
{
    //Outlet for the View
    IBOutlet UIView *viw_page1;
    IBOutlet UIView *viw_slide;
    IBOutlet UITextField *txt_username;
    IBOutlet UITextField *txt_email;
    IBOutlet UITextField *txt_password;
    
    //Outlet for the page2
    IBOutlet UIView *viw_page2;
    IBOutlet UITextField *txt_fullname;
    IBOutlet UITextField *txt_phone;
    IBOutlet UIImageView *img_viw_profile;
    
    
}

@end
