//
//  fliderViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-30.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "fliderViewController.h"

@interface fliderViewController ()

@end

@implementation fliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    contentView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    contentView.delegate = self;
    contentView.dataSource = self;
    [self.view addSubview:contentView];
    
    UITapGestureRecognizer *gec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabCoin:)];
    gec.numberOfTapsRequired = 1;
    [contentView addGestureRecognizer:gec];
}

-(void) tabCoin:(UIGestureRecognizer *) gr
{
    CGPoint p = [gr locationInView:self.view];
    
    float height = p.y + 64;
    
    [self splitViewPushView:height];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"fliderCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
    }
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void) splitViewPushView:(float) height
{
    CGRect rect1 = CGRectMake(0, 0, self.view.bounds.size.width, height);
    
    CGRect rect2 = CGRectMake(0, height, self.view.bounds.size.width, self.view.bounds.size.height - height);
    
    UIImageView *upImgView = [[UIImageView alloc] initWithFrame:rect1];
    upImgView.image = [self imageFromView:self.view];
    upImgView.backgroundColor = [UIColor greenColor];
    upImgView.contentMode = UIViewContentModeTop;
    upImgView.clipsToBounds = YES;
    [self.view addSubview:upImgView];
    
    UIImageView *downImgView = [[UIImageView alloc] initWithFrame:rect2];
    downImgView.backgroundColor = [UIColor redColor];
    downImgView.contentMode = UIViewContentModeBottom;
    downImgView.image = [self imageFromView:self.view];
    downImgView.clipsToBounds = YES;
    [self.view addSubview:downImgView];
    
    contentView.hidden = YES;
    
    [UIView animateWithDuration:0.5f animations:^{
       
        upImgView.frame = CGRectMake(upImgView.frame.origin.x, upImgView.frame.origin.y - upImgView.frame.size.height, upImgView.frame.size.width, upImgView.frame.size.height);
        
        downImgView.frame = CGRectMake(downImgView.frame.origin.x, downImgView.frame.origin.y + downImgView.frame.size.height, downImgView.frame.size.width, downImgView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [upImgView removeFromSuperview];
        [downImgView removeFromSuperview];
        
    }];
}

//获得屏幕图像
- (UIImage *)imageFromView: (UIView *) theView
{
    
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

//获得某个范围内的屏幕图像
- (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
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
