//
//  RacPrimaryController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/26.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "RacPrimaryController.h"
#import "RacPrimaryView.h"
@interface RacPrimaryController ()

@property (nonatomic,strong) RacPrimaryView *primaryView;

@end

@implementation RacPrimaryController


#pragma mark - ViewController Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"RAC的初级使用";
    
    [self setUpView];
    [self layoutAllSubView];
    [self bindData];
}
#pragma mark - Init View Methods
- (void)setUpView
{
    [self.view addSubview:self.primaryView];
}
- (void)layoutAllSubView
{
    [self.primaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}
#pragma mark - RAC BindData
- (void)bindData
{
    [[self.primaryView.redBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了按钮");
    }];
}
#pragma mark - Getter Methods
- (RacPrimaryView *)primaryView
{
    if (!_primaryView) {
        _primaryView = [[RacPrimaryView alloc]init];
    }
    return _primaryView;
}
@end
