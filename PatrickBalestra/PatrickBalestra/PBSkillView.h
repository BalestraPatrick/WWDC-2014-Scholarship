//
//  PBSkillView.h
//  PatrickBalestra
//
//  Created by Patrick Balestra on 09/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBSkillView : UIView

- (id)initWithFrame:(CGRect)frame skill:(NSString *)skill percentage:(NSInteger)percentage;
- (void)startAnimating;

@property (strong, nonatomic) UIView *percentageContainer;
@property (strong, nonatomic) UIView *percentageView;

@property (strong, nonatomic) UILabel *skillName;
@property (strong, nonatomic) UILabel *percentageLabel;

@property (assign) NSInteger skillPercentage;

@end
