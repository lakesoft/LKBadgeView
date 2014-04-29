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

@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView01;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView11;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView12;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView13;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView14;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView21;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView22;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView23;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView31;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView31b;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView32;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView32b;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView41;
@property (nonatomic, weak) IBOutlet LKBadgeView* badgeView42;

@property (nonatomic, weak) IBOutlet UISwitch* outlineSwitch;

- (IBAction)changeOutlineSwitch:(id)sender;
- (IBAction)changeShadowSwitch:(id)sender;
- (IBAction)changeShadowOutlineSwitch:(id)sender;
- (IBAction)changeShadowTextSwitch:(id)sender;
@end
