//
//  PBSkillView.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 09/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "PBSkillView.h"
#import "UIColor+Colors.h"

@implementation PBSkillView

- (id)initWithFrame:(CGRect)frame skill:(NSString *)skill percentage:(NSInteger)percentage {
    self = [super initWithFrame:frame];
    if (self) {
                
        _skillPercentage = percentage;
        
        _skillName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, self.frame.size.height)];
        _skillName.textColor = [UIColor whiteColor];
        _skillName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
        _skillName.text = skill;
        [self addSubview:_skillName];
        
        _percentageContainer = [[UIView alloc] initWithFrame:CGRectMake(210, 10, self.frame.size.width - 220, self.frame.size.height-20)];
        _percentageContainer.layer.cornerRadius = 10.0;
        _percentageContainer.layer.borderColor = [UIColor whiteColor].CGColor;
        _percentageContainer.layer.borderWidth = 2.0;
        [self addSubview:_percentageContainer];
        
        _percentageView = [[UIView alloc] initWithFrame:CGRectMake(_percentageContainer.frame.origin.x + 5, _percentageContainer.frame.origin.y + 5, _percentageContainer.frame.size.width - 10, _percentageContainer.frame.size.height - 10)];
        _percentageView.layer.cornerRadius = 5.0;
        _percentageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_percentageView];
        
        CGRect invisibleRect = CGRectMake(_percentageContainer.frame.origin.x + 5, _percentageContainer.frame.origin.y + 5, 0, _percentageContainer.frame.size.height - 10);
        _percentageView.frame = invisibleRect;
        
        _percentageLabel = [[UILabel alloc] initWithFrame:CGRectMake(_percentageContainer.frame.size.width-110, 0, 100, _percentageContainer.frame.size.height)];
        _percentageLabel.text = [NSString stringWithFormat:@"%ld %%", (long)percentage];
        _percentageLabel.textColor = [UIColor whiteColor];
        _percentageLabel.textAlignment = NSTextAlignmentRight;
        _percentageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
        [_percentageContainer addSubview:_percentageLabel];
        
        _percentageLabel.alpha = 0.0;
        
        _percentageContainer.hidden = YES;
        
        return self;
        
    }
    return self;
}

- (void)startAnimating {
    _percentageContainer.hidden = NO;
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect newRect= CGRectMake(_percentageContainer.frame.origin.x + 5, _percentageContainer.frame.origin.y + 5, (_percentageContainer.frame.size.width - 10) * _skillPercentage / 100, _percentageContainer.frame.size.height - 10);
        _percentageView.frame = newRect;
        _percentageLabel.alpha = 1.0;
    } completion:NULL];
}

@end
