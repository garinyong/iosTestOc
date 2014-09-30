//
//  yunUiew.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-13.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "yunUiew.h"

@implementation yunUiew

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:48/255.0f green:86/255.0f blue:139/255.0f alpha:1];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(67, 215) radius:23 startAngle:M_PI * 3 / 2 + degreeToRadians(20) endAngle:M_PI/2+ degreeToRadians(10) clockwise:NO];
    
    [path addArcWithCenter:CGPointMake(67, 215) radius:23 startAngle:M_PI * 3 /2 + degreeToRadians(15) endAngle:M_PI/2+ degreeToRadians(15) clockwise:NO];
    
    path.lineWidth = 4.0;
    
    [path stroke];
}
@end
