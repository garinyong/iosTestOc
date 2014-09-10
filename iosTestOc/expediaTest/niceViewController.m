//
//  niceViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-10.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "niceViewController.h"

@interface niceViewController ()

@end

@implementation niceViewController

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
    
    self.view.backgroundColor = [UIColor grayColor];
    
    maxJuli = 30;
    
    showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    
    showImgView.center = CGPointMake(showImgView.center.x, (66 + 200)/2);
    
    showImgView.image = [UIImage imageNamed:@"0.jpg"];
    showImgView.backgroundColor = [UIColor redColor];
//    showImgView.clipsToBounds = YES;
    showImgView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:showImgView];
    
    UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    contentView.contentSize = CGSizeMake(320, self.view.bounds.size.height + 300);
    contentView.delegate = self;
    [self.view addSubview:contentView];
    
    //downView
    downView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, self.view.bounds.size.height - 200 + 300)];
    downView.backgroundColor = [UIColor greenColor];
    [contentView addSubview:downView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    float curContentOffset = scrollView.contentOffset.y;
    
    if (curContentOffset>0) {
        return;
    }
    
    NSLog(@"curContentOffset:%f",curContentOffset);
    
    showImgView.center = CGPointMake(showImgView.center.x, (66 + 200 - curContentOffset)/2);

    
    if (curContentOffset>maxJuli) {
        //下滑
    }
    else
    {
//        showImgView.frame =
    }
}

-(void) exeXiaHua
{
    
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
