//
//  SlideViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/15.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "SlideViewController.h"
#import "SlideView.h"
@interface SlideViewController ()

@property (nonatomic,strong)SlideView * contentView;

@end

@implementation SlideViewController

#pragma mark- ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"滑动悬停效果";
    [self setUpView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
#pragma makr - SetUpView
- (void)setUpView
{
    _contentView = [[SlideView alloc]initWithFrame:CGRectMake(0, top_height, screen_width, screen_height-top_height)];
    [self.view addSubview:_contentView];
}
@end
