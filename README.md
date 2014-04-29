Custom Badge View
=================

LKBadgeView class draws text on round rect 'badge'.

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/screenshot0.png)

[*See japanese document](http://cocoadays.blogspot.com/2011/09/blog-post.html "_blank_")

Installation
------------

The library is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "LKBadgeView", :git => 'https://github.com/lakesoft/LKBadgeView.git'



Usage
-----

LKBadgeView is subclass of UIView. So you can add the instance to some view.

	LKBadgeView* badgeView =
		[[[LKBadgeView alloc] initWithFrame:CGRectMake(100, 200, 50, 20)] autorelease];
	[self.view addSubview:badgeView];
	badgeView.text = @"23";

You can use this class in XIB. The sample application use this way.


Customize
---------
The below properties can customize the view's behaivior.

### Horizontal position
	@property (nonatomic, assign) LKBadgeViewHorizontalAlignment horizontalAlignment;

left/center/right alignments are available.  
(Default) LKBadgeViewHorizontalAlignmentCenter

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0004.png)

( The background color is convenient description )

### Minimum size
Minimum size has 2 way mode.

	@property (nonatomic, assign) LKBadgeViewWidthMode widthMode;

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0005.png)

* LKBadgeViewWidthModeSmall: The badge shape becomes circle.
* LKBadgeViewWidthModeStandard: The width is certain fixed size in case of 1 char and 2 chars text. 3 chars and more.

(Default) LKBadgeViewWidthModeStandard

###Color
Text color and badge color are variable.  

	@property (nonatomic, retain) UIColor* textColor;
	@property (nonatomic, retain) UIColor* badgeColor;

(Default) textColor is white, badgeColor is gray.

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0006.png)

###Outline
LKBadgeView can use outline.

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0007.png)

The outline property should be YES when you use outline. If the property is no, then the outline does not be drawn. Outline has color property and width property.

	@property (nonatomic, retain) UIColor* outlineColor;
	@property (nonatomic, assign) CGFloat outlineWidth;
	@property (nonatomic, assign) BOOL outline;

(Default) outlineColor is gray, outlineWidth is 2.0.

You can use outline with badgeColor.

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0008.png)

###Shadow
LKBadgeView can draw a shadow.

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0010.png)

If the shadow property is YES, then the shadow of the badge is drawn. 'shadowOfOutline' is for outline shadow. 'shadowOfText' is for text shadow.

	@property (nonatomic, retain) BOOL shadow;
	@property (nonatomic, assign) BOOL shadowOfOutline;
	@property (nonatomic, assign) BOOL shadowOfText;

(Default) all shadow properties are NO.

Etc
---

### Truncated
If text width is greater than LKBadgeView width, The text is truncated.

![](https://github.com/lakesoft/LKBadgeView/raw/master/Docs/0009.png)

( The background color is convenient description )

### Badge height
The height of badge shape is fixed (20px). The value is avaliable as constant. Also class method +badgeHeight is avalible.

	#define LK_BADGE_VIEW_STANDARD_HEIGHT       20.0
 	  :
	 + (CGFloat)badgeHeight;

LKBadgeView height should be same value or more. If LKBadgeView is greater than fixed size (20px), then the badge shape is placed at the center of vertical position in LKBadgeView. Usually the height of LKBadgeView itself is the same as the value and good


License
-------
MIT

Copyright (c) 2011 Hiroshi Hashiguchi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

