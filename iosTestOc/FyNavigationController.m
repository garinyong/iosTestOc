//
//  FyNavigationController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-22.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "FyNavigationController.h"
#import <QuartzCore/QuartzCore.h>

#define degreeToRadians(x) (M_PI * (x) / 180.0)

@interface FyNavigationController ()

@end

@implementation FyNavigationController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    if (!flag) {
        return [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
    
    self.view.layer.transform = CATransform3DMakeScale(0.95, 0.95, 1);
    
    CGRect oldframe = self.view.frame;
    self.view.layer.anchorPoint = CGPointMake(0.5, 0);
    self.view.frame = oldframe;
    
    //先本页倾斜
    [UIView animateWithDuration:0.3 animations:^{
//        self.view.layer.transform = CATransform3DMakeScale(0.95, 0.95, 0);
        self.view.layer.transform = CATransform3DRotate(self.view.layer.transform,degreeToRadians(-20), 1, 0, 0);
//        self.view.layer.transform = CATransform3DMakeScale(0.9, 0.9 , 1);
    } completion:^(BOOL finished) {
        
//        return [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    }];
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
