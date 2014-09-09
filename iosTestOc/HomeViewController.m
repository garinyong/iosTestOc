//
//  HomeViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-21.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"
#import "AnimationViewController.h"
#import "ExampleViewController.h"
#import "ZhimaViewController.h"
#import "FanYeViewController.h"
#import "juHuaViewController.h"
#import "CoinViewController.h"
#import "ParallaxViewController.h"
#import "bsierViewController.h"
#import "ClcViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    // Do any additional setup after loading the view from its nib.
    
    dataArr = [NSArray arrayWithObjects:@"mao bo li",@"jerry",@"zhang jia",@"oooye",@"newlity",
               @"juhua",@"coinhua",@"parallax",@"basier",@"PicRound" , nil];
}

- (void)didReceiveMemoryWarning
{
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
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identfider = @"temCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfider];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfider];
    }
    
    cell.textLabel.text = [dataArr objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ViewController *vc = [ViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            AnimationViewController *vc = [AnimationViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            ExampleViewController *vc = [ExampleViewController new];
            [self.navigationController presentViewController:vc animated:YES completion:^{
                
            }];
            break;
        }
        case 3:
        {
            ZhimaViewController *vc = [ZhimaViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:
        {
            FanYeViewController *vc = [FanYeViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:
        {
            juHuaViewController *vc = [juHuaViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6:
        {
            CoinViewController *vc = [CoinViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7:
        {
            ParallaxViewController *vc = [ParallaxViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 8:
        {
            bsierViewController *vc = [bsierViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 9:
        {
            ClcViewController *vc = [ClcViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
