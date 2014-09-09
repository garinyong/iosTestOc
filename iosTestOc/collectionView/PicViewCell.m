//
//  PicViewCell.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-9.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "PicViewCell.h"

@implementation PicViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imgView.contentMode = UIViewContentModeCenter;
        [self addSubview:_imgView];
        
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
