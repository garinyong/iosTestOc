//
//  TTViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-12.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()

@end

@implementation TTViewController

-(void) dealloc
{
    firstTableView.delegate = nil;
    secondTableView.delegate = nil;
    firstTableView.dataSource = nil;
    secondTableView.dataSource = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isFirstOn = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
    secondTableView.delegate = self;
    secondTableView.dataSource = self;
    [self.view addSubview:secondTableView];
    
    firstTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 66, 320, self.view.bounds.size.height -66) style:UITableViewStylePlain];
    firstTableView.delegate = self;
    firstTableView.dataSource = self;
    [self.view addSubview:firstTableView];
    
    btnGoToTop = [UIButton buttonWithType:UIButtonTypeCustom];
    btnGoToTop.frame = CGRectMake(320-100,self.view.bounds.size.height-50,60, 44);
    btnGoToTop.layer.borderWidth = 0.5;
    btnGoToTop.titleLabel.textAlignment = NSTextAlignmentLeft;
    btnGoToTop.layer.borderColor =[UIColor blueColor].CGColor;
    [btnGoToTop setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnGoToTop setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btnGoToTop setTitle:@"Top" forState:UIControlStateNormal];
    [btnGoToTop addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btnGoToTop.hidden = YES;
    
    [self.view addSubview:btnGoToTop];
}

-(void) btnClick
{
    [self goToTop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) exChangeViews:(BOOL) isOffsetMoveToZero
{
    isAnimting = YES;
    
    //滚入第二瓶
    if (isFirstOn)
    {
        [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            firstTableView.frame = CGRectMake(firstTableView.frame.origin.x, firstTableView.frame.origin.y - self.view.bounds.size.height,firstTableView.frame.size.width,firstTableView.frame.size.height);
            
            secondTableView.frame = CGRectMake(secondTableView.frame.origin.x, secondTableView.frame.origin.y - self.view.bounds.size.height,secondTableView.frame.size.width,secondTableView.frame.size.height);
        }completion:^(BOOL finished) {
            isFirstOn = !isFirstOn;
            isAnimting = NO;
            btnGoToTop.hidden = NO;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            firstTableView.frame = CGRectMake(firstTableView.frame.origin.x, firstTableView.frame.origin.y + self.view.bounds.size.height,firstTableView.frame.size.width,firstTableView.frame.size.height);
            
            secondTableView.frame = CGRectMake(secondTableView.frame.origin.x, secondTableView.frame.origin.y + self.view.bounds.size.height,secondTableView.frame.size.width,secondTableView.frame.size.height);
        }completion:^(BOOL finished) {
            isFirstOn = !isFirstOn;
            isAnimting = NO;
            if (isOffsetMoveToZero) {
                [firstTableView setContentOffset:CGPointZero animated:YES];
                [secondTableView setContentOffset:CGPointMake(0, -64) animated:YES];
                btnGoToTop.hidden = YES;
            }
        }];
    }
}

-(void) goToTop
{
    if (isAnimting) {
        return;
    }
    
    if (isFirstOn) {
        return;
    }
    
    [self exChangeViews:YES];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == firstTableView)
    {
        if (scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height + 70 && isFirstOn && isAnimting==NO)
        {
            [self exChangeViews:NO];
        }
    }
    else if (scrollView == secondTableView)
    {
        if (scrollView.contentOffset.y < -64 - 70 && isFirstOn==NO && isAnimting==NO)
        {
            [self exChangeViews:NO];
        }
    }
}


#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return 30;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (tableView == firstTableView) {
        static NSString * identifer = @"firstTableCell";
        
        UITableViewCell * abCell = [tableView dequeueReusableCellWithIdentifier:identifer];
        
        if (!abCell) {
            abCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            abCell.frame = CGRectMake(0, 0, 320, 44);
            
            abCell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
        }
        
        return abCell;
    }
    else
    {
        static NSString * identifer = @"secondTableCell";
        
        UITableViewCell * abCell = [tableView dequeueReusableCellWithIdentifier:identifer];
        
        if (!abCell) {
            abCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            abCell.frame = CGRectMake(0, 0, 320, 44);
            
            abCell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
        }
        
        return abCell;
    }
}


#pragma mark -- UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return 44;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    
}

@end
