//
//  MainViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-9-12.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
    UITableView *contentView;
}
@end
