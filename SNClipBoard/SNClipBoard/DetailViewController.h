//
//  GrowingTextViewExampleViewController.h
//
//  Created by Hans Pinckaers on 29-06-10.
//
//	MIT License
//
//	Copyright (c) 2011 Hans Pinckaers
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//
//  DetailViewController.h
//  SNClipBoard
//
//  Created by DREAM MOUNT TECH on 1/19/15.
//  Copyright (c) 2015 DreamMountTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"

@interface DetailViewController : UIViewController<HPGrowingTextViewDelegate>
{
    //Outlet for the main view
    IBOutlet UIView *viw_main;
    IBOutlet UILabel *lbl_main_title;
    IBOutlet UILabel *lbl_main_time;
    
    IBOutlet UILabel *lbl_main_likes;
    IBOutlet UILabel *lbl_main_retweets;
    
    //Oultet for the bottom view
    IBOutlet UIView *viw_bottom;
    IBOutlet UILabel *lbl_bottom_likes;
    IBOutlet UILabel *lbl_bottom_comments;
    IBOutlet UILabel *lbl_bottom_retweets;
    IBOutlet UILabel *lbl_bottom_clicks;
    IBOutlet UILabel *lbl_bottom_description;
    
    //Outlet fro the bottom content
    IBOutlet UIView *containerView;
    IBOutlet HPGrowingTextView *textView;
    IBOutlet UIButton *btn_send;
}
-(void)resignTextView;
-(void)show_ClipContent:(NSString *)value;
@end
