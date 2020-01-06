//
//  EventInteraction ViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/6.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "EventInteractionViewController.h"
//#import "UIView+BlocksKit.h"
@interface EventInteractionViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *cyanView;
@end

@implementation EventInteractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"事件交互";
    
}

/// 事件点击层级
- (void)testOne{
    self.redView = [[UIView alloc]init];
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    self.redView.backgroundColor = [UIColor redColor];
//    [self.redView bk_whenTapped:^{
//        NSLog(@"点击红色模块了");
//    }];
}


@end
