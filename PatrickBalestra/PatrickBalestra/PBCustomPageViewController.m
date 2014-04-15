//
//  PBCustomPageViewController.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "PBCustomPageViewController.h"
#import "PBFirstViewController.h"
#import "PBSecondViewController.h"
#import "PBThirdViewController.h"
#import "PBFourthViewController.h"
#import "PBFifthViewController.h"
#import "UIColor+Colors.h"
#import "UIERealTimeBlurView.h"

@import AVFoundation;
@import Accelerate;

#define FIRST_PAGE              0
#define LAST_PAGE               _numberOfPages - 1
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface PBCustomPageViewController ()

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, assign) BOOL pageControlUsed;
@property (nonatomic, assign) BOOL animateSkillsCard;
@property (nonatomic, assign) BOOL animateProjectsCard;


@property (nonatomic, retain) AVCaptureSession *session;
@property (nonatomic, retain) AVCaptureDeviceInput *input;
@property (nonatomic, retain) AVCaptureDevice *device;
@property (nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *preview;

@end

@implementation PBCustomPageViewController

- (instancetype)initWithViewController:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    _numberOfPages = viewControllers.count;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Add camera preview in background
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    NSArray *devices = [[NSArray alloc]init];
    devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices){
        if([device position] == AVCaptureDevicePositionFront){
            _device = device;
            break;
        }
    }
    NSError *error;
    _input = [[AVCaptureDeviceInput alloc]initWithDevice:_device error:&error];
    if([_session canAddInput:_input]){
        [_session addInput:_input];
    }
    
    _stillImageOutput = [[AVCaptureStillImageOutput alloc]init];
    NSDictionary *outputSettings = @{AVVideoCodecKey : AVVideoCodecJPEG};
    [_stillImageOutput setOutputSettings:outputSettings];
    
    [_session addOutput:_stillImageOutput];
    
    CALayer *cameraLayer = _cameraView.layer;
    _cameraView.backgroundColor = [UIColor clearColor];
    [cameraLayer setMasksToBounds:YES];
    _preview = [[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) {
        _preview.connection.videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
    } else {
        _preview.connection.videoOrientation = AVCaptureVideoOrientationLandscapeRight;
    }
    
    [_preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_preview setFrame:CGRectMake(0, 0, 1024, 768)];
    
    [cameraLayer addSublayer:_preview];
    
    [_session startRunning];
    
    
    UIERealTimeBlurView *blurView = [[UIERealTimeBlurView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view insertSubview:blurView belowSubview:_scrollView];
    
    
    // Set up view controllers
    PBFirstViewController *first = (PBFirstViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"First"];
    PBSecondViewController *second = (PBSecondViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Second"];
    PBThirdViewController *third = (PBThirdViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Third"];
    PBFourthViewController *fourth = (PBFourthViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Fourth"];
    PBFifthViewController *fifth = (PBFifthViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Fifth"];
    
    _viewControllers = @[first, second, third, fourth, fifth];
    _numberOfPages = _viewControllers.count;
    
    _pageControl.numberOfPages = _numberOfPages;
    _titleLabel.textColor = [UIColor niceRedColor];
    
    _scrollView.delegate = (id)self;
    
    
    [self setupContentViews];
    
    _firstView = ((UIViewController *)[_viewControllers objectAtIndex:0]).view;
    _secondView = ((UIViewController *)[_viewControllers objectAtIndex:1]).view;
    _thirdView = ((UIViewController *)[_viewControllers objectAtIndex:2]).view;
    _fourthView = ((UIViewController *)[_viewControllers objectAtIndex:3]).view;
    _fifthView = ((UIViewController *)[_viewControllers objectAtIndex:4]).view;
    
    [self awesomeShadow:_firstView.layer];
    [self awesomeShadow:_secondView.layer];
    [self awesomeShadow:_thirdView.layer];
    [self awesomeShadow:_fourthView.layer];
    [self awesomeShadow:_fifthView.layer];
    
    _firstView.alpha = 0.0;
    _secondView.alpha = 0.0;
    _thirdView.alpha = 0.0;
    _fourthView.alpha = 0.0;
    _fifthView.alpha = 0.0;
    _pageControl.alpha = 0.0;
    _titleLabel.alpha = 0.0;
    
    CGFloat defaultProgress = 0.75 + ((((0 ) / 800)) * 0.25);
    [self animateViewNumber:2 withProgress:defaultProgress];
    [self animateViewNumber:3 withProgress:defaultProgress];
    [self animateViewNumber:4 withProgress:defaultProgress];
    [self animateViewNumber:5 withProgress:defaultProgress];
    
    [self addInterpolatingMotionEffects];
    
    // Listen to orientation change notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChangeNotification:) name:UIDeviceOrientationDidChangeNotification object:nil];
    // Listen to open product view controller notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openProduct:) name:@"openProduct" object:nil];
    
}

- (void)openProduct:(NSNotification *)notification {
    // Open SKStoreProductViewController to preview my apps
    SKStoreProductViewController *storeViewController = [[SKStoreProductViewController alloc] init];
    storeViewController.delegate = self;
    NSDictionary *parameters = [NSDictionary new];
    
    if ([notification.object integerValue] == 1) {
        parameters = @{SKStoreProductParameterITunesItemIdentifier: [NSNumber numberWithInteger:841925707]};
    } else if ([notification.object integerValue] == 2) {
        parameters = @{SKStoreProductParameterITunesItemIdentifier: [NSNumber numberWithInteger:639981766]};
    } else if ([notification.object integerValue] == 3) {
        parameters = @{SKStoreProductParameterITunesItemIdentifier: [NSNumber numberWithInteger:574170034]};
    } else if ([notification.object integerValue] == 4) {
        parameters = @{SKStoreProductParameterITunesItemIdentifier: [NSNumber numberWithInteger:562982490]};
    } else if ([notification.object integerValue] == 5) {
        parameters = @{SKStoreProductParameterITunesItemIdentifier: [NSNumber numberWithInteger:541887005]};
    }
    
    [storeViewController loadProductWithParameters:parameters completionBlock:^(BOOL result, NSError *error) {
        if (result)
            [self.parentViewController presentViewController:storeViewController animated:YES completion:nil];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    // Set alpha to 0 to then fade them in
    _firstView.alpha = 0.0;
    _secondView.alpha = 0.0;
    _thirdView.alpha = 0.0;
    _fourthView.alpha = 0.0;
    _fifthView.alpha = 0.0;
    _pageControl.alpha = 0.0;
    _titleLabel.alpha = 0.0;
}

- (void)viewDidAppear:(BOOL)animated {
    [self fadeInViewsAnimation];
}

- (void)fadeInViewsAnimation {
    // Fade in views
    [UIView animateKeyframesWithDuration:1.5 delay:0.5 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            _firstView.alpha = 1.0;
            _secondView.alpha = 1.0;
            _thirdView.alpha = 1.0;
            _fourthView.alpha = 1.0;
            _fifthView.alpha = 1.0;
            _pageControl.alpha = 1.0;
            _titleLabel.alpha = 1.0;
        }];
    } completion:NULL];
}

- (void)awesomeShadow:(CALayer *)layer {
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowRadius = 20.0f;
    layer.shadowOpacity = 0.35f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // Change Page control color based on the page number
    if (!_pageControlUsed) {
        CGFloat pageWidth = _scrollView.frame.size.width - 100;
        int page = floor((_scrollView.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1;
        _pageControl.currentPage = page;
        switch (_pageControl.currentPage) {
            case 0:
                _pageControl.currentPageIndicatorTintColor = [UIColor niceRedColor];
                break;
            case 1:
                _pageControl.currentPageIndicatorTintColor = [UIColor niceOrangeColor];
                break;
            case 2:
                _pageControl.currentPageIndicatorTintColor = [UIColor niceYellowColor];
                break;
            case 3:
                _pageControl.currentPageIndicatorTintColor = [UIColor niceGreenColor];
                break;
            case 4:
                _pageControl.currentPageIndicatorTintColor = [UIColor niceBlueColor];
                break;
            default:
                break;
        }
    }
    
    // Animates views and calculate progress with contentOffset
    
    CGFloat offset = _scrollView.contentOffset.x;
    
    CGFloat firstProgress = 1 - ((((offset - 0) / 800)) * 0.25);
    CGFloat secondProgress;
    CGFloat thirdProgress;
    CGFloat fourthProgress;
    CGFloat fifthProgress;
    
    if (offset < 800) {
        secondProgress = 0.75 + ((offset / 800) * 0.25);
        [self animateViewNumber:2 withProgress:secondProgress];
    } else if (offset  >= 800 && offset < 1660) {
        secondProgress = 1 - ((((offset - 800) / 800)) * 0.25);
        thirdProgress = 0.75 + ((((offset - 860) / 800)) * 0.25);
        fourthProgress = 0.75 + ((((offset - 1660) / 800)) * 0.25);
        [self animateViewNumber:2 withProgress:secondProgress];
        [self animateViewNumber:3 withProgress:thirdProgress];
    } else if (offset >= 1660 && offset < 2520) {
        thirdProgress = 1 - ((((offset - 1660) / 800)) * 0.25);
        fourthProgress = 0.75 + ((((offset - 1720) / 800)) * 0.25);
        [self animateViewNumber:3 withProgress:thirdProgress];
        [self animateViewNumber:4 withProgress:fourthProgress];
    } else if (offset >= 2520 && offset < 3440) {
        fourthProgress = 1 - ((((offset - 2520) / 800)) * 0.25);
        fifthProgress = 0.75 + ((((offset - 2520) / 800)) * 0.25);
        [self animateViewNumber:4 withProgress:fourthProgress];
        [self animateViewNumber:5 withProgress:fifthProgress];
    }
    
    [self animateViewNumber:1 withProgress:firstProgress];
    
    CGFloat percentage = (_scrollView.contentOffset.x / 3336) / 0.55;
    _rotatingMenu.transform = CGAffineTransformMakeRotation(M_PI * percentage);
    
    CGFloat titleAlpha;
    
    if (offset < 400) {
        titleAlpha = 1 - (offset / 400);
        _titleLabel.text = @"About Me";
        _titleLabel.textColor = [UIColor niceRedColor];
    } else if (offset >= 400 && offset < 810) {
        titleAlpha =  ((offset - 400) / 410);
        _titleLabel.text = @"Projects";
        _titleLabel.textColor = [UIColor niceOrangeColor];
    } else if (offset >= 810 && offset < 1235) {
        titleAlpha =  1 - ((offset - 810) / 425);
        _titleLabel.text = @"Projects";
        _titleLabel.textColor = [UIColor niceOrangeColor];
    } else if (offset >= 1235 && offset < 1660) {
        titleAlpha = ((offset - 1235) / 425);
        _titleLabel.text = @"Education";
        _titleLabel.textColor = [UIColor niceYellowColor];
    } else if (offset >= 1660 && offset < 2090) {
        titleAlpha = 1 - ((offset - 1660) / 430);
        _titleLabel.text = @"Education";
        _titleLabel.textColor = [UIColor niceYellowColor];
    } else if (offset >= 2090 && offset < 2520) {
        titleAlpha = ((offset - 2090) / 430);
        _titleLabel.text = @"Skills";
        _titleLabel.textColor = [UIColor niceGreenColor];
    } else if (offset >= 2520 && offset < 2928) {
        titleAlpha = 1 - ((offset - 2520) / 408);
        _titleLabel.text = @"Skills";
        _titleLabel.textColor = [UIColor niceGreenColor];
    } else if (offset >= 2928) {
        titleAlpha = ((offset - 2928) / 408);
        _titleLabel.text = @"Interests";
        _titleLabel.textColor = [UIColor niceBlueColor];
     }
    
    _titleLabel.alpha = titleAlpha;
    
    if (offset >= 2520 && !_animateSkillsCard) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AnimateSkills" object:nil];
        _animateSkillsCard = YES;
    }
    
    CGPoint currentOffset = _scrollView.contentOffset;
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    
    NSTimeInterval timeDiff = currentTime - lastOffsetCapture;
    if(timeDiff > 0.1) {
        CGFloat distance = currentOffset.x - lastOffset.x;
        CGFloat scrollSpeedNotAbs = (distance * 10) / 1000;
        
        CGFloat scrollSpeed = fabsf(scrollSpeedNotAbs);
        if (scrollSpeed < 0.1) {
            [self scrollViewDidEndDecelerating:_scrollView];
        }
        
        lastOffset = currentOffset;
        lastOffsetCapture = currentTime;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // Small trick when user drags completely on the screen without decelration. This wil make the custom paging work in this particular case too :D
    if (!decelerate) {
        [self scrollViewDidEndDecelerating:_scrollView];
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _pageControlUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControlUsed = NO;
    
    CGFloat currentOffset = _scrollView.contentOffset.x;
    CGPoint page = CGPointMake(0, 0);
    
    if (currentOffset < 400) {
        page.x = 0;
    } else if (currentOffset > 401 && currentOffset < 1225) {
        page.x = 810;
    } else if (currentOffset > 1226 && currentOffset < 2075) {
        page.x = 1660;
    } else if (currentOffset > 2076 && currentOffset < 2910) {
        page.x = 2520;
    } else if (currentOffset > 2911) {
        page.x = 3336;
    }
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [_scrollView setContentOffset:page animated:NO];
    } completion:^(BOOL finished) {
        _scrollView.userInteractionEnabled = YES;
        _scrollView.scrollEnabled = YES;
    }];
    
    
}

- (void)addInterpolatingMotionEffects {
    // Motion effects for the scrollView
    UIInterpolatingMotionEffect *effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"position.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectX.minimumRelativeValue = @(-30);
    effectX.maximumRelativeValue = @(30);
    
    UIInterpolatingMotionEffect *effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"position.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    effectY.minimumRelativeValue = @(-30);
    effectY.maximumRelativeValue = @(30);
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[effectX, effectY];
    [_scrollView addMotionEffect:group];
}

- (void)setupContentViews {
    // Add views at startup
    _scrollView.contentSize = CGSizeMake(4360, 600);

    for (int i = 0; i < self.numberOfPages; i++) {
        UIView *contentView = ((UIViewController *)[_viewControllers objectAtIndex:i]).view;
        contentView.frame = CGRectMake( ((i+1) * 60) + i * 800, 60, 800, 600);
        [_scrollView addSubview:contentView];
    }
}

- (void)animateViewNumber:(NSInteger)identifier withProgress:(CGFloat)progress {
    // Concat and apply rotation + scale of views
    CGAffineTransform rotation = CGAffineTransformMakeRotation((1-progress)*-1);
    CGAffineTransform scale = CGAffineTransformMakeScale(progress, progress);
    
    CGAffineTransform concat = CGAffineTransformConcat(rotation, scale);
    
    UIView *firstView = ((UIViewController *)[_viewControllers objectAtIndex:identifier-1]).view;
    firstView.transform = concat;
    firstView.alpha = progress * 0.9;
    
}

- (void)deviceOrientationDidChangeNotification:(NSNotification *)note {
    // Rotate background camera when orientation changes
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) {
        _preview.connection.videoOrientation = AVCaptureVideoOrientationLandscapeRight;
    } else {
        _preview.connection.videoOrientation = AVCaptureVideoOrientationLandscapeLeft;        
    }
}


-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
