//
//  PBFifthViewController.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "PBFifthViewController.h"
#import "UIColor+Colors.h"
#import "Mixpanel.h"

@interface PBFifthViewController ()

@property (nonatomic, assign) NSInteger interestOpened;

@property (nonatomic, strong) UILabel *iOSDevelopmentDescription;
@property (nonatomic, strong) UILabel *pebbleDescription;
@property (nonatomic, strong) UILabel *unihockeyDescription;
@property (nonatomic, strong) UILabel *catsDescription;
@property (nonatomic, strong) UILabel *webDevelopmentDescription;
@property (nonatomic, strong) UILabel *musicDescription;
@property (nonatomic, strong) UILabel *travelDescription;

@property (nonatomic, strong) UIImageView *pebbleImage;
@property (nonatomic, strong) UIImageView *unihockeyImage;
@property (nonatomic, strong) UIImageView *catsImage;

@end

@implementation PBFifthViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Customize beautiful look :D
    
    _iOSDevelopmentView.layer.cornerRadius = 175 / 2;
    _pebbleView.layer.cornerRadius = 100 / 2;
    _unihockeyView.layer.cornerRadius = 125 / 2;
    _catsView.layer.cornerRadius = 75 / 2;
    _webDevelopmentView.layer.cornerRadius = 175 / 2;
    _musicView.layer.cornerRadius = 100 / 2;
    _travelView.layer.cornerRadius = 100 / 2;
    
    _iOSDevelopmentView.layer.shadowColor = [UIColor blackColor].CGColor;
    _pebbleView.layer.shadowColor = [UIColor blackColor].CGColor;
    _unihockeyView.layer.shadowColor = [UIColor blackColor].CGColor;
    _catsView.layer.shadowColor = [UIColor blackColor].CGColor;
    _webDevelopmentView.layer.shadowColor = [UIColor blackColor].CGColor;
    _musicView.layer.shadowColor = [UIColor blackColor].CGColor;
    _webDevelopmentView.layer.shadowColor = [UIColor blackColor].CGColor;
    _travelView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    _iOSDevelopmentView.layer.shadowOffset = CGSizeMake(1, 1);
    _pebbleView.layer.shadowOffset = CGSizeMake(1, 1);
    _unihockeyView.layer.shadowOffset = CGSizeMake(1, 1);
    _catsView.layer.shadowOffset = CGSizeMake(1, 1);
    _webDevelopmentView.layer.shadowOffset = CGSizeMake(1, 1);
    _musicView.layer.shadowOffset = CGSizeMake(1, 1);
    _travelView.layer.shadowOffset = CGSizeMake(1, 1);
    
    _iOSDevelopmentView.layer.shadowOpacity = .2;
    _pebbleView.layer.shadowOpacity = .2;
    _unihockeyView.layer.shadowOpacity = .2;
    _catsView.layer.shadowOpacity = .2;
    _webDevelopmentView.layer.shadowOpacity = .2;
    _musicView.layer.shadowOpacity = .2;
    _travelView.layer.shadowOpacity = .2;
    
    // All tap gesture recognizers to make views tappable
    
    UITapGestureRecognizer *iOSDevelopmentTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iOSDevelopmentViewTapped:)];
    [_iOSDevelopmentView addGestureRecognizer:iOSDevelopmentTap];
    
    UITapGestureRecognizer *pebbleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pebbleViewTapped:)];
    [_pebbleView addGestureRecognizer:pebbleTap];
    
    UITapGestureRecognizer *unihockeyTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(unihockeyViewTapped:)];
    [_unihockeyView addGestureRecognizer:unihockeyTap];
    
    UITapGestureRecognizer *catsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(catsViewTapped:)];
    [_catsView addGestureRecognizer:catsTap];
    
    UITapGestureRecognizer *webDevelopmentTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webDevelopmentViewTapped:)];
    [_webDevelopmentView addGestureRecognizer:webDevelopmentTap];
    
    UITapGestureRecognizer *musicTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(musicViewTapped:)];
    [_musicView addGestureRecognizer:musicTap];
    
    UITapGestureRecognizer *travelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(travelViewTapped:)];
    [_travelView addGestureRecognizer:travelTap];
    
    UITapGestureRecognizer *tapToClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToClose:)];
    [self.view addGestureRecognizer:tapToClose];
    
}

