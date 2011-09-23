//
//  LKBadgeView.m
//  LKBadgeView
//
//  Created by Hashiguchi Hiroshi on 11/09/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LKBadgeView.h"

#define LK_BADGE_VIEW_MINUM_WIDTH           24.0
#define LK_BADGE_VIEW_HORIZONTAL_PADDING    6.0
#define LK_BADGE_VIEW_TRUNCATED_SUFFIX      @"..."

@interface LKBadgeView()
@property (nonatomic, copy) NSString* displayinText;
@property (nonatomic, assign) CGRect badgeFrame;
@end

@implementation LKBadgeView
@synthesize text = text_;
@synthesize textColor, badgeColor;
@synthesize horizontalAlignment = horizontalAlignment_;
@synthesize widthMode = widthMode_;
@synthesize displayinText;
@synthesize badgeFrame = badgeFrame_;

#pragma mark -
#pragma mark Privates

- (void)_setup
{
    self.textColor = [UIColor whiteColor];
    self.badgeColor = [UIColor grayColor];
    self.backgroundColor = [UIColor clearColor];
    self.horizontalAlignment = LKBadgeViewHorizontalAlignmentCenter;
    self.widthMode = LKBadgeViewWidthModeStandard;

    self.text = nil;
    self.displayinText = nil;

}

- (UIFont*)_font
{
    return [UIFont boldSystemFontOfSize:LK_BADGE_VIEW_FONT_SIZE];
}

- (void)_adjustBadgeFrameX
{
    switch (self.horizontalAlignment) {
        case LKBadgeViewHorizontalAlignmentLeft:
            badgeFrame_.origin.x = 0;
            break;
            
        case LKBadgeViewHorizontalAlignmentCenter:
            badgeFrame_.origin.x = (self.bounds.size.width - badgeFrame_.size.width) / 2.0;
            break;
            
        case LKBadgeViewHorizontalAlignmentRight:
            badgeFrame_.origin.x = self.bounds.size.width - badgeFrame_.size.width;
            break;
    }
}

- (void)_adjustBadgeFrameWith
{
    CGSize suffixSize = [LK_BADGE_VIEW_TRUNCATED_SUFFIX sizeWithFont:[self _font]];

    CGFloat paddinWidth = LK_BADGE_VIEW_HORIZONTAL_PADDING*2;
    CGSize size = [self.displayinText sizeWithFont:[self _font]];
    badgeFrame_.size.width = size.width + paddinWidth;
    
    if (badgeFrame_.size.width > self.bounds.size.width) {

        while (1) {
            size = [self.displayinText sizeWithFont:[self _font]];
            badgeFrame_.size.width = size.width + paddinWidth;
            if (badgeFrame_.size.width+suffixSize.width > self.bounds.size.width) {
                if ([self.displayinText length] > 1) {
                    self.displayinText = [self.displayinText substringToIndex:[self.displayinText length]-2];
                } else {
                    self.displayinText = @" ";
                    break;
                }
            } else {
                self.displayinText = [self.displayinText stringByAppendingString:LK_BADGE_VIEW_TRUNCATED_SUFFIX];
                badgeFrame_.size.width += suffixSize.width;
                break;
            }
        }
    }
    if (self.widthMode == LKBadgeViewWidthModeStandard) {
        if (badgeFrame_.size.width < LK_BADGE_VIEw_STANDARD_WIDTH) {
            badgeFrame_.size.width = LK_BADGE_VIEw_STANDARD_WIDTH;
        }
    }
}

- (void)_adjustBadgeFrame
{
    badgeFrame_.size.height = LK_BADGE_VIEW_STANDARD_HEIGHT;
    if (self.displayinText == nil || [self.displayinText length] == 0) {
        badgeFrame_.size.width = LK_BADGE_VIEW_MINUM_WIDTH;
    } else {
        [self _adjustBadgeFrameWith];
    }
    badgeFrame_.origin.y = (self.bounds.size.height - badgeFrame_.size.height) / 2.0;
    
    [self _adjustBadgeFrameX];
}

#pragma mark -
#pragma mark Basics

- (id)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self _setup];
    }
    return self;
}
- (void)dealloc {
    self.text = nil;
    self.textColor = nil;
    self.badgeColor = nil;
    [super dealloc];
}


#pragma mark -
#pragma mark Overrides

- (void)drawRect:(CGRect)rect
{
    if (self.displayinText == nil || [self.displayinText length] == 0) {
        return;
    }

    // draw badge
    UIBezierPath* outlinePath = [UIBezierPath bezierPath];
    
    CGSize size = badgeFrame_.size;
    CGFloat unit = size.height/2.0;

    CGPoint bp = badgeFrame_.origin;
    
    CGPoint c1 = CGPointMake(bp.x + unit, bp.y + unit);
    [outlinePath addArcWithCenter:c1
                           radius:unit
                       startAngle:3*M_PI/2 endAngle:M_PI/2
                        clockwise:NO];
    
    [outlinePath addLineToPoint:CGPointMake(bp.x + size.width - c1.x,
                                            bp.y + size.height)];

    CGPoint c2 = CGPointMake(bp.x + size.width - unit, bp.y + unit);
    [outlinePath addArcWithCenter:c2
                           radius:unit
                       startAngle:M_PI/2 endAngle:-M_PI/2
                        clockwise:NO];
    
    [outlinePath addLineToPoint:CGPointMake(bp.x + c1.x, bp.y)];

    [self.badgeColor set];
    [outlinePath fill];

    // draw text
    if (self.text != nil || [self.text length] > 0) {
        [self.textColor setFill];
        CGSize size = [self.displayinText sizeWithFont:[self _font]];
        CGPoint p = CGPointMake(bp.x + (badgeFrame_.size.width - size.width)/2.0,
                                bp.y + (badgeFrame_.size.height - size.height)/2.0);
        [self.displayinText drawAtPoint:p withFont:[self _font]];
    }
    
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self _adjustBadgeFrame];
}

#pragma mark -
#pragma mark Properties

- (void)setText:(NSString *)text
{
    [text retain];
    [text_ release];
    text_ = text;
    
    self.displayinText = text;

    [self _adjustBadgeFrame];
}

- (void)setHorizontalAlignment:(LKBadgeViewHorizontalAlignment)horizontalAlignment
{
    horizontalAlignment_ = horizontalAlignment;
    [self _adjustBadgeFrameX];    
}

- (void)setWidthMode:(LKBadgeViewWidthMode)widthMode
{
    widthMode_ = widthMode;
    [self _adjustBadgeFrameWith];
}

@end
