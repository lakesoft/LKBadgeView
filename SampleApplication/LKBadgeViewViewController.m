//
//  LKBadgeViewViewController.m
//  LKBadgeView
//
//  Created by Hashiguchi Hiroshi on 11/09/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LKBadgeViewViewController.h"
#import "LKBadgeView.h"

@implementation LKBadgeViewViewController
@synthesize badgeView01;
@synthesize badgeView11;
@synthesize badgeView12;
@synthesize badgeView13;
@synthesize badgeView14;
@synthesize badgeView21;
@synthesize badgeView22;
@synthesize badgeView23;
@synthesize badgeView31;
@synthesize badgeView32;
@synthesize badgeView31b;
@synthesize badgeView32b;
@synthesize badgeView41;
@synthesize badgeView42;
@synthesize outlineSwitch;

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.badgeView01.text = @"LKBadgeView";
    self.badgeView01.horizontalAlignment = LKBadgeViewHorizontalAlignmentLeft;

    self.badgeView11.text = @"11";
    self.badgeView12.text = @"LAKE";
    
    self.badgeView13.text = @"99999";
    self.badgeView13.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];

    self.badgeView14.text = @"99999";
    self.badgeView14.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];


    self.badgeView21.text = @"1";
    self.badgeView21.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.badgeView21.horizontalAlignment = LKBadgeViewHorizontalAlignmentLeft;

    self.badgeView22.text = @"2";
    self.badgeView22.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.badgeView22.horizontalAlignment = LKBadgeViewHorizontalAlignmentCenter;

    self.badgeView23.text = @"3";
    self.badgeView23.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.badgeView23.horizontalAlignment = LKBadgeViewHorizontalAlignmentRight;

    self.badgeView31.text = @"3";
    self.badgeView31.widthMode = LKBadgeViewWidthModeStandard;
    self.badgeView31b.text = @"31";
    self.badgeView31b.widthMode = LKBadgeViewWidthModeStandard;

    self.badgeView32.text = @"3";
    self.badgeView32.widthMode = LKBadgeViewWidthModeSmall;
    self.badgeView32b.text = @"32";
    self.badgeView32b.widthMode = LKBadgeViewWidthModeSmall;

    self.badgeView41.text = @"41";
    self.badgeView41.textColor = [UIColor greenColor];

    self.badgeView42.text = @"42";
    self.badgeView42.badgeColor = [UIColor redColor];
    self.badgeView42.textColor = [UIColor whiteColor];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeOutlineSwitch:(id)sender
{
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[LKBadgeView class]]) {
            LKBadgeView* badgeView = (LKBadgeView*)view;
            badgeView.outline = self.outlineSwitch.on;
            
            if (badgeView.outline) {
                badgeView.textColor = [UIColor grayColor];
                badgeView.badgeColor = [UIColor whiteColor];
                badgeView.outlineColor = [UIColor colorWithWhite:0.65 alpha:1.0];
            } else {
                badgeView.textColor = [UIColor whiteColor];
                badgeView.badgeColor = [UIColor grayColor];
            }

            badgeView.outlineWidth = 2.0;

//            [badgeView setNeedsDisplay];
        }
    }
    self.badgeView41.textColor = [UIColor greenColor];
    self.badgeView42.badgeColor = [UIColor redColor];
    self.badgeView42.textColor = [UIColor whiteColor];
}

- (IBAction)changeShadowSwitch:(id)sender {

    UISwitch* sw = (UISwitch*)sender;

    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[LKBadgeView class]]) {
            LKBadgeView* badgeView = (LKBadgeView*)view;
            badgeView.shadow = sw.on;
        }
    }
    self.badgeView41.shadow = sw.on;
    self.badgeView42.shadow = sw.on;
}

- (IBAction)changeShadowOutlineSwitch:(id)sender {
    UISwitch* sw = (UISwitch*)sender;
    
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[LKBadgeView class]]) {
            LKBadgeView* badgeView = (LKBadgeView*)view;
            badgeView.shadowOfOutline = sw.on;
        }
    }
    self.badgeView41.shadowOfOutline = sw.on;
    self.badgeView42.shadowOfOutline = sw.on;
}

- (IBAction)changeShadowTextSwitch:(id)sender {
    UISwitch* sw = (UISwitch*)sender;
    
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[LKBadgeView class]]) {
            LKBadgeView* badgeView = (LKBadgeView*)view;
            badgeView.shadowOfText = sw.on;
        }
    }
    self.badgeView41.shadowOfText = sw.on;
    self.badgeView42.shadowOfText = sw.on;
}

@end
