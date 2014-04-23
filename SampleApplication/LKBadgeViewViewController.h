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

@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView01;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView11;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView12;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView13;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView14;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView21;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView22;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView23;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView31;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView31b;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView32;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView32b;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView41;
@property (nonatomic, strong) IBOutlet LKBadgeView* badgeView42;

@property (nonatomic, strong) IBOutlet UISwitch* outlineSwitch;

- (IBAction)changeOutlineSwitch:(id)sender;
- (IBAction)changeShadowSwitch:(id)sender;
- (IBAction)changeShadowOutlineSwitch:(id)sender;
- (IBAction)changeShadowTextSwitch:(id)sender;
@end
