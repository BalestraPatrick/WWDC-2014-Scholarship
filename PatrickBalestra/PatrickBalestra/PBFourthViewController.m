//
//  PBFourthViewController.m
//  PatrickBalestra
//
//  Created by Patrick Balestra on 03/04/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "PBFourthViewController.h"
#import "PBSkillView.h"

@interface PBFourthViewController ()

@property (strong, nonatomic) PBSkillView *objectiveCView;
@property (strong, nonatomic) PBSkillView *pebbleDevelopmentView;
@property (strong, nonatomic) PBSkillView *htmlView;
@property (strong, nonatomic) PBSkillView *CSSView;
@property (strong, nonatomic) PBSkillView *javascriptView;
@property (strong, nonatomic) PBSkillView *cView;
@property (strong, nonatomic) PBSkillView *javaView;

@end

@implementation PBFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create PBSkillView for every language I know
    _objectiveCView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 35, 760, 60) skill:@"Objective-C" percentage:80];
    [self.view addSubview:_objectiveCView];
    
    _pebbleDevelopmentView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 115, 760, 60) skill:@"Pebble Dev" percentage:70];
    [self.view addSubview:_pebbleDevelopmentView];
    
    _htmlView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 195, 760, 60) skill:@"HTML" percentage:70];
    [self.view addSubview:_htmlView];
    
    _CSSView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 275, 760, 60) skill:@"CSS" percentage:70];
    [self.view addSubview:_CSSView];
    
    _javascriptView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 340, 760, 60) skill:@"Javascript" percentage:60];
    [self.view addSubview:_javascriptView];
    
    _cView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 420, 760, 60) skill:@"C" percentage:50];
    [self.view addSubview:_cView];
    
    _javaView = [[PBSkillView alloc] initWithFrame:CGRectMake(20, 500, 760, 60) skill:@"Java" percentage:30];
    [self.view addSubview:_javaView];
    
    // Set up observer to animate skills
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startAnimating:) name:@"AnimateSkills" object:nil];

}

- (void)startAnimating:(NSNotification *)notification {
    // Start animating when contentOffset makes Skills view visible to the user
    [_objectiveCView startAnimating];
    [_pebbleDevelopmentView startAnimating];
    [_htmlView startAnimating];
    [_CSSView startAnimating];
    [_javascriptView startAnimating];
    [_cView startAnimating];
    [_javascriptView startAnimating];
    [_javaView startAnimating];
}



@end
