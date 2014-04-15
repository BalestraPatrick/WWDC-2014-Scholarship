//
//  CALayer+CustomShadow.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 04/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "CALayer+CustomShadow.h"

@implementation CALayer (CustomShadow)

+ (CALayer *)awesomeShadowLayer:(CALayer *)layer {
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowRadius = 20.0f;
    layer.shadowOpacity = 0.50f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    return layer;
}

@end
