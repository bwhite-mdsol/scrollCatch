//
//  ScrollCell.h
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// step 1c -- add protocol declaraiont
//
//@protocol ScrollingCellDelegate;

@interface ScrollCell : UICollectionViewCell <UIScrollViewDelegate>
@property (nonatomic, strong) UIColor *color;

//
// step 1b -- add delegate prop and predefind above
//
//@property (nonatomic, strong) id<ScrollingCellDelegate> delegate;

@end

//
// step 1a -- add protocol declarion
//
//@protocol ScrollingCellDelegate <NSObject>
//- (void) scrollingCellDidBeginPulling:(ScrollCell*)cell;
//- (void) scrollingCell:(ScrollCell*)cell didChangePullOffset:(CGFloat)offset;
//- (void) scrollingCellDidEndPulling:(ScrollCell*)cell;
//@end
//
// step 1 end
//
