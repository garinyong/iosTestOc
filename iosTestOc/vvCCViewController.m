//
//  vvCCViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-10-8.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "vvCCViewController.h"

@interface vvCCViewController ()

@end

@implementation vvCCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"click" style:UIBarButtonItemStyleDone target:self action:@selector(btnClick)];
}

-(void) btnClick
{
    [UIView animateWithDuration:1.0f animations:^{
       
        CGAffineTransform curTransform = CGAffineTransformMakeScale(0.2, 0.2);
        
        curTransform = CGAffineTransformRotate(curTransform, degreeToRadians(180));
        
        self.view.transform = curTransform;
    }completion:^(BOOL finished) {
        if (finished) {
            CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            basic.duration = 2;
            basic.fromValue = [NSNumber numberWithFloat:0];
            basic.toValue = [NSNumber numberWithFloat:degreeToRadians(360)];
            basic.removedOnCompletion = NO;
            basic.fillMode = kCAFillModeForwards;
//            basic.autoreverses = YES;
            basic.repeatCount = HUGE_VAL;
            
            [self.view.layer addAnimation:basic forKey:@"animiationHHHHH"];
        }
    }
    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
