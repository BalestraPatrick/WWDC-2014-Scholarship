//
//  UIColor+Colors.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 08/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "UIColor+Colors.h"

@implementation UIColor (Colors)

+ (UIColor *)niceRedColor {
    UIColor *niceRedColor = [UIColor colorWithRed:(255.0/255.0) green:(52.0/255.0) blue:(53.0/255.0) alpha:1.0];
    return niceRedColor;
}

+ (UIColor *)niceOrangeColor {
    UIColor *niceOrangeColor = [UIColor colorWithRed:(255.0/255.0) green:(147.0/255.0) blue:(36.0/255.0) alpha:1.0];
    return niceOrangeColor;
}

+ (UIColor *)niceYellowColor {
    UIColor *niceOrangeColor = [UIColor colorWithRed:(255.0/255.0) green:(202.0/255.0) blue:(48.0/255.0) alpha:1.0];
    return niceOrangeColor;
}

+ (UIColor *)niceGreenColor {
    UIColor *niceOrangeColor = [UIColor colorWithRed:(68.0/255.0) green:(217.0/255.0) blue:(108.0/255.0) alpha:1.0];
    return niceOrangeColor;
}

+ (UIColor *)niceBlueColor {
    UIColor *niceOrangeColor = [UIColor colorWithRed:(0.0/255.0) green:(171.0/255.0) blue:(218.0/255.0) alpha:1.0];
    return niceOrangeColor;
}

@end
