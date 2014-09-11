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
    if (self)
    {
        // Custom initialization
        maxJuli = 50;
        imgViewHeight = 200;
        overScreenHeight = 300;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //图片框
    showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, imgViewHeight)];
    showImgView.center = CGPointMake(showImgView.center.x, (66 + imgViewHeight)/2);
    showImgView.image = [UIImage imageNamed:@"1213.png"];
    showImgView.backgroundColor = [UIColor clearColor];
    showImgView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:showImgView];
    
    contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    contentView.contentSize = CGSizeMake(320, self.view.bounds.size.height + overScreenHeight);
    contentView.delegate = self;
    contentView.scrollsToTop = NO;
    [self.view addSubview:contentView];
    
    detailView = [[UIView alloc] initWithFrame:CGRectMake(0, imgViewHeight, 320, self.view.bounds.size.height - imgViewHeight + overScreenHeight)];
    detailView.backgroundColor = [UIColor greenColor];
    [contentView addSubview:detailView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [contentView addGestureRecognizer:singleTap];
}


#pragma mark UIGestureRecognizerDelegate
//点击
- (void)handleTap:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"tap");
    
    return;
    
    if (isDown)
    {
        [self exeXiaHua:NO];
    }
    else
    {
        [self exeXiaHua:YES];
    }
    
    isDown = !isDown;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    float curContentOffset = scrollView.contentOffset.y;
    
    NSLog(@"curContentOffset:%f",curContentOffset);
    
    showImgView.center = CGPointMake(showImgView.center.x, (66 + imgViewHeight - curContentOffset)/2);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    float endDraggingContentOffset = scrollView.contentOffset.y;
    
    NSLog(@"endDraggingContentOffset:%f",endDraggingContentOffset);
    
    if (endDraggingContentOffset>= 0) {
        return;
    }
    
    //向下
    if (endDraggingContentOffset<begingContentOffset)
    {
        if (abs(endDraggingContentOffset - begingContentOffset)>maxJuli)
        {
            [self exeXiaHua:YES];
        }
    }
    else
    {
        if (abs(endDraggingContentOffset - begingContentOffset)>maxJuli)
        {
            [self exeXiaHua:NO];
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    begingContentOffset = scrollView.contentOffset.y;
}

-(void) exeXiaHua:(BOOL) isXiaHua
{
    float xiaJuli = self.view.bounds.size.height - imgViewHeight;
    if (isXiaHua)
    {
        [contentView setContentOffset:CGPointMake(0, - xiaJuli) animated:YES];
    }
    else
    {
        [contentView setContentOffset:CGPointZero animated:YES];
    }
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
