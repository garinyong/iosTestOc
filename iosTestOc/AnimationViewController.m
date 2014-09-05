//
//  AnimationViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-21.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    greenView = [[UIView alloc] initWithFrame:CGRectMake(320/2 - 25, 100, 50, 50)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
//    CATransition
    
    [self makeAnimation];
//    [self drawMyShape];
}

-(void) makeAnimation
{
    CABasicAnimation *anb = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anb.duration = 0.1;
    anb.repeatCount = HUGE_VALL;
    anb.fromValue = [NSNumber numberWithFloat:-0.05];
    anb.toValue = [NSNumber numberWithFloat:0.05];
//    anb.removedOnCompletion = NO;
    anb.autoreverses = YES;
    [greenView.layer addAnimation:anb forKey:@"basic_animation_t"];
    
//    CAKeyframeAnimation *keyAnb = [CAKeyframeAnimation animationWithKeyPath:@"tranfrom.rotation.z"];
//    keyAnb.values = @[[NSNumber numberWithFloat:-0.5],
//                      [NSNumber numberWithFloat:0.5]];
//    keyAnb.duration = 1;
//    keyAnb.repeatCount = 100;
//    [greenView.layer addAnimation:keyAnb forKey:@"key_animation_t"];
}

-(void) drawMyShape
{
    // Create an oval shape to draw.
    UIBezierPath *apath = [UIBezierPath bezierPath];
    
    // Set the render colors
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
    
    [apath moveToPoint:CGPointMake(160, 100)];
    [apath addCurveToPoint:CGPointMake(300, 200) controlPoint1:CGPointMake(100, 50) controlPoint2:CGPointMake(200, 140)];
    
    [apath stroke];
    
    
//    // Adjust the drawing options as needed.
//    aPath.lineWidth = 5;
//    
//    // Fill the path before stroking it so that the fill
//    // color does not obscure the stroked line.
////    [aPath fill];
//    [aPath stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    
    return;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(160, self.view.frame.size.height/2) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
//    [path addCurveToPoint:CGPointMake(160, 100) controlPoint1:CGPointMake(200, 210) controlPoint2:CGPointMake(150, 310)];
    
    CAShapeLayer *caslayer = [CAShapeLayer layer];
    caslayer.frame = self.view.frame;
    caslayer.path = path.CGPath;
    caslayer.strokeColor = [UIColor greenColor].CGColor;
    caslayer.fillColor = [UIColor clearColor].CGColor;
    caslayer.lineCap = kCALineCapRound;
    caslayer.lineWidth = 2;
    caslayer.strokeStart = 0;
    [self.view.layer addSublayer:caslayer];
    
    return;
    
    CABasicAnimation *ba = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ba.duration = 1;
    ba.repeatCount = 1;
//    ba.autoreverses = YES;
    ba.removedOnCompletion = NO;
    ba.fillMode = kCAFillModeForwards;
    ba.fromValue = [NSNumber numberWithFloat:0];
    ba.toValue = [NSNumber numberWithFloat:1];
    [caslayer addAnimation:ba forKey:@"dafdsafasd"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
