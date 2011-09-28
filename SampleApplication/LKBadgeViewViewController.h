//
//  LKBadgeViewViewController.h
//  LKBadgeView
//
//  Created by Hashiguchi Hiroshi on 11/09/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKBadgeView;
@interface LKBadgeViewViewController : UIViewController

@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView01;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView11;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView12;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView13;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView14;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView21;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView22;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView23;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView31;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView31b;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView32;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView32b;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView41;
@property (nonatomic, retain) IBOutlet LKBadgeView* badgeView42;

@property (nonatomic, retain) IBOutlet UISwitch* outlineSwitch;

- (IBAction)changeOutlineSwitch:(id)sender;
@end
