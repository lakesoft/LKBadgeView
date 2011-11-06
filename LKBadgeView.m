//
// Copyright (c) 2011 Hiroshi Hashiguchi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
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
@synthesize textColor = textColor_;
@synthesize badgeColor = badgeColor_;
@synthesize outlineColor;
@synthesize outlineWidth = outlineWidth_;
@synthesize outline = outline_;
@synthesize horizontalAlignment = horizontalAlignment_;
@synthesize widthMode = widthMode_;
@synthesize displayinText;
@synthesize badgeFrame = badgeFrame_;
@synthesize shadow = shadow_;
@synthesize shadowOfOutline = shadowOfOutline_;
@synthesize shadowOfText = shadowOfText_;

#pragma mark -
#pragma mark Privates

- (void)_setupBasics
{
    self.backgroundColor = [UIColor clearColor];
    self.horizontalAlignment = LKBadgeViewHorizontalAlignmentCenter;
    self.widthMode = LKBadgeViewWidthModeStandard;
    self.text = nil;
    self.displayinText = nil;
    self.userInteractionEnabled = NO;
}

- (void)_setupDefaultWithoutOutline
{
    self.textColor = [UIColor whiteColor];
    self.badgeColor = [UIColor grayColor];

    outline_ = NO;
    outlineWidth_ = 2.0;
    self.outlineColor = [UIColor colorWithWhite:0.65 alpha:1.0];

    [self _setupBasics];
}

- (void)_setupDefaultWithOutline
{
    self.textColor = [UIColor grayColor];
    self.badgeColor = [UIColor whiteColor];

    outline_ = YES;
    outlineWidth_ = 3.0;
    self.outlineColor = [UIColor colorWithWhite:0.65 alpha:1.0];

    [self _setupBasics];
}

- (UIFont*)_font
{
    return [UIFont boldSystemFontOfSize:LK_BADGE_VIEW_FONT_SIZE];
}

- (void)_adjustBadgeFrameX
{
    CGFloat realOutlineWith = outline_ ? outlineWidth_ : 0.0;
    switch (self.horizontalAlignment) {
        case LKBadgeViewHorizontalAlignmentLeft:
            badgeFrame_.origin.x = realOutlineWith;
            break;
            
        case LKBadgeViewHorizontalAlignmentCenter:
            badgeFrame_.origin.x = (self.bounds.size.width - badgeFrame_.size.width) / 2.0;
            break;
            
        case LKBadgeViewHorizontalAlignmentRight:
            badgeFrame_.origin.x = self.bounds.size.width - badgeFrame_.size.width - realOutlineWith;
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
        [self _setupDefaultWithoutOutline];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupDefaultWithoutOutline];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self _setupDefaultWithoutOutline];
    }
    return self;
}
- (void)dealloc {
    self.text = nil;
    self.textColor = nil;
    self.badgeColor = nil;
    self.outlineColor = nil;
    self.displayinText = nil;
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
    
    CGPoint c1 = CGPointMake(bp.x + unit, bp.y);
    [outlinePath moveToPoint:c1];
    c1.y +=unit;
    [outlinePath addArcWithCenter:c1
                           radius:unit
                       startAngle:3*M_PI/2 endAngle:M_PI/2
                        clockwise:NO];
    
    [outlinePath addLineToPoint:CGPointMake(bp.x + size.width - unit,
                                            bp.y + size.height)];

    CGPoint c2 = CGPointMake(bp.x + size.width - unit, bp.y + unit);
    [outlinePath addArcWithCenter:c2
                           radius:unit
                       startAngle:M_PI/2 endAngle:-M_PI/2
                        clockwise:NO];
    
    [outlinePath addLineToPoint:CGPointMake(bp.x + unit, bp.y)];

    [self.outlineColor setStroke];
    [self.badgeColor setFill];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef shadowColor = [[UIColor colorWithWhite:0.0 alpha:0.5] CGColor];
    CGSize shadowOffset = CGSizeMake(1.0, 1.0);
    CGFloat shadowBlur = 2.0;

    if (self.shadow) {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlur, shadowColor);
        [outlinePath fill];
        CGContextRestoreGState(context);
    } else {
        [outlinePath fill];        
    }

    if (outline_) {
        [outlinePath setLineWidth:outlineWidth_];

        if (self.shadowOfOutline) {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, shadowOffset, shadowBlur, shadowColor);
            [outlinePath stroke];
            CGContextRestoreGState(context);            
        } else {
            [outlinePath stroke];
        }
    }
    
    // draw text
    if (self.text != nil || [self.text length] > 0) {
        [self.textColor setFill];
        CGSize size = [self.displayinText sizeWithFont:[self _font]];
        CGPoint p = CGPointMake(bp.x + (badgeFrame_.size.width - size.width)/2.0,
                                bp.y + (badgeFrame_.size.height - size.height)/2.0);

        if (self.shadowOfText) {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, shadowOffset, shadowBlur, shadowColor);
            [self.displayinText drawAtPoint:p withFont:[self _font]];
            CGContextRestoreGState(context);            
        } else {
            [self.displayinText drawAtPoint:p withFont:[self _font]];
        }
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
    [self setNeedsDisplay];
}

- (void)setHorizontalAlignment:(LKBadgeViewHorizontalAlignment)horizontalAlignment
{
    horizontalAlignment_ = horizontalAlignment;
    [self _adjustBadgeFrameX];    
    [self setNeedsDisplay];
}

- (void)setWidthMode:(LKBadgeViewWidthMode)widthMode
{
    widthMode_ = widthMode;
    [self _adjustBadgeFrameWith];
    [self setNeedsDisplay];
}

- (void)setOutlineWidth:(CGFloat)outlineWidth
{
    outlineWidth_ = outlineWidth;
    [self _adjustBadgeFrame];
    [self setNeedsDisplay];
}

- (void)setOutline:(BOOL)outline
{
    outline_ = outline;
    [self setNeedsDisplay];
}

- (void)setShadow:(BOOL)shadow
{
    shadow_ = shadow;
    [self setNeedsDisplay];
}

- (void)setShadowOfOutline:(BOOL)shadowOfOutline
{
    shadowOfOutline_ = shadowOfOutline;
    [self setNeedsDisplay];
}

- (void)setShadowOfText:(BOOL)shadowOfText
{
    shadowOfText_ = shadowOfText;
    [self setNeedsDisplay];
}

- (void)setBadgeColor:(UIColor *)badgeColor
{
    [badgeColor retain];
    [badgeColor_ release];
    badgeColor_ = badgeColor;
    
    [self setNeedsDisplay];
}

- (void)setTextColor:(UIColor *)textColor
{
    [textColor retain];
    [textColor_ release];
    textColor_ = textColor;
    
    [self setNeedsDisplay];
}

#pragma mark -
#pragma mark API
+ (CGFloat)badgeHeight
{
    return LK_BADGE_VIEW_STANDARD_HEIGHT;
}

@end
