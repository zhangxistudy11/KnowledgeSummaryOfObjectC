//
//  BarChartViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/28.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BarChartViewController.h"
#import "BarChartView.h"
@interface BarChartViewController ()
@property (nonatomic,strong) BarChartView *chartView;
@end

@implementation BarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"柱形图";
    
    [self setUpView];
}

- (void)setUpView
{
    self.chartView = [[BarChartView alloc]initWithFrame:CGRectMake(63, 200, screen_width-63-25, 175)];
    [self.view addSubview:self.chartView];
    self.chartView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.chartView.layer.borderWidth = 0.5;
    [self.chartView drawBarView];
}

@end
