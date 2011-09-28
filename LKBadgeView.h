//
//  LKBadgeView.h
//  LKBadgeView
//
//  Created by Hashiguchi Hiroshi on 11/09/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Enums
typedef enum {
    LKBadgeViewHorizontalAlignmentLeft = 0,
    LKBadgeViewHorizontalAlignmentCenter,
    LKBadgeViewHorizontalAlignmentRight
    
} LKBadgeViewHorizontalAlignment;

typedef enum {
    LKBadgeViewWidthModeStandard = 0,     // 30x20
    LKBadgeViewWidthModeSmall            // 22x20
} LKBadgeViewWidthMode;


// Constants
#define LK_BADGE_VIEW_STANDARD_HEIGHT       20.0
#define LK_BADGE_VIEw_STANDARD_WIDTH        30.0
#define LK_BADGE_VIEw_MINIMUM_WIDTH         22.0
#define LK_BADGE_VIEW_FONT_SIZE             16.0


@interface LKBadgeView : UIView

@property (nonatomic, copy) NSString* text;
@property (nonatomic, retain) UIColor* textColor;
@property (nonatomic, retain) UIColor* badgeColor;
@property (nonatomic, retain) UIColor* outlineColor;
@property (nonatomic, assign) CGFloat outlineWidth;
@property (nonatomic, assign) BOOL outline;
@property (nonatomic, assign) LKBadgeViewHorizontalAlignment horizontalAlignment;
@property (nonatomic, assign) LKBadgeViewWidthMode widthMode;

+ (CGFloat)badgeHeight;

@end
