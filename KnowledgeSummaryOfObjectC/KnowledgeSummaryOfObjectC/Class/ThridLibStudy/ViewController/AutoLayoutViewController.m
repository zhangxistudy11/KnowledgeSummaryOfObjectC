//
//  AutoLayoutViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/4/3.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"AutouLayout学习";
    
//    [self test1];
    [self test2];
}
- (void)test2 {
    UIView *cyanView = [[UIView alloc]init];
    [self.view addSubview:cyanView];
    cyanView.translatesAutoresizingMaskIntoConstraints = NO;
    cyanView.backgroundColor = [UIColor cyanColor];
    
    
    [cyanView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = YES;
    [cyanView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    [cyanView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:84].active = YES;
    [cyanView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-100].active = YES;
    
    UIView * yellowView = [[UIView alloc]init];
    [cyanView addSubview:yellowView];
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [yellowView.leftAnchor constraintEqualToAnchor:cyanView.leftAnchor constant:30].active = YES;
    [yellowView.heightAnchor constraintEqualToAnchor:cyanView.heightAnchor multiplier:0.5].active = YES;
    [yellowView.centerYAnchor constraintEqualToAnchor:cyanView.centerYAnchor].active = YES;
    [yellowView.widthAnchor constraintEqualToAnchor:cyanView.widthAnchor multiplier:0.5].active = YES;
    
    UIView * blueView = [[UIView alloc]init];
    [cyanView addSubview:blueView];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.backgroundColor = [UIColor blueColor];
    
    [blueView.rightAnchor constraintEqualToAnchor:cyanView.rightAnchor constant:-10].active = YES;
    [blueView.widthAnchor constraintEqualToAnchor:cyanView.widthAnchor multiplier:0.1].active = YES;
    [blueView.topAnchor constraintEqualToAnchor:yellowView.topAnchor].active = YES;
    [blueView.bottomAnchor constraintEqualToAnchor:yellowView.bottomAnchor].active = YES;

}

















- (void)test1 {
    UIView *yellow = [[UIView alloc] init];
    yellow.translatesAutoresizingMaskIntoConstraints = NO;
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    
    UIView *green = [[UIView alloc] init];
    green.translatesAutoresizingMaskIntoConstraints = NO;
    green.backgroundColor = [UIColor greenColor];
    [yellow addSubview:green];
    
    UIView *red = [[UIView alloc] init];
    red.translatesAutoresizingMaskIntoConstraints = NO;
    red.backgroundColor = [UIColor redColor];
    [yellow addSubview:red];
    
    CGFloat margin = 20;
    [yellow.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:margin].active = YES;
    [yellow.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-margin].active = YES;
    [yellow.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
    [yellow.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-margin].active = YES;
//
//    [green.leadingAnchor constraintEqualToAnchor:yellow.leadingAnchor constant:margin].active = YES;
//    [green.trailingAnchor constraintEqualToAnchor:yellow.trailingAnchor constant:-margin].active = YES;
//    [green.topAnchor constraintEqualToAnchor:yellow.topAnchor constant:margin].active = YES;
//    [green.bottomAnchor constraintEqualToAnchor:red.topAnchor constant:-margin].active = YES;
//
//    [red.leadingAnchor constraintEqualToAnchor:green.leadingAnchor].active = YES;
//    [red.trailingAnchor constraintEqualToAnchor:green.trailingAnchor].active = YES;
//    [red.bottomAnchor constraintEqualToAnchor:yellow.bottomAnchor constant:-margin].active = YES;
//    [red.heightAnchor constraintEqualToAnchor:green.heightAnchor multiplier:2.0].active = YES;
}

@end
