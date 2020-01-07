//
//  EventInteraction ViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/6.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "EventInteractionViewController.h"
#import "UIView+BlocksKit.h"
@interface EventInteractionViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *cyanView;
@end

@implementation EventInteractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"事件交互";
    
    [self testOne];
}

/// 事件点击层级
- (void)testOne{
    self.redView = [[UIView alloc]init];
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(300);
        make.top.equalTo(self.view.mas_top).offset(84);
    }];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.userInteractionEnabled = YES;
    
    self.yellowView = [[UIView alloc]init];
    [self.redView addSubview:self.yellowView];
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.redView);
        make.width.height.mas_equalTo(200);
    }];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    self.yellowView.userInteractionEnabled = YES;
    
    
    self.cyanView = [[UIView alloc]init];
    [self.yellowView addSubview:self.cyanView];
    [self.cyanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.yellowView);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    self.cyanView.backgroundColor = [UIColor cyanColor];
    self.cyanView.userInteractionEnabled = YES;
    
    
    [self addEventMethod];
}
- (void)addEventMethod{
    [self.yellowView bk_whenTapped:^{
        NSLog(@"点击了黄色模块了");
    }];
}

@end
