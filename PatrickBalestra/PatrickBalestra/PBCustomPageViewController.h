//
//  PBCustomPageViewController.h
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import <UIKit/UIKit.h>
@import QuartzCore;
@import StoreKit;

@interface PBCustomPageViewController : UIViewController <UIScrollViewDelegate, SKStoreProductViewControllerDelegate> {
    CGPoint lastOffset;
    NSTimeInterval lastOffsetCapture;
    BOOL isScrollingFast;
}

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *rotatingMenu;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIView *thirdView;
@property (nonatomic, strong) UIView *fourthView;
@property (nonatomic, strong) UIView *fifthView;

@property (weak, nonatomic) IBOutlet UIView *cameraView;

- (instancetype)initWithViewController:(NSArray *)viewControllers;

@end
