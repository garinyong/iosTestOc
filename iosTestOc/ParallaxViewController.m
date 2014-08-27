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
    
    [self annimateWithTransform:YES];
    
    
//    imgView.layer.position = CGPointMake(imgView.layer.position.x+10, imgView.layer.position.y);
//    
//    NSLog(@"%f  %f",imgView.layer.position.x,imgView.layer.position.y);
}

-(void) annimateWithTransform:(BOOL) isFirst
{
    //起点
    if (isFirst)
    {
        startPoint = imgView.layer.position;
    }
    
    //随机三个点
    CGPoint endPoint = [self getRandomPoint:startPoint];
    CGPoint p1 = [self getRandomPoint:startPoint];
    CGPoint p2 = [self getRandomPoint:startPoint];
    
    NSLog(@"start x:%f start y:%f",startPoint.x,startPoint.y);
    NSLog(@"endPoint x:%f endPoint y:%f",endPoint.x,endPoint.y);
    NSLog(@"p1 x:%f p1 y:%f",p1.x,p1.y);
    NSLog(@"p2 x:%f p2 y:%f",p2.x,p2.y);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:p1 controlPoint2:p2];
//    [path addCurveToPoint:endPoint controlPoint1:p1 controlPoint2:p2];
    
    //记录
    startPoint = endPoint;
    
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

-(CGPoint) getRandomPoint:(CGPoint) basicPoint
{
    //起点
    float fromX = imgView.layer.position.x;
    float fromY = imgView.layer.position.y;
    //最大移动距离
    int maxWidth = abs(picWidth/2-fromX);
    int maxHeight = abs(picHeight/2-fromY);
    
    //随机三个点
    int a= arc4random()%maxWidth;
    int b = arc4random()%maxHeight;
    
    float toX = 0 ,toY = 0;
    
    if (arc4random()%100%2==0)
    {
        toX = fromX + a;
    }
    else
    {
        toX= fromX - a;
    }
    
    if (arc4random()%100%2==0)
    {
        toY = fromY + b;
    }
    else
    {
        toY= fromY - b;
    }
    
//    NSLog(@"tox:%f toy:%f",toX,toY);
    
    return CGPointMake(toX, toY);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        NSLog(@"wanchen");
        [self annimateWithTransform:NO];
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
