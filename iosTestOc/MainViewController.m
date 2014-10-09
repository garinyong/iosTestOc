//
//  MainViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-12.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "MainViewController.h"
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
#import "shuguangViewController.h"
#import "niceViewController.h"
#import "TTViewController.h"
#import "netEasyYunViewController.h"
#import "fliderViewController.h"
#import "SLTestViewController.h"
#import "vvCCViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    dataArr = [NSArray arrayWithObjects:@"mao bo li",@"jerry",@"zhang jia",@"oooye",@"newlity",
               @"juhua",@"coinhua",@"parallax",@"basier",@"PicRound" ,@"shuguang" ,@"niceViewC" ,@"TTViewController" , @"yun", @"flider",@"sessT",@"vvCC", nil];
    
    contentView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
    contentView.delegate = self;
    contentView.dataSource = self;
    [self.view addSubview:contentView];
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
        case 10:
        {
            shuguangViewController *vc = [shuguangViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 11:
        {
            niceViewController *vc = [niceViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 12:
        {
            TTViewController *vc = [TTViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 13:
        {
            netEasyYunViewController *vc = [netEasyYunViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 14:
        {
            fliderViewController *vc = [fliderViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 15:
        {
            SLTestViewController *vc = [SLTestViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 16:
        {
            vvCCViewController *vc = [vvCCViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
