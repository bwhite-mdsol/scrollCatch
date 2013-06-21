//
//  ScrollCell.m
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import "ScrollCell.h"

#define PULL_THRESHOLD 80

@implementation ScrollCell {
  UIScrollView *_scrollView;
  UIView *_colorView;
  
  BOOL _pulling;
}

#pragma mark UIScrollViewDelegat
- (void) scrollViewDidScroll:(UIScrollView*)scrollView
{
  CGFloat offset = scrollView.contentOffset.x;
  
  if (offset > PULL_THRESHOLD && !_pulling) {
    [_delegate scrollingCellDidBeginPulling:self];
    _pulling = YES;
  }
  
  if (_pulling) {
    CGFloat pullOffset = MAX(0, offset - PULL_THRESHOLD);
    [_delegate scrollingCell:self didChangePullOffset:pullOffset];

//
// step 2b -- fix cell under finger
//
    _scrollView.transform = CGAffineTransformMakeTranslation(pullOffset, 0);
  }
}

- (void) scrollingEnded {
  [_delegate scrollingCellDidEndPulling:self];
  _pulling = NO;
//
// step 2a -- refill cell when done scrolling
//
  _scrollView.contentOffset = CGPointZero;
  
//
// step 2c -- reset for step 2b when done scrolling
//
  _scrollView.transform = CGAffineTransformIdentity;
}

- (void) scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate
{
  if (!decelerate) {
    [self scrollingEnded];
  }
}

- (void) scrollViewDidEndDecelerating:(UIScrollView*)scrollView {
  [self scrollingEnded];
}

#pragma mark - Init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      _colorView = [[UIView alloc] init];
      
      _scrollView = [[UIScrollView alloc] init];
      _scrollView.delegate = self;
      _scrollView.pagingEnabled = YES;
      _scrollView.showsHorizontalScrollIndicator = NO;
      
      [self.contentView addSubview:_scrollView];
      [_scrollView addSubview:_colorView];

    }
    return self;
}

- (void) setColor:(UIColor *)color
{
  _color = color;
  _colorView.backgroundColor = color;
}

- (void) layoutSubviews
{
  UIView *contentView = [self contentView];
  CGRect bounds = contentView.bounds;

//
// step 2d -- slide fully to the left by adding PULL_THRESHOLD
//
  CGFloat pageWidth = bounds.size.width + PULL_THRESHOLD;
  _scrollView.frame = CGRectMake(0, 0, pageWidth, bounds.size.height);
  _scrollView.contentSize = CGSizeMake(pageWidth*2, bounds.size.height);
  
  _colorView.frame = [_scrollView convertRect:bounds fromView:contentView];
}

@end
