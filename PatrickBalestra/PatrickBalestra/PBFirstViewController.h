//
//  PBFirstViewController.h
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import <UIKit/UIKit.h>
@import QuartzCore;

@interface PBFirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *aboutMeTextView;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;

- (IBAction)website:(id)sender;
- (IBAction)mail:(id)sender;
- (IBAction)twitter:(id)sender;
- (IBAction)github:(id)sender;

@end
