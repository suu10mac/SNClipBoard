//
//  NotificationViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController
{
    //Outlet for the top navigation view
    IBOutlet UIView *viw_nav_top;
    IBOutlet UIImageView *img_viw_profile;
    
    //Outlet for the bootom view
    IBOutlet UIView *viw_bottom;
    IBOutlet UIImageView *img_viw_bottom;
    
    //Outlet for the tableview
    IBOutlet UITableView *tbl_notifications;
    NSMutableArray *mu_arr_notifications;
}

@end
