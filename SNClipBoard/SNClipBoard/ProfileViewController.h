//
//  ProfileViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/18/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface ProfileViewController : UIViewController<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
{
    //Outlet for the view slide
    IBOutlet UIView *viw_post;
}
@property(nonatomic,strong) IBOutlet UICollectionView *collectionView;

-(void)get_profile_details:(NSDictionary *)values;
@end
