//
//  PBSecondViewController.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "PBSecondViewController.h"
#import "Mixpanel.h"

@interface PBSecondViewController ()

@end

@implementation PBSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView.contentSize = CGSizeMake(800, 2700);
    
    // Call methods to add views
    [self addLineView];
    [self addIntroductionTextView];
    [self addPebbleNotesView];
    [self addTranslatorView];
    [self addSuperWatchfaceView];
    [self addTheBitStealthView];
    [self addVerbanoUnihockeyView];
    [self addEmergencyPhoneNumbersView];
    [self addSpitefulCharleneView];
    [self addClusterView];
    [self addCatchTheAirplanesView];
    
}

- (void)addLineView {
    UIView *middleView = [[UIView alloc] initWithFrame:CGRectMake(25, -230, 2, _scrollView.contentSize.height)];
    middleView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:middleView];
    
    // Add little easter egg, out of real content size
    UILabel *futureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -100, 800, 50)];
    futureLabel.text = @"I can't wait to see what the future will bring!";
    futureLabel.textColor = [UIColor whiteColor];
    futureLabel.textAlignment = NSTextAlignmentCenter;
    futureLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
    [_scrollView addSubview:futureLabel];
}

- (void)addPebbleNotesView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 0, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"March 2014";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 80, 80)];
    icon.image = [UIImage imageNamed:@"PebbleNotesIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 400, 80)];
    title.text = @"Pebble Notes";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 120, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 1;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UIButton *websiteButton = [[UIButton alloc] initWithFrame:CGRectMake(viewButton.frame.origin.x + viewButton.frame.size.width + 10, viewButton.frame.origin.y, 130, 30)];
    [websiteButton setTitle:@"View Website" forState:UIControlStateNormal];
    websiteButton.titleLabel.textColor = [UIColor whiteColor];
    websiteButton.backgroundColor = [UIColor clearColor];
    websiteButton.layer.borderColor = [UIColor whiteColor].CGColor;
    websiteButton.layer.borderWidth = 1.0;
    websiteButton.layer.cornerRadius = 5.0;
    websiteButton.tag = 2;
    [websiteButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [websiteButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: websiteButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 165)];
    description.text = @"I wrote an iPhone app for the Pebble Smartwatch. It enables people to write notes and they’re stored with Core Data. This is the app I’m most proud of because of its minimal and usable UI. It was featured on various blogs, including the Cult of Mac. After many reviews, I started working on new features to make the app even better for new users. ";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];

}

- (void)addTranslatorView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"February 2014";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 72, 84)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"TranslatorIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 400, 80)];
    title.text = @"Translator";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 120, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 3;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 165)];
    description.text = @"Translator is a Pebble app written in C and Javascript. It gives user the ability to transfer multiple words from one language to another. All of the functionality is done on the watch, including changing the language.";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addSuperWatchfaceView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*2, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"January 2014";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 72, 84)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"SuperWatchfaceIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 400, 80)];
    title.text = @"Super Watchface";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 120, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 4;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UIButton *websiteButton = [[UIButton alloc] initWithFrame:CGRectMake(viewButton.frame.origin.x + viewButton.frame.size.width + 10, viewButton.frame.origin.y, 130, 30)];
    [websiteButton setTitle:@"View Website" forState:UIControlStateNormal];
    websiteButton.titleLabel.textColor = [UIColor whiteColor];
    websiteButton.backgroundColor = [UIColor clearColor];
    websiteButton.layer.borderColor = [UIColor whiteColor].CGColor;
    websiteButton.layer.borderWidth = 1.0;
    websiteButton.layer.cornerRadius = 5.0;
    websiteButton.tag = 5;
    [websiteButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [websiteButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: websiteButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"Super Watchface was my first project for the Pebble platform. After quickly learning the platform, I realized that I was building something much bigger than I originally anticipated. After launching the watch-face, it was download over 20,000 times from the Pebble App Store. It also reached the featured page of the Pebble App Store. Judging from the number of likes, it happens to be the 10th most popular watch-face right now. ";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addTheBitStealthView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*3+20, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"November 2013";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 80, 80)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"TheBitStealthIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 450, 80)];
    title.text = @"The Bit Stealth";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 130, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 6;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"The Bit Stealth was my last game Developed with Balza Games and a group of friends. It’s an iPad puzzle game with various levels. To pass the levels, you must reach the end of the level without colliding with guards.";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addVerbanoUnihockeyView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*4+20, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"September 2013";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 22, 90, 90)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"VerbanoWebsiteIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 450, 80)];
    title.text = @"Verbano Unihockey Website";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 130, 30)];
    [viewButton setTitle:@"View Website" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 7;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"I had the opportunity to build a website for my UniHockey team. Together with a friend, we came together and build a website using various technologies like HTML, CSS3, Javascript and PHP.";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}


