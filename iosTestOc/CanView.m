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
        
        UIBezierPath *apath = [UIBezierPath bezierPath];
        
        [[UIColor redColor] setStroke];
        
        [apath moveToPoint:CGPointMake(100, 100)];
        [apath addLineToPoint:CGPointMake(300, 100)];
        [apath addLineToPoint:CGPointMake(300, 200)];
        [apath addLineToPoint:CGPointMake(100, 200)];
        [apath addLineToPoint:CGPointMake(100, 100)];
        
        CAShapeLayer *slayer = [CAShapeLayer layer];
        slayer.path = apath.CGPath;
        slayer.strokeStart = 0;
        slayer.strokeEnd = 0;
        slayer.strokeColor = [UIColor greenColor].CGColor;
        slayer.fillColor = [UIColor whiteColor].CGColor;
        slayer.lineWidth = 1;
        [self.layer addSublayer:slayer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration = 3;
        animation.fromValue = [NSNumber numberWithFloat:0];
        animation.toValue = [NSNumber numberWithFloat:1];
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        [slayer addAnimation:animation forKey:@"fadfdafd"];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    
    
}

@end
