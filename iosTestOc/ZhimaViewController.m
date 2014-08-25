//
//  ZhimaViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-22.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ZhimaViewController.h"

@interface ZhimaViewController ()

@end

@implementation ZhimaViewController

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
    
//    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    float splitSpan = 5;
    
    float widthSpan = (320 - 5 * 3)/2;
    
    float heightSpan = (self.view.bounds.size.height - 64 - 5 * 4)/3;
    
    viewArrs = [NSMutableArray array];
    
    NSArray *colors = @[[UIColor greenColor],[UIColor redColor],[UIColor orangeColor]
                        ,[UIColor yellowColor],[UIColor magentaColor],[UIColor grayColor]
                        ,[UIColor purpleColor],[UIColor blueColor],[UIColor cyanColor]];
    
    for (int i = 0; i < 6; i++)
    {
        int row = i / 2;
        CGRect rect = CGRectMake(splitSpan + (i % 2 == 0 ? 0:(widthSpan+splitSpan)) ,
                                 64+splitSpan + row * (heightSpan + splitSpan),
                                 widthSpan, heightSpan);
        
        UIView *temView = [self createViewByAttr:[colors objectAtIndex:i] frame:rect];
        
        [viewArrs addObject:temView];
        
        [self.view addSubview:temView];
    }
}

-(UIView *) createViewByAttr:(UIColor *) color frame:(CGRect) frame_
{
    UIView *uv = [UIView new];
    uv.frame = frame_;
    uv.backgroundColor = color;
    
    return uv;
}

-(void) expandAnimation
{
    for (UIView *temUv in viewArrs)
    {
        float sec = arc4random() % 20/10.0;
        
        [UIView animateWithDuration:sec animations:^{
           
        }];
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
