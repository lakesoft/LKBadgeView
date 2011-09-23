//
//  LKBadgeView.m
//  LKBadgeView
//
//  Created by Hashiguchi Hiroshi on 11/09/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LKBadgeView.h"

#define LK_BADGE_VIEW_STANDARD_HEIGHT       18.0
#define LK_BADGE_VIEW_MINUM_WIDTH           24.0
#define LK_BADGE_VIEW_HORIZONTAL_PADDING    8.0
#define LK_BADGE_VIEW_FONT_SIZE             14.0
#define LK_BADGE_VIEW_TRUNCATED_SUFFIX      @"..."

@interface LKBadgeView()
@property (nonatomic, copy) NSString* displayinText;
@end

@implementation LKBadgeView
@synthesize text = text_;
@synthesize textColor, badgeColor;
@synthesize horizontalAlignment = horizontalAlignment_;
@synthesize displayinText;

#pragma mark -
#pragma mark Privates

- (void)_setup
{
    self.textColor = [UIColor whiteColor];
    self.badgeColor = [UIColor grayColor];
    self.backgroundColor = [UIColor clearColor];
    self.horizontalAlignment = LKBadgeViewHorizontalAlignmentCenter;

    self.text = nil;
    self.displayinText = nil;

    //TODO
    self.text = @"CATSAN12345";
}

- (UIFont*)_font
{
    return [UIFont boldSystemFontOfSize:LK_BADGE_VIEW_FONT_SIZE];
}

- (void)_adjustBdgeFrameX
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
    CGSize csize = [LK_BADGE_VIEW_TRUNCATED_SUFFIX sizeWithFont:[self _font]];

    CGSize size = [self.displayinText sizeWithFont:[self _font]];
    badgeFrame_.size.width = size.width + LK_BADGE_VIEW_HORIZONTAL_PADDING*2;
    if (badgeFrame_.size.width+csize.width > self.bounds.size.width) {
        if ([self.displayinText length] > 1) {
            self.displayinText = [self.displayinText substringToIndex:[self.displayinText length]-2];
            [self _adjustBadgeFrameWith];
        } else {
            self.displayinText = nil;
        }
    } else {
        self.displayinText = [self.displayinText stringByAppendingString:LK_BADGE_VIEW_TRUNCATED_SUFFIX];
        badgeFrame_.size.width += csize.width;
    }
}

- (void)_adjustBdgeFrame
{
    badgeFrame_.size.height = [LKBadgeView standardHeight];
    if (self.displayinText == nil || [self.displayinText length] == 0) {
        badgeFrame_.size.width = LK_BADGE_VIEW_MINUM_WIDTH;
    } else {
        [self _adjustBadgeFrameWith];
    }
    badgeFrame_.origin.y = (self.bounds.size.height - badgeFrame_.size.height) / 2.0;
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

- (void)drawRect:(CGRect)rect
{
    // TODO
    [[UIColor whiteColor] set];
    UIRectFill(self.bounds);

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
                                bp.y);
        [self.displayinText drawAtPoint:p withFont:[self _font]];
    }
    
}

// todo
// setframeのオーバーライド
// サイズ調整
#pragma mark -
#pragma mark Properties

- (void)setText:(NSString *)text
{
    [text retain];
    [text_ release];
    text_ = text;
    
    self.displayinText = text;

    [self _adjustBdgeFrame];
    [self _adjustBdgeFrameX];
}

- (void)setHorizontalAlignment:(LKBadgeViewHorizontalAlignment)horizontalAlignment
{
    horizontalAlignment_ = horizontalAlignment;
    [self _adjustBdgeFrameX];    
}


#pragma mark -
#pragma mark API

+ (CGFloat)standardHeight
{
    return LK_BADGE_VIEW_STANDARD_HEIGHT;
}

@end
