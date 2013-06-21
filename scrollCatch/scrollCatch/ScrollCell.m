//
//  ScrollCell.m
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import "ScrollCell.h"

@implementation ScrollCell {
  UIScrollView *_scrollView;
  UIView *_colorView;
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

  CGFloat pageWidth = bounds.size.width;
  _scrollView.frame = CGRectMake(0, 0, pageWidth, bounds.size.height);
  _scrollView.contentSize = CGSizeMake(pageWidth*2, bounds.size.height);
  
  _colorView.frame = [_scrollView convertRect:bounds fromView:contentView];
}

@end
