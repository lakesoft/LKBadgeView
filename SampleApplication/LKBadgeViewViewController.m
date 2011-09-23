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
@synthesize badgeView;
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

#pragma mark - View lifecycle

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.badgeView.text = @"LKBadgeView";


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

@end
