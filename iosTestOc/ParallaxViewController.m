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
    [UIView animateWithDuration:3 animations:^{
        imgView.transform = CGAffineTransformMakeScale(3, 3);
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
