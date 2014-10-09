//
//  SLTestViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-10-8.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLTestViewController : UIViewController <UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UISearchDisplayController *mySearchDisplayController;
    UISearchBar *mySearchBar;
}
@end
