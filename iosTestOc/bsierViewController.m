//
//  bsierViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-27.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "bsierViewController.h"
#import "CanView.h"

@interface bsierViewController ()

@end

@implementation bsierViewController

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
    CanView *cv = [[CanView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:cv];
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
