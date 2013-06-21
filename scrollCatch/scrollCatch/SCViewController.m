//
//  SCViewController.m
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import "SCViewController.h"
#import "ScrollCell.h"

//
// step 4 - conform to protocol
//
//@implementation SCViewController

@interface SCViewController () <ScrollingCellDelegate>
@end

@implementation SCViewController

#pragma mark - ScrollingCellDelegate

- (void) scrollingCellDidBeginPulling:(ScrollCell*)cell
{
  [_outerScrollView setScrollEnabled:NO];
  _buildingView.backgroundColor = cell.color;
}

- (void) scrollingCell:(ScrollCell *)cell didChangePullOffset:(CGFloat)offset
{
  [_outerScrollView setContentOffset:CGPointMake(offset,0)];
}

- (void) scrollingCellDidEndPulling:(ScrollCell*)cell
{
  [_outerScrollView setScrollEnabled:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.myRowCount;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  ScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  float frac = ((256.0/[self myRowCount])*(float)[indexPath row])/255.0;

  cell.color = [UIColor colorWithRed:1-frac green:0.0 blue:frac alpha:1.0];
  cell.delegate = self;
  
  return cell;
}

- (NSInteger) myRowCount
{
  return 16;
}

#pragma mark - Init
- (void) viewDidLoad
{
  [super viewDidLoad];

  [_collectionView registerClass:[ScrollCell class] forCellWithReuseIdentifier:@"cell"];
  
  _outerScrollView = (UIScrollView*)self.view;
  
  [_outerScrollView setContentSize:CGSizeMake(640, 460)];
}
@end
