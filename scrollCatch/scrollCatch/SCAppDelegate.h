//
//  SCAppDelegate.h
//  scrollCatch
//
//  Created by Bob White on 6/20/13.
//  Copyright (c) 2013 Bob White. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCViewController.h"

@interface SCAppDelegate : UIResponder <UIApplicationDelegate>

//@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) SCViewController *scController;

@end