- (void)addEmergencyPhoneNumbersView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*5+20, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"February 2013";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 80, 80)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.contentMode = UIViewContentModeScaleToFill;
    icon.image = [UIImage imageNamed:@"EmergencyPhoneNumbersIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 450, 80)];
    title.text = @"Emergency Phone Numbers";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 120, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 8;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UIButton *websiteButton = [[UIButton alloc] initWithFrame:CGRectMake(viewButton.frame.origin.x + viewButton.frame.size.width + 10, viewButton.frame.origin.y, 130, 30)];
    [websiteButton setTitle:@"View Website" forState:UIControlStateNormal];
    websiteButton.titleLabel.textColor = [UIColor whiteColor];
    websiteButton.backgroundColor = [UIColor clearColor];
    websiteButton.layer.borderColor = [UIColor whiteColor].CGColor;
    websiteButton.layer.borderWidth = 1.0;
    websiteButton.layer.cornerRadius = 5.0;
    websiteButton.tag = 9;
    [websiteButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [websiteButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: websiteButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"This was my first utility app developed with Xcode. My idea was to aggregate all the emergency phone numbers for police, medical and ambulance in a single and easy to use app. That’s what I did. I collected over 130 countries’s phone numbers and you can call just by sliding a button. There is a map so you can quickly communicate your position to the emergency service.";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addSpitefulCharleneView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*6+20, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"October 2012";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 80, 80)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"SpitefulCharleneIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 450, 80)];
    title.text = @"Spiteful Charlene";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 130, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 10;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"Spiteful Charlene is an iPad game with the objective to help a girl pop balloons. A Swiss-Italian magazine was interested in doing an interview with me. A photo of me was publicized on the magazine’s front cover. It truly was a great experience, seeing how my idea turned to a product and eventually got a publication interested in me. ";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addClusterView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*7+20, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"July 2012";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 80, 80)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"ClusterIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 450, 80)];
    title.text = @"Cluster";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 130, 30)];
    [viewButton setTitle:@"View More" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.tag = 11;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [viewButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [infoContainer addSubview: viewButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"Cluster is an universal app that I developed with a team at Balza Games. the game was a colorful and fun experience. A Swiss newspaper was interested and they interviewed me regarding the game.";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addCatchTheAirplanesView {
    // Container view, all views will be added to this main view
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(25, 265*8+20, 775, 250)];
    container.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:container];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, (container.frame.size.height/2)-1, 160, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [container addSubview:line];
    
    UILabel *when = [[UILabel alloc] initWithFrame:CGRectMake(0, line.frame.origin.y-30, 160, 30)];
    when.text = @"February 2012";
    when.textColor = [UIColor whiteColor];
    when.textAlignment = NSTextAlignmentCenter;
    when.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    [container addSubview:when];
    
    UIView *infoContainer = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 615, container.frame.size.height)];
    infoContainer.backgroundColor = [UIColor clearColor];
    [container addSubview:infoContainer];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 80, 80)];
    icon.layer.cornerRadius = 12.0;
    icon.layer.masksToBounds = YES;
    icon.image = [UIImage imageNamed:@"CatchTheAirplanesIcon.png"];
    [infoContainer addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 450, 80)];
    title.text = @"Catch the Airplanes";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
    [infoContainer addSubview:title];
    
    UIButton *viewButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 70, 170, 30)];
    [viewButton setTitle:@"Removed From Sale" forState:UIControlStateNormal];
    viewButton.titleLabel.textColor = [UIColor whiteColor];
    viewButton.backgroundColor = [UIColor clearColor];
    viewButton.layer.borderColor = [UIColor whiteColor].CGColor;
    viewButton.layer.borderWidth = 1.0;
    viewButton.layer.cornerRadius = 5.0;
    [viewButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [infoContainer addSubview: viewButton];
    
    UITextView *description = [[UITextView alloc] initWithFrame:CGRectMake(25, 115, 565, 190)];
    description.text = @"Catch the Airplanes was my very first iOS app. A game in which the objective is to tap airplanes and destroy them. It’s received about 4,000 downloads but the learning experience far surpasses the amount of downloads it has received.";
    description.backgroundColor = [UIColor clearColor];
    description.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    description.textColor = [UIColor whiteColor];
    [infoContainer addSubview:description];
    
}

