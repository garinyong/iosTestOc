//
//  FanYeViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-25.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "FanYeViewController.h"

@interface FanYeViewController ()

@end

@implementation FanYeViewController

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
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor greenColor];
    
    // Do any additional setup after loading the view.
    bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImgView.image = [UIImage imageNamed:@"bg1.jpg"];
    
    CGRect oldFrame = bgImgView.frame;
    
    bgImgView.layer.anchorPoint = CGPointMake(0, 0.5);
    
    bgImgView.frame = oldFrame;
    
    [self.view addSubview:bgImgView];
    
    [self performSelector:@selector(fanye) withObject:nil afterDelay:3];
}


-(void) fanye
{
    NSLog(@"fanye...");
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CATransform3D t1 = CATransform3DIdentity;
        t1.m34 = -1/1500;
        
        CATransform3D t2 = CATransform3DRotate(t1,M_PI_2, 0 , 1, 0);
        
        CATransform3D t3 = CATransform3DRotate(t1,-degreeToRadians(0.5), 1 , 0, 0);

        CATransform3D t4 = CATransform3DConcat(t2, t3);
        
        bgImgView.layer.transform = t4;

    } completion:^(BOOL finished) {
        
    }];
    
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
