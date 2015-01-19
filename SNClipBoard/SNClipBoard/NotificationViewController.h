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
    //Outlet for the tableview
    IBOutlet UITableView *tbl_notifications;
    NSMutableArray *mu_arr_notifications;
}

@end