- (void)iOSDevelopmentViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 1) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"iOSDevelopmentInterest"];
    
    _interestOpened = 1;
    
    _iOSDevelopmentDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 360, 400-150)];
    _iOSDevelopmentDescription.text = @"iOS development is for sure my main interest. I love to create beautiful applications that can be useful to people all over the world. It's a unique feeling to get feedback about your product and read amazing emails by your users everyday who are enjoying your product.";
    _iOSDevelopmentDescription.numberOfLines = 10;
    _iOSDevelopmentDescription.textAlignment = NSTextAlignmentCenter;
    _iOSDevelopmentDescription.textColor = [UIColor niceBlueColor];
    _iOSDevelopmentDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_iOSDevelopmentView addSubview:_iOSDevelopmentDescription];
    
    _iOSDevelopmentDescription.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _iOSDevelopmentView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 150);
        _iOSDevelopmentTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _iOSDevelopmentTitle.frame = titleFrame;
        
        _pebbleView.transform = CGAffineTransformMakeScale(0, 0);
        _unihockeyView.transform = CGAffineTransformMakeScale(0, 0);
        _webDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _catsView.transform = CGAffineTransformMakeScale(0, 0);
        _musicView.transform = CGAffineTransformMakeScale(0, 0);
        _travelView.transform = CGAffineTransformMakeScale(0, 0);
        
        _iOSDevelopmentDescription.alpha = 1.0;
        
    } completion:NULL];
}

- (void)pebbleViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 2) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"PebbleInterest"];
    
    _tapOnACircle.hidden = YES;
    
    _interestOpened = 2;
    
    _pebbleDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 160, 300)];
    _pebbleDescription.text = @"I bought a Pebble at the end of 2013 and I really enjoy this smartwatch. It connects to my iPhone and I wear it almost everyday. I develop apps for it that tries to make it even more useful.";
    _pebbleDescription.numberOfLines = 12;
    _pebbleDescription.textAlignment = NSTextAlignmentCenter;
    _pebbleDescription.textColor = [UIColor niceBlueColor];
    _pebbleDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_pebbleView addSubview:_pebbleDescription];
    
    _pebbleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 75, 200, 300)];
    _pebbleImage.image = [UIImage imageNamed:@"PebbleImage.png"];
    _pebbleImage.contentMode = UIViewContentModeScaleAspectFit;
    [_pebbleView addSubview:_pebbleImage];
    
    _pebbleDescription.alpha = 0.0;
    _pebbleImage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _pebbleView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 100);
        _pebbleTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _pebbleTitle.frame = titleFrame;
        
        CGRect imageFrame = CGRectMake(200, 75, 200, 300);
        _pebbleImage.frame = imageFrame;
        
        _iOSDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _unihockeyView.transform = CGAffineTransformMakeScale(0, 0);
        _webDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _catsView.transform = CGAffineTransformMakeScale(0, 0);
        _musicView.transform = CGAffineTransformMakeScale(0, 0);
        _travelView.transform = CGAffineTransformMakeScale(0, 0);
        
        _pebbleDescription.alpha = 1.0;
        _pebbleImage.alpha = 1.0;
        
    } completion:NULL];
}

