//
//  ClcViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-9-9.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicViewLayOut.h"
#import "PicViewCell.h"

@interface ClcViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *contentView;
}
@end
