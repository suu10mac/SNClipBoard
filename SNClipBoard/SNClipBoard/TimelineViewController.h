//
//  TimelineViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/17/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "ProfileViewController.h"

@interface TimelineViewController : UIViewController<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
{
    //Outlet for the collection view
    IBOutlet UIView *viw_timeline;
}
@property(nonatomic,strong) IBOutlet UICollectionView *collectionView;

@end