- (void)unihockeyViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 3) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"UnihockeyInterest"];
    
    _interestOpened = 3;
    
    _unihockeyDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 160, 300)];
    _unihockeyDescription.text = @"I play unihockey since 10 years and I absolutely love it. It's a pretty famous sport in Switzerland. I'm a referee and I play in a team called Regazzi Verbano Gordola. \nThis is me!";
    _unihockeyDescription.numberOfLines = 12;
    _unihockeyDescription.textAlignment = NSTextAlignmentCenter;
    _unihockeyDescription.textColor = [UIColor niceBlueColor];
    _unihockeyDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_unihockeyView addSubview:_unihockeyDescription];
    
    _unihockeyImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 75, 200, 300)];
    _unihockeyImage.image = [UIImage imageNamed:@"Unihockey.png"];
    _unihockeyImage.contentMode = UIViewContentModeScaleAspectFit;
    [_unihockeyView addSubview:_unihockeyImage];
    
    _unihockeyDescription.alpha = 0.0;
    _unihockeyImage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _unihockeyView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 100);
        _unihockeyTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _unihockeyTitle.frame = titleFrame;
        
        CGRect imageFrame = CGRectMake(200, 75, 200, 300);
        _unihockeyImage.frame = imageFrame;
        
        _iOSDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _pebbleView.transform = CGAffineTransformMakeScale(0, 0);
        _webDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _catsView.transform = CGAffineTransformMakeScale(0, 0);
        _musicView.transform = CGAffineTransformMakeScale(0, 0);
        _travelView.transform = CGAffineTransformMakeScale(0, 0);
        
        _unihockeyDescription.alpha = 1.0;
        _unihockeyImage.alpha = 1.0;
        
    } completion:NULL];
}

- (void)catsViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 4) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"CatsInterest"];
    
    _interestOpened = 4;
    
    _catsDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 160, 300)];
    _catsDescription.text = @"I like animals but in particular cats. I have 2 black cats whose names are Lilly and Minou. Lilly is 3 years old and Minou is 8 years old. They play, sleep and eat all the day and they're really funny.";
    _catsDescription.numberOfLines = 12;
    _catsDescription.textAlignment = NSTextAlignmentCenter;
    _catsDescription.textColor = [UIColor niceBlueColor];
    _catsDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_catsView addSubview:_catsDescription];
    
    _catsImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 75, 180, 180)];
    _catsImage.image = [UIImage imageNamed:@"MyCats.jpg"];
    _catsImage.contentMode = UIViewContentModeScaleAspectFit;
    [_catsView addSubview:_catsImage];
    
    _unihockeyDescription.alpha = 0.0;
    _unihockeyImage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _catsView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 100);
        _catsTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _catsTitle.frame = titleFrame;
        
        CGRect imageFrame = CGRectMake(200, 120, 180, 180);
        _catsImage.frame = imageFrame;
        
        _iOSDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _pebbleView.transform = CGAffineTransformMakeScale(0, 0);
        _webDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _unihockeyView.transform = CGAffineTransformMakeScale(0, 0);
        _musicView.transform = CGAffineTransformMakeScale(0, 0);
        _travelView.transform = CGAffineTransformMakeScale(0, 0);
        
        _catsDescription.alpha = 1.0;
        _catsImage.alpha = 1.0;
        
    } completion:NULL];
}

- (void)webDevelopmentViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 5) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"WebDevelopmentInterest"];
    
    _interestOpened = 5;
    
    _webDevelopmentDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 360, 400-150)];
    _webDevelopmentDescription.text = @"I love to develop websites with a clean and simple design. I developed websites for my own apps and also a few for clients. It's a completely different feeling than creating iOS apps. iOS development is a lot more fun.";
    _webDevelopmentDescription.numberOfLines = 10;
    _webDevelopmentDescription.textAlignment = NSTextAlignmentCenter;
    _webDevelopmentDescription.textColor = [UIColor niceBlueColor];
    _webDevelopmentDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_webDevelopmentView addSubview:_webDevelopmentDescription];
    
    _webDevelopmentDescription.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _webDevelopmentView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 150);
        _webDevelopmentTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _webDevelopmentTitle.frame = titleFrame;
        
        _pebbleView.transform = CGAffineTransformMakeScale(0, 0);
        _unihockeyView.transform = CGAffineTransformMakeScale(0, 0);
        _iOSDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _catsView.transform = CGAffineTransformMakeScale(0, 0);
        _musicView.transform = CGAffineTransformMakeScale(0, 0);
        _travelView.transform = CGAffineTransformMakeScale(0, 0);
        
        _webDevelopmentDescription.alpha = 1.0;
        
    } completion:NULL];
}

