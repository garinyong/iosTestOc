//
//  juHuaView1.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-5.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "juHuaView1.h"

@implementation juHuaView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGPoint roundCenter = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [path addArcWithCenter:roundCenter radius:20 startAngle:0 endAngle:degreeToRadians(30) clockwise:NO];
        [path moveToPoint:roundCenter];
        
        //create round
        CAShapeLayer *round = [CAShapeLayer layer];
        round.path = path.CGPath;
        round.strokeColor = [UIColor whiteColor].CGColor;
        round.fillColor = [UIColor clearColor].CGColor;
        round.lineWidth = 2;
        
        [self.layer addSublayer:round];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{


}

@end
