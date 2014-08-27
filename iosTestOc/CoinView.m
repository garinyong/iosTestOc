//
//  CoinView.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-26.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "CoinView.h"

@implementation CoinView

- (id)initWithFrame:(CGRect)frame drawcolor_:(UIColor *) drawcolor_
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        drawColor = drawcolor_;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [drawColor set]; //设置线条颜色
    
    float radius = MIN(self.frame.size.width, self.frame.size.height)/2;
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                         radius:radius
                                                     startAngle:0
                                                       endAngle:M_PI*2
                                                      clockwise:YES];
    
    aPath.lineWidth = 1.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
//    [aPath stroke];
    [aPath fill];
}

@end
