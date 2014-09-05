//
//  juHuaViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-25.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "juHuaViewController.h"
#import "juHuaView1.h"

@interface juHuaViewController ()

@end

@implementation juHuaViewController

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
    
    self.view.backgroundColor = [UIColor colorWithRed:115/255.0f green:152/255.0f blue:171/255.0f alpha:1];
    
    juHuaView1 *juhua = [[juHuaView1 alloc] init];
    juhua.center = self.view.center;
    [self.view addSubview:juhua];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 1;
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:degreeToRadians(360)];
    animation.repeatCount = HUGE_VAL;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [juhua.layer addAnimation:animation forKey:@"dfafdafdas"];
    
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