- (void)musicViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 6) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"MusicInterest"];
    
    _interestOpened = 6;
    
    _musicDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 360, 400-150)];
    _musicDescription.text = @"I love music! It makes everything different. I usually listen to every genre but I prefer dance and party music. It helps me to charge my batteries!";
    _musicDescription.numberOfLines = 10;
    _musicDescription.textAlignment = NSTextAlignmentCenter;
    _musicDescription.textColor = [UIColor niceBlueColor];
    _musicDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_musicView addSubview:_musicDescription];
    
    _musicDescription.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _musicView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 150);
        _musicTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _musicTitle.frame = titleFrame;
        
        _pebbleView.transform = CGAffineTransformMakeScale(0, 0);
        _unihockeyView.transform = CGAffineTransformMakeScale(0, 0);
        _iOSDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _catsView.transform = CGAffineTransformMakeScale(0, 0);
        _travelView.transform = CGAffineTransformMakeScale(0, 0);
        _webDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        
        _musicDescription.alpha = 1.0;
        
    } completion:NULL];
}

- (void)travelViewTapped:(UITapGestureRecognizer *)tap {
    
    if (_interestOpened == 7) {
        return;
    }
    
    [self hideTapOnACircleLabel];
    [[Mixpanel sharedInstance] track:@"TravelInterest"];
    
    _interestOpened = 7;
    
    _travelDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 360, 400-150)];
    _travelDescription.text = @"I love to travel and discover new countries. I love to fly, every single time I take an airplanes is a unique feeling. I’ve never visited The United States, this could be my opportunity to finally visit California and San Francisco.";
    _travelDescription.numberOfLines = 10;
    _travelDescription.textAlignment = NSTextAlignmentCenter;
    _travelDescription.textColor = [UIColor niceBlueColor];
    _travelDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [_travelView addSubview:_travelDescription];
    
    _travelDescription.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect = CGRectMake((self.view.frame.size.width/2) - 200, (self.view.frame.size.height/2) - 200, 400, 400);
        _travelView.frame = rect;
        
        CGRect titleFrame = CGRectMake(0, 0, 400, 150);
        _travelTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _travelTitle.frame = titleFrame;
        
        _pebbleView.transform = CGAffineTransformMakeScale(0, 0);
        _unihockeyView.transform = CGAffineTransformMakeScale(0, 0);
        _iOSDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        _catsView.transform = CGAffineTransformMakeScale(0, 0);
        _musicView.transform = CGAffineTransformMakeScale(0, 0);
        _webDevelopmentView.transform = CGAffineTransformMakeScale(0, 0);
        
        _travelDescription.alpha = 1.0;
        
    } completion:NULL];
}

