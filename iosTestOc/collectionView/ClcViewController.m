//
//  ClcViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-9-9.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ClcViewController.h"

@interface ClcViewController ()

@end

@implementation ClcViewController

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
    
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(width,height)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 0.0f;
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    contentView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, height)
                                             collectionViewLayout:flowLayout];
    [contentView registerClass:[PicViewCell class] forCellWithReuseIdentifier:@"contentViewIdentifier"];
    contentView.backgroundColor = [UIColor clearColor];
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
//    [contentView setContentOffset:CGPointMake(width, 0.0F)];
    contentView.dataSource = self;
    [self.view addSubview:contentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)cView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // must be dequeueReusableCellWithReuseIdentifier !!!!
    PicViewCell *cell = (PicViewCell *)[cView dequeueReusableCellWithReuseIdentifier:@"contentViewIdentifier" forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"%d.JPG",indexPath.row%3];
    cell.imgView.image = [UIImage imageNamed:imageName];
    return cell;
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
//    int curOffSet = scrollView.contentOffset.x;
//    
//    int page = curOffSet/320;
//    int juli = curOffSet%320;
//    if (page>=2&&juli>30)
//    {
//        [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:NO];
//    }
    
//    float targetX = scrollView.contentOffset.x;
//    int numCount = [contentView numberOfItemsInSection:0];
//    float ITEM_WIDTH = scrollView.frame.size.width;
//    
//    if (numCount>=3)
//    {
//        if (targetX < ITEM_WIDTH/2) {
//            [scrollView setContentOffset:CGPointMake(targetX+ITEM_WIDTH *numCount, scrollView.contentOffset.y)];
//        }
//        else if (targetX >ITEM_WIDTH/2+ITEM_WIDTH *numCount)
//        {
//            [scrollView setContentOffset:CGPointMake(targetX-ITEM_WIDTH *numCount, scrollView.contentOffset.y)];
//        }
//    }
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
