//
//  LoginViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "TimelineViewController.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    //Outlet for the view textfield
    IBOutlet UIView *viw_login;
    IBOutlet UITextField *txt_username;
    IBOutlet UITextField *txt_password;
    
    IBOutlet UIButton *btn_done;
    IBOutlet UIButton *btn_frgot;
    IBOutlet UIButton *btn_secure_show;
    BOOL secure_show;
    IBOutlet UILabel *lbl_frgot_msg;
}

@end
