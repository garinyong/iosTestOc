//
//  CoinViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-8-26.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoinView.h"

@interface CoinViewController : UIViewController
{
    UIView *basicView;
    CoinView *firstView;
    CoinView *secondView;
    int roundCnt;
    int index;
}
@end
