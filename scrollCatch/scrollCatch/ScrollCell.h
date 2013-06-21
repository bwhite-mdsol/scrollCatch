//
//  ScrollCell.h
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollingCellDelegate;

@interface ScrollCell : UICollectionViewCell <UIScrollViewDelegate>
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) id<ScrollingCellDelegate> delegate;

@end

@protocol ScrollingCellDelegate <NSObject>
- (void) scrollingCellDidBeginPulling:(ScrollCell*)cell;
- (void) scrollingCell:(ScrollCell*)cell didChangePullOffset:(CGFloat)offset;
- (void) scrollingCellDidEndPulling:(ScrollCell*)cell;
@end
