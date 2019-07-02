//
//  CustomProgressController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/1.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "CustomProgressController.h"
#import "CustomProgressView.h"
@interface CustomProgressController ()
@property (nonatomic,strong)CustomProgressView *progressView;
@end

@implementation CustomProgressController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"自定义加载条";
    
    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:firstBtn];
    firstBtn.backgroundColor = [UIColor blueColor];
    firstBtn.frame = CGRectMake(10, 100, 60, 30);
    [firstBtn setTitle:@"begin" forState:UIControlStateNormal];
    [firstBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:twoBtn];
    twoBtn.backgroundColor = [UIColor blueColor];
    twoBtn.frame = CGRectMake(80, 100, 60, 30);
    [twoBtn setTitle:@"first" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(first) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:threeBtn];
    threeBtn.backgroundColor = [UIColor blueColor];
    threeBtn.frame = CGRectMake(170, 100, 60, 30);
    [threeBtn setTitle:@"two" forState:UIControlStateNormal];
    [threeBtn addTarget:self action:@selector(two) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(CustomProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[CustomProgressView alloc]initWithFrame:CGRectMake(0, 200, 0, 40)];
        [self.view addSubview:_progressView];
    }
    return _progressView;
}

- (void)show
{
    [self.progressView startLoad];
}
- (void)first
{
    [self.progressView  completeLoad];
}
- (void)two
{
    [self.progressView resetLoad];
}

- (void)rightclick
{

}
@end
