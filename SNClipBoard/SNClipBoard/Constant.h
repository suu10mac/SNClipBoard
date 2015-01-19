//
//  Constant.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#ifndef SNClipBoard_Constant_h
#define SNClipBoard_Constant_h

#define KAppname "ClipBoard"

#pragma mark- ---------------------API CALLS URLS----------

#define kServerUrl "http://dreammtechnologies.com/pers/sai/"

#define kFileServerUrl "http://"

#pragma mark- ---------------------USer Details-----------

#define KUser_email [[NSUserDefaults standardUserDefaults] objectForKey:@"Email_id"]

#define kUser_id [[NSUserDefaults standardUserDefaults] objectForKey:@"User_id"]

#define KUser_name [[NSUserDefaults standardUserDefaults] objectForKey:@"User_name"]

#define KUser_Profile [[NSUserDefaults standardUserDefaults] objectForKey:@"User_profile"]

#pragma mark- ---------------------Collection View Identifier------------

#define CELL_IDENTIFIER @"WaterfallCell"

#define HEADER_IDENTIFIER @"WaterfallHeader"

#define FOOTER_IDENTIFIER @"WaterfallFooter"


#endif