- (void)addIntroductionTextView {
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, _scrollView.contentSize.height-230, _scrollView.contentSize.width-40, 230)];
    textView.backgroundColor = [UIColor clearColor];
    
    // Hacky way to center title text
    NSMutableAttributedString *mutableAttributesString = [[NSMutableAttributedString alloc] initWithString:@"\t\t\t\t\t\t\t\t\tHow everything started?\n" attributes:[self titleAttributesDictionary]];
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"I’ve followed tech blogs and the industry at a very young age. When my parents purchased an iPod for me in 2009, I was introduced to the world of Apple and I fell in love. The following year I purchased an iPad and discovered the App Store. A place where people with an idea can create something and make the iPad a better device and unlock many new possibilities. I later discovered the Apple Developer Program and realized the infinite possibilities, one that would make a curious and creative person very content." attributes:[self textAttributesDictionary]];
    
    [mutableAttributesString appendAttributedString:string];
    
    textView.attributedText = mutableAttributesString;
    
    [_scrollView addSubview:textView];
}

- (void)animatedScrollView:(NSNotificationCenter *)notification {
    CGPoint bottom = CGPointMake(0, _scrollView.contentSize.height - _scrollView.bounds.size.height);
    [_scrollView setContentOffset:bottom animated:YES];
}

- (NSDictionary *)titleAttributesDictionary {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:22], NSForegroundColorAttributeName : [UIColor whiteColor]};
    return attributes;
}

- (NSDictionary *)textAttributesDictionary {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:22], NSForegroundColorAttributeName : [UIColor whiteColor]};
    return attributes;
}

- (void)openLink:(UIButton *)buttonPressed {
    if (buttonPressed.tag == 1) {
        // SKStoreViewController for Pebble Notes must be presented in CustomPageViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openProduct" object:@1];
        [[Mixpanel sharedInstance] track:@"openViewMorePebbleNotes"];
    } else if (buttonPressed.tag == 2) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.patrickbalestra.com/PebbleNotes"]];
        [[Mixpanel sharedInstance] track:@"openViewWebsitePebbleNotes"];
    } else if (buttonPressed.tag == 3) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://pblweb.com/appstore/532000f7237858d2500001b1/"]];
        [[Mixpanel sharedInstance] track:@"openViewMoreTranslator"];
    } else if (buttonPressed.tag == 4) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://pblweb.com/appstore/52cc32f86e5f706530000178/"]];
        [[Mixpanel sharedInstance] track:@"openViewMoreSuperWatchface"];
    } else if (buttonPressed.tag == 5) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.patrickbalestra.com/SuperWatchface/index.html"]];
        [[Mixpanel sharedInstance] track:@"openViewWebsiteSuperWatchface"];
    } else if (buttonPressed.tag == 6) {
        // SKStoreViewController for The Bit Stealth must be presented in CustomPageViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openProduct" object:@2];
        [[Mixpanel sharedInstance] track:@"openViewMoreTheBitStealth"];
    } else if (buttonPressed.tag == 7) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.verbanounihockey.ch"]];
        [[Mixpanel sharedInstance] track:@"openViewWebsiteVerbano"];
    } else if (buttonPressed.tag == 8) {
        // SKStoreViewController for Emergency Phone Numbers - World must be presented in CustomPageViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openProduct" object:@3];
        [[Mixpanel sharedInstance] track:@"openViewMoreEmergencyPhoneNumbers"];
    } else if (buttonPressed.tag == 9) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.patrickbalestra.com/emergency/index.html"]];
        [[Mixpanel sharedInstance] track:@"openViewWebsiteEmergencyPhoneNumbers"];
    } else if (buttonPressed.tag == 10) {
        // SKStoreViewController for Spiteful Charlene must be presented in CustomPageViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openProduct" object:@4];
        [[Mixpanel sharedInstance] track:@"openViewMoreSpitefulCharlene"];
    } else if (buttonPressed.tag == 11) {
        // SKStoreViewController for Cluster must be presented in CustomPageViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openProduct" object:@5];
        [[Mixpanel sharedInstance] track:@"openViewMoreCluster"];
    }
}


@end
