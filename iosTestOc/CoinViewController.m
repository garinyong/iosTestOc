//
//  CoinViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-26.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "CoinViewController.h"

@interface CoinViewController ()

@end

@implementation CoinViewController

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
    
    CGPoint point = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    basicView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    basicView.backgroundColor = [UIColor clearColor];
    basicView.center = point;
    [self.view addSubview:basicView];
    
    firstView = [[CoinView alloc] initWithFrame:basicView.bounds drawcolor_:[UIColor greenColor]];
    [basicView addSubview:firstView];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    lbl.center = CGPointMake(firstView.bounds.size.width/2, firstView.bounds.size.height/2);
    lbl.font = [UIFont systemFontOfSize:14.0f];
    lbl.text = @"分";
    lbl.textColor = [UIColor blackColor];
    [firstView addSubview:lbl];
    
    secondView = [[CoinView alloc] initWithFrame:basicView.bounds drawcolor_:[UIColor redColor]];
    [basicView addSubview:secondView];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,20, 20)];
    lbl.center = CGPointMake(secondView.bounds.size.width/2, secondView.bounds.size.height/2);
    lbl.font = [UIFont systemFontOfSize:14.0f];
    lbl.text = @"中";
    lbl.textColor = [UIColor blackColor];
    [secondView addSubview:lbl];
    
    UITapGestureRecognizer *gec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabCoin:)];
    gec.numberOfTapsRequired = 1;
    [basicView addGestureRecognizer:gec];
    
    roundCnt = 50;
}

-(void) tabCoin:(UIGestureRecognizer *) gr
{
    NSLog(@"tab...");
    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 1.0f;
//    animation.repeatCount = 10;
//    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
//    animation.type = @"oglFlip";
//    animation.subtype = @"fromLeft";
//    animation.startProgress = 0.0f;
//    animation.endProgress = 1.0f;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"frame"];
//    animation2.fromValue = [NSValue valueWithCGRect:secondView.frame];
//    animation2.toValue = [NSValue valueWithCGRect:firstView.frame];
//    
//    CAAnimationGroup *grouponAnimaiton = [CAAnimationGroup animation];
//    grouponAnimaiton.animations = @[animation,animation2];
//    grouponAnimaiton.duration = 1.0f;
//    grouponAnimaiton.repeatCount = 10;

//    [basicView.layer addAnimation:animation forKey:@"catAnnimation"];
    
//    [basicView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
//    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//        [basicView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [self roundOnce:0.3f];
}

-(void) roundOnce:(float) time
{
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:time];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    //        [UIView setAnimationRepeatCount:5];
    [UIView setAnimationRepeatAutoreverses:NO];
    //        [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:basicView cache:YES];
    [basicView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
}

-(void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    ++index;
    
    if (index < roundCnt)
    {
        [self roundOnce:0.3f+0.1f];
    }
    else
    {
        index=0;
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
