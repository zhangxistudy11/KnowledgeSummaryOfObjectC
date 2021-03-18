//
//  EventInteraction ViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/6.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "EventInteractionViewController.h"
#import "UIView+BlocksKit.h"
#import "TestClolorView.h"
@interface EventInteractionViewController ()
@property (nonatomic, strong) TestClolorView *redView;
@property (nonatomic, strong) TestClolorView *yellowView;
@property (nonatomic, strong) TestClolorView *greenView;
@end

@implementation EventInteractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"事件交互";
    
    [self testOne];
}

/// 事件点击层级
- (void)testOne{
    self.redView = [[TestClolorView alloc]initWithFrame:CGRectZero whitColorType:ColorTypeRed];
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(300);
        make.top.equalTo(self.view.mas_top).offset(84);
    }];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.userInteractionEnabled = YES;
    
    self.yellowView = [[TestClolorView alloc]initWithFrame:CGRectZero whitColorType:ColorTypeYellow];
    [self.redView addSubview:self.yellowView];
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.redView);
        make.width.height.mas_equalTo(200);
    }];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    self.yellowView.userInteractionEnabled = NO;
    
    
    self.greenView = [[TestClolorView alloc]initWithFrame:CGRectZero whitColorType:ColorTypeGreen];
    [self.yellowView addSubview:self.greenView];
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.yellowView);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    self.greenView.backgroundColor = [UIColor greenColor];
    self.greenView.userInteractionEnabled = YES;
    
    
   
}


@end