- (void)tapToClose:(UITapGestureRecognizer *)tap {
    if (_interestOpened == 1) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _iOSDevelopmentDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(90, 110, 175, 175);
            _iOSDevelopmentView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 78, 175, 20);
            _iOSDevelopmentTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _iOSDevelopmentTitle.frame = titleFrame;
            
            _pebbleView.transform = CGAffineTransformMakeScale(1, 1);
            _unihockeyView.transform = CGAffineTransformMakeScale(1, 1);
            _webDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _catsView.transform = CGAffineTransformMakeScale(1, 1);
            _musicView.transform = CGAffineTransformMakeScale(1, 1);
            _travelView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_iOSDevelopmentDescription removeFromSuperview];
        }];
    } else if (_interestOpened == 2) {
        _pebbleImage.alpha = 0.0;
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _pebbleDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(561, 116, 100, 100);
            _pebbleView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 38, 100, 24);
            _pebbleTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _pebbleTitle.frame = titleFrame;
            
            _iOSDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _unihockeyView.transform = CGAffineTransformMakeScale(1, 1);
            _webDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _catsView.transform = CGAffineTransformMakeScale(1, 1);
            _musicView.transform = CGAffineTransformMakeScale(1, 1);
            _travelView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_pebbleDescription removeFromSuperview];
            [_pebbleImage removeFromSuperview];
        }];
    } else if (_interestOpened == 3) {
        _unihockeyImage.alpha = 0.0;
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _unihockeyDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(362, 291, 125, 125);
            _unihockeyView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 51, 125, 24);
            _unihockeyTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _unihockeyTitle.frame = titleFrame;
            
            _iOSDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _pebbleView.transform = CGAffineTransformMakeScale(1, 1);
            _webDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _catsView.transform = CGAffineTransformMakeScale(1, 1);
            _musicView.transform = CGAffineTransformMakeScale(1, 1);
            _travelView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_unihockeyDescription removeFromSuperview];
            [_unihockeyImage removeFromSuperview];
        }];
    } else if (_interestOpened == 4) {
        _catsImage.alpha = 0.0;
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _catsDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(143, 401, 75, 75);
            _catsView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 26, 75, 24);
            _catsTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _catsTitle.frame = titleFrame;
            
            _iOSDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _pebbleView.transform = CGAffineTransformMakeScale(1, 1);
            _webDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _unihockeyView.transform = CGAffineTransformMakeScale(1, 1);
            _musicView.transform = CGAffineTransformMakeScale(1, 1);
            _travelView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_catsDescription removeFromSuperview];
            [_catsImage removeFromSuperview];
        }];
    } else if (_interestOpened == 5) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _webDevelopmentDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(583, 363, 175, 175);
            _webDevelopmentView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 76, 175, 24);
            _webDevelopmentTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _webDevelopmentTitle.frame = titleFrame;
            
            _pebbleView.transform = CGAffineTransformMakeScale(1, 1);
            _unihockeyView.transform = CGAffineTransformMakeScale(1, 1);
            _iOSDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _catsView.transform = CGAffineTransformMakeScale(1, 1);
            _musicView.transform = CGAffineTransformMakeScale(1, 1);
            _travelView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_webDevelopmentDescription removeFromSuperview];
        }];
    } else if (_interestOpened == 6) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _musicDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(350, 68, 100, 100);
            _musicView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 38, 100, 24);
            _musicTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _musicTitle.frame = titleFrame;
            
            _pebbleView.transform = CGAffineTransformMakeScale(1, 1);
            _unihockeyView.transform = CGAffineTransformMakeScale(1, 1);
            _iOSDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _catsView.transform = CGAffineTransformMakeScale(1, 1);
            _webDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _travelView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_musicDescription removeFromSuperview];
        }];
    } else if (_interestOpened == 7) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            _travelDescription.alpha = 0.0;
            
            CGRect rect = CGRectMake(308, 475, 100, 100);
            _travelView.frame = rect;
            
            CGRect titleFrame = CGRectMake(0, 38, 100, 24);
            _travelTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
            _travelTitle.frame = titleFrame;
            
            _pebbleView.transform = CGAffineTransformMakeScale(1, 1);
            _unihockeyView.transform = CGAffineTransformMakeScale(1, 1);
            _iOSDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            _catsView.transform = CGAffineTransformMakeScale(1, 1);
            _musicView.transform = CGAffineTransformMakeScale(1, 1);
            _webDevelopmentView.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [_travelDescription removeFromSuperview];
        }];
    }
    _interestOpened = 0;
    
    [self hideHelpLabel];
}

- (void)hideTapOnACircleLabel {
    if (!_tapOnACircle.hidden) {
        [UIView animateWithDuration:1.0 animations:^{
            _tapOnACircle.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self showTapOnBackgroundToGoBack];
        }];
    }
}

- (void)showTapOnBackgroundToGoBack {
    _tapOnACircle.text = @"Tap on the background to dismiss!";
    [UIView animateWithDuration:1.0 animations:^{
        _tapOnACircle.alpha = 1.0;
    }];
}

- (void)hideHelpLabel {
    [UIView animateWithDuration:1.0 animations:^{
        _tapOnACircle.alpha = 0.0;
    } completion:^(BOOL finished) {
        [_tapOnACircle removeFromSuperview];
    }];
}

@end
