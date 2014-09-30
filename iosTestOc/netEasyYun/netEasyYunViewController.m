//
//  netEasyYunViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-12.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "netEasyYunViewController.h"
#import "yunUiew.h"

@interface netEasyYunViewController ()

@end

@implementation netEasyYunViewController

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
    yunUiew *yun = [[yunUiew alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:yun];
}

-(void) drawClound
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(61, 237)];
    
    [path addQuadCurveToPoint:CGPointMake(61, 296) controlPoint:CGPointMake(44, 216)];
    
    [path addArcWithCenter:CGPointMake(160, self.view.frame.size.height/2) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer *caslayer = [CAShapeLayer layer];
    caslayer.frame = self.view.frame;
    caslayer.path = path.CGPath;
    caslayer.strokeColor = [UIColor greenColor].CGColor;
    caslayer.fillColor = [UIColor clearColor].CGColor;
    caslayer.lineCap = kCALineCapRound;
    caslayer.lineWidth = 2;
    caslayer.strokeStart = 0;
    [self.view.layer addSublayer:caslayer];

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
