//
//  TestMapViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-9-11.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TestMapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *mapView;
}
@end
