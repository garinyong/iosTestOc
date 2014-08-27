//
//  CanView.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-27.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "CanView.h"

@implementation CanView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float picWidth = 512;
    float picHeight = 348;
    
    float widthContainer = 320;
    float heightContainer = 200;
    
    // Drawing code
    UIBezierPath *apath = [UIBezierPath bezierPath];
    
    // Set the render colors
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGPoint pointFrom = CGPointMake(120, 100);
    
    float x = 120;
    float y = 100;
    
    float toX = picWidth/2;
    float toY = picHeight/2;
    
    [apath moveToPoint:CGPointMake(x, y)];
    [apath addCurveToPoint:CGPointMake(toX, toY) controlPoint1:CGPointMake(60, 120) controlPoint2:CGPointMake(200, 140)];
    
    apath.lineWidth = 1.0f;
    
    [apath stroke];
}

@end
