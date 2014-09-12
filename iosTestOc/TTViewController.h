//
//  TTViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-9-12.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView *firstTableView;
    UITableView *secondTableView;
    
    BOOL isFirstOn;
    BOOL isAnimting;
    
    UIButton *btnGoToTop;
}
@end
