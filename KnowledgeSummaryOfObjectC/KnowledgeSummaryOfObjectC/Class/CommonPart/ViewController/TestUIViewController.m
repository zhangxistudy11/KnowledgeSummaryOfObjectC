//
//  TestUIViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/22.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "TestUIViewController.h"

@interface TestUIViewController ()
@property(nonatomic, strong) UISwitch *pushSwitch;

@end

@implementation TestUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TestVC";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
  
//    [self  setUpView];
    [self test1];
}

- (void)test1 {
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [redView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
    [redView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-100].active = YES;
    [redView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:100].active = YES;
    [redView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-100].active = YES;
    
    UIView *yellowView = [[UIView alloc]init];
    [redView addSubview:yellowView];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [yellowView.centerYAnchor constraintEqualToAnchor:redView.centerYAnchor constant:0].active = YES;
    [yellowView.heightAnchor constraintEqualToAnchor:redView.heightAnchor multiplier:0.5].active = YES;
    [yellowView.centerXAnchor constraintEqualToAnchor:redView.centerXAnchor constant:0].active = YES;
    [yellowView.widthAnchor constraintEqualToAnchor:redView.widthAnchor multiplier:0.5].active = YES;

}

























- (void)setUpView{
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

@end
