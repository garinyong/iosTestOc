//
//  TestMapViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-11.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "TestMapViewController.h"

@interface TestMapViewController ()

@end

@implementation TestMapViewController

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
    
    mapView=[[MKMapView alloc]initWithFrame:self.view.bounds];
    mapView.scrollEnabled=NO;
    mapView.delegate = self;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 23.134844f;
    coordinate.longitude = 113.317290f;
    MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
    ann.coordinate = coordinate;
    [mapView addAnnotation:ann];
    
    [self.view addSubview:mapView];
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
