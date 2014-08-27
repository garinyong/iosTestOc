//
//  ParallaxViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-27.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ParallaxViewController.h"

@interface ParallaxViewController ()

@end

@implementation ParallaxViewController

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
    
    picWidth = 512;
    picHeight = 348;
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 320, 200)];
    containerView.backgroundColor = [UIColor clearColor];
    containerView.clipsToBounds = YES;
    [self.view addSubview:containerView];
    
    imgView = [[UIImageView alloc] initWithFrame:containerView.bounds];
    imgView.contentMode = UIViewContentModeCenter;
    imgView.image = [UIImage imageNamed:@"cloud.png"];
//    imgView.transform = CGAffineTransformMakeScale(3, 3);
    [containerView addSubview:imgView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(320/2-30,320,60, 44);
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) btnClick
{
//    [UIView animateWithDuration:3 animations:^{
//        imgView.layer.transform = CATransform3DTranslate(imgView.layer.transform,100,0,0);
//    }];
    
    
    

}

-(void) annimateWithTransform
{
    float fromX = imgView.layer.position.x;
    float fromY = imgView.layer.position.y;
    
    float maxToX = picWidth/2;
    float maxToY = picHeight/2;
    
    //随机三个点
//    CGPoint p1 = CGPointMake(arc4random(), <#CGFloat y#>)
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(fromX, fromY)];
    [path addCurveToPoint:CGPointMake(picWidth/2, picHeight/2) controlPoint1:CGPointMake(180, 150) controlPoint2:CGPointMake(200, 180)];
    
    NSLog(@"%f  %f",imgView.layer.position.x,imgView.layer.position.y);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setPath:path.CGPath];
    animation.duration = 20.0f;
    
    CGFloat from3DScale = 1 + arc4random() % 10 *0.1;
    CGFloat to3DScale = from3DScale * 0.8;
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(from3DScale, from3DScale, from3DScale)], [NSValue valueWithCATransform3D:CATransform3DMakeScale(to3DScale, to3DScale, to3DScale)]];
    scaleAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = 10;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[animation];
    [imgView.layer addAnimation:group forKey:@"position and transform"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        NSLog(@"wanchen");
    }
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
