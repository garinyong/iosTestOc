//
//  niceViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-9-10.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestMapViewController.h"

@interface niceViewController : UIViewController<UIScrollViewDelegate>
{
    UIImageView *showImgView;
    UIView *detailView;
    float maxJuli;
    float imgViewHeight;
    float overScreenHeight;
    UIScrollView *contentView;
    
    float begingContentOffset;
    
    UIView *smallWindowView;
    
    TestMapViewController *testViewController;
}
@end
