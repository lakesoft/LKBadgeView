//
//  LKBadgeView.h
//  LKBadgeView
//
//  Created by Hashiguchi Hiroshi on 11/09/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LKBadgeViewHorizontalAlignmentLeft = 0,
    LKBadgeViewHorizontalAlignmentCenter,
    LKBadgeViewHorizontalAlignmentRight
    
} LKBadgeViewHorizontalAlignment;


@interface LKBadgeView : UIView {
    CGRect badgeFrame_;
}

@property (nonatomic, copy) NSString* text;
@property (nonatomic, retain) UIColor* textColor;
@property (nonatomic, retain) UIColor* badgeColor;
@property (nonatomic, assign) LKBadgeViewHorizontalAlignment horizontalAlignment;

+ (CGFloat)standardHeight;

@end
