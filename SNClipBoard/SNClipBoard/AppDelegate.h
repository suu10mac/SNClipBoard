//
//  AppDelegate.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

#define APP ((AppDelegate *)[[UIApplication sharedApplication]delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIActivityIndicatorView *activity;
    
    UIView *Alertview;

}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain)  UIView *Alertview;

@property (nonatomic,retain)  UIActivityIndicatorView *activity;

@property (nonatomic,retain)  UILabel *lbl;


@end

