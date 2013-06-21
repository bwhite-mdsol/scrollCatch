//
//  SCViewController.h
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCViewController : UIViewController <UIScrollViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) UIScrollView *outerScrollView;
@property (weak, nonatomic) IBOutlet UIView *buildingView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end
