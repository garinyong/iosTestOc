//
//  shuguangViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-10.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "shuguangViewController.h"

@interface shuguangViewController ()

@end

@implementation shuguangViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        viewList = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
//
//    [self makeRotateTest];
//    
//    return;
    
    shuView *shuV;
    
    for (int i = 0; i < 5; i++)
    {
        UIColor *ranColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
        
         shuV = [[shuView alloc] initWithFrame:CGRectMake(320 - 60, 100, 50, 50) drawcolor_:ranColor txt:[NSString stringWithFormat:@"coin%d",i+1]];
        
        [viewList addObject:shuV];
        
        [self.view addSubview:shuV];
    }
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = shuV.frame;
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) makeRotateTest
{
    UIColor *ranColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
    
    shuVTest = [[shuView alloc] initWithFrame:CGRectMake(100, 100, 50, 50) drawcolor_:ranColor txt:@"哇哈哈"];
    
    [self.view addSubview:shuVTest];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = shuVTest.frame;
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) makeRotate
{
    CGFloat angel = M_PI ;
    
    shuVTest.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        
        CGFloat angel = M_PI / 4;
        
        shuVTest.transform = CGAffineTransformMakeRotation(angel);
    }];
    
    return;
    
    CABasicAnimation *anmation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anmation2.duration = 10;
    anmation2.fromValue = [NSNumber numberWithFloat:0.0];
    anmation2.toValue = [NSNumber numberWithFloat:angel];
    anmation2.repeatCount = 1;
    anmation2.fillMode = kCAFillModeForwards;
    anmation2.removedOnCompletion = NO;
    
    [shuVTest.layer addAnimation:anmation2 forKey:@"fdafdsafasd"];
}

-(void) btnClick
{
    NSLog(@"click");
    
//    [self makeRotate];
//    
//    return;
    
//    [self anmimateWithBlock];
    [self anmimateCAAnimation];
}

-(void) anmimateWithBlock
{
    isOpen = !isOpen;
    
    float span = 50.0f + 10.0f;
    
    //最上边的不动
    if (isOpen)
    {
        for (int i = 0; i< viewList.count-1; i++)
        {
            shuView *tem = [viewList objectAtIndex:i];
            
            float duration = (viewList.count-1 - i)*0.1;
            
            NSLog(@"%f",duration);
            
            CGFloat angel = M_PI * 2;
            
            [UIView animateWithDuration:duration animations:^{
                tem.frame = CGRectMake(tem.frame.origin.x - span * (viewList.count - 1 - i), tem.frame.origin.y, tem.frame.size.width, tem.frame.size.height);
                
                tem.transform = CGAffineTransformMakeRotation(angel);
            }];
        }
    }
    else
    {
        for (int i = 0; i< viewList.count-1; i++)
        {
            shuView *tem = [viewList objectAtIndex:i];
            
            float duration = (viewList.count-1 - i)*0.08;
            
            NSLog(@"%f",duration);
            
            [UIView animateWithDuration:duration animations:^{
                tem.frame = CGRectMake(tem.frame.origin.x + span * (viewList.count - 1 - i), tem.frame.origin.y, tem.frame.size.width, tem.frame.size.height);
            }];
            
            CGFloat angel = - M_PI * 2 * (viewList.count-1 - i);
            
            duration = (viewList.count-1 - i)*0.5;
            
            [UIView animateWithDuration:duration animations:^{
                tem.transform = CGAffineTransformMakeRotation(angel);
            } completion:^(BOOL finished) {
                tem.transform = CGAffineTransformIdentity;
            }];
        }
    }
}


-(void) anmimateCAAnimation
{
    isOpen = !isOpen;
    
    float span = 50.0f + 10.0f;
    
    //最上边的不动
    if (isOpen)
    {
        for (int i = 0; i< viewList.count-1; i++)
        {
            shuView *tem = [viewList objectAtIndex:i];
            
            float duration = (viewList.count-1 - i)*0.1;
            
            NSLog(@"%f",duration);
            
            NSLog(@"position: x:%f y:%f",tem.layer.position.x,tem.layer.position.y);
            
            CABasicAnimation *anmation1 = [CABasicAnimation animationWithKeyPath:@"position.x"];
            anmation1.fromValue = [NSNumber numberWithFloat:tem.layer.position.x];
            anmation1.toValue = [NSNumber numberWithFloat:tem.layer.position.x-span * (viewList.count - 1 - i)];
            
            CGFloat angel = M_PI * 2 * (viewList.count-1 - i);
            
            CABasicAnimation *anmation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            anmation2.fromValue = [NSNumber numberWithFloat:0.0];
            anmation2.toValue = [NSNumber numberWithFloat:angel];
            
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.animations = @[anmation1,anmation2];
            group.duration = duration;
            group.fillMode = kCAFillModeForwards;
            group.removedOnCompletion = NO;
            group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            
            [tem.layer addAnimation:group forKey:@"xbdsafdaf"];
        }
    }
    else
    {
        for (int i = 0; i< viewList.count-1; i++)
        {
            shuView *tem = [viewList objectAtIndex:i];
            
            float duration = (viewList.count-1 - i)*0.1;
            
            NSLog(@"%f",duration);
            
            
            NSLog(@"position: x:%f y:%f",tem.layer.position.x,tem.layer.position.y);
            
            CABasicAnimation *anmation1 = [CABasicAnimation animationWithKeyPath:@"position.x"];
            anmation1.fromValue = [NSNumber numberWithFloat:tem.layer.position.x-span * (viewList.count - 1 - i)];
            anmation1.toValue = [NSNumber numberWithFloat:tem.layer.position.x];
            
            CGFloat angel = M_PI * 2 * (viewList.count-1 - i);
            
            CABasicAnimation *anmation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            anmation2.fromValue = [NSNumber numberWithFloat:angel];
            anmation2.toValue = [NSNumber numberWithFloat:0.0];
            
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.animations = @[anmation1,anmation2];
            group.duration = duration;
            group.fillMode = kCAFillModeForwards;
            group.removedOnCompletion = NO;
            group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            
            [tem.layer addAnimation:group forKey:@"xbdsafdaf"];
        }
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
