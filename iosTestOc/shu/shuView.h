//
//  shuView.h
//  iosTestOc
//
//  Created by gaoyong on 14-9-10.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shuView : UIView
{
    UIColor *drawColor;
    NSString *txt;
}

- (id)initWithFrame:(CGRect)frame drawcolor_:(UIColor *) drawcolor_  txt:(NSString *) txt_;
@end
