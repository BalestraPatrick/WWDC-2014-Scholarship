//
//  PBFirstViewController.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "PBFirstViewController.h"
#import "UIColor+Colors.h"
#import "Mixpanel.h"

@interface PBFirstViewController ()


@end

@implementation PBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Build TextView with custom highligthed text
        
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:@"I’m " attributes:[self normalTextAttributes]];
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:@"Patrick Balestra" attributes:[self highlitedTextAttributes]];
    NSAttributedString *string3 = [[NSAttributedString alloc] initWithString:@", a 17 year old iOS developer living in Monte Carasso, " attributes:[self normalTextAttributes]];
    NSAttributedString *string4 = [[NSAttributedString alloc] initWithString:@"Switzerland" attributes:[self highlitedTextAttributes]];
    NSAttributedString *string5 = [[NSAttributedString alloc] initWithString:@". I discovered Objective-C and the iOS eco-system when I was 13 years old and I fell in love. With time, " attributes:[self normalTextAttributes]];
    NSAttributedString *string6 = [[NSAttributedString alloc] initWithString:@"programming" attributes:[self highlitedTextAttributes]];
    NSAttributedString *string7 = [[NSAttributedString alloc] initWithString:@" has become a part of my everyday life. As I evolved and learned more, I was able to meet really talented programmers and teens, who I can share my passion of programming with. With the strong community of iOS developers on Twitter and Facebook, we all work together to solve problems and " attributes:[self normalTextAttributes]];
    NSAttributedString *string8 = [[NSAttributedString alloc] initWithString:@"improve people’s lives" attributes:[self highlitedTextAttributes]];
    NSAttributedString *string9 = [[NSAttributedString alloc] initWithString:@" with the power of iOS and its platform. Knowing my work is improving the life of someone on this planet is an incredibly rewarding and meaningful experience. I’m very passionate about " attributes:[self normalTextAttributes]];
    NSAttributedString *string10 = [[NSAttributedString alloc] initWithString:@"great design and animations" attributes:[self highlitedTextAttributes]];
    NSAttributedString *string11 = [[NSAttributedString alloc] initWithString:@", and how that contributes to a great user experience, one that fundamentally changes the behavior of people. iBeacon and similar technologies are really interesting, and one that could open many new possibilities to society, possibly even make our roads safer. I’m " attributes:[self normalTextAttributes]];
    NSAttributedString *string12 = [[NSAttributedString alloc] initWithString:@"always learning" attributes:[self highlitedTextAttributes]];
    NSAttributedString *string13 = [[NSAttributedString alloc] initWithString:@" and strengthening my programming skills to help contribute to the world in someway. I definitely see my self in this industry in the future, it’s an industry in which we can really find meaning and contribute to the world. WWDC has been my "  attributes:[self normalTextAttributes]];
    NSAttributedString *string14 = [[NSAttributedString alloc] initWithString:@"dream for the last three years" attributes:[self highlitedTextAttributes]];
    
    NSAttributedString *string15 = [[NSAttributedString alloc] initWithString:@", and it would be an extraordinary experience to have the privilege to attend. I would love to attend the sessions and learn many more things to be able to work on apps that make the iOS eco-system even stronger." attributes:[self normalTextAttributes]];
    
    [mutableAttributedString appendAttributedString:string1];
    [mutableAttributedString appendAttributedString:string2];
    [mutableAttributedString appendAttributedString:string3];
    [mutableAttributedString appendAttributedString:string4];
    [mutableAttributedString appendAttributedString:string5];
    [mutableAttributedString appendAttributedString:string6];
    [mutableAttributedString appendAttributedString:string7];
    [mutableAttributedString appendAttributedString:string8];
    [mutableAttributedString appendAttributedString:string9];
    [mutableAttributedString appendAttributedString:string10];
    [mutableAttributedString appendAttributedString:string11];
    [mutableAttributedString appendAttributedString:string12];
    [mutableAttributedString appendAttributedString:string13];
    [mutableAttributedString appendAttributedString:string14];
    [mutableAttributedString appendAttributedString:string15];
    
    _aboutMeTextView.attributedText = mutableAttributedString;

    
    // Customize profile picture
    _profilePicture.layer.cornerRadius = 75.0;
    _profilePicture.layer.borderColor = [UIColor niceRedColor].CGColor;
    _profilePicture.layer.borderWidth = 10;
    _profilePicture.layer.masksToBounds = YES;
    
}

- (NSDictionary *)normalTextAttributes {
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:30],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 };
    return attributes;
}

- (NSDictionary *)highlitedTextAttributes {
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:30],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 };
    return attributes;
}

- (IBAction)website:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.patrickbalestra.com"]];
    [[Mixpanel sharedInstance] track:@"openWebsite"];
}

- (IBAction)mail:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:infobalestra@gmail.com"]];
    [[Mixpanel sharedInstance] track:@"openMail"];
}

- (IBAction)twitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/BalestraPatrick"]];
    [[Mixpanel sharedInstance] track:@"openTwitter"];
}

- (IBAction)github:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.github.com/BalestraPatrick"]];
    [[Mixpanel sharedInstance] track:@"openGithub"];
}

@end
