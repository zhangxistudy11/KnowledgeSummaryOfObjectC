//
//  PopMansoryView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/30.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "PopMansoryView.h"
#import "UIView+FITBackViewAddition.h"

@interface PopMansoryView ()
@property (nonatomic,strong) UIView * backGroundView;

@property (nonatomic,strong) UILabel * label;

@property (nonatomic,strong) UIView * subView;

@property (nonatomic,strong) UIButton *testBtn;
@end

@implementation PopMansoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - Init View
- (void)initView
{
    
    [self addSubview:self.backGroundView];

    self.backGroundView.backgroundColor = [UIColor yellowColor];
    self.label = [[UILabel alloc]init];
    self.label.text = @"我是弹框";
    self.label.backgroundColor = [UIColor cyanColor];
    [self.backGroundView addSubview:self.label];

    
    self.label.frame = CGRectMake(150, 170, 100, 40);
//    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.centerY.equalTo(self.backGroundView);
//        make.height.with.equalTo(@40);
//    }];
    
    self.testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testBtn setTitle:@"点击测试" forState:UIControlStateNormal];
    [self.backGroundView addSubview:self.testBtn];
    self.testBtn.layer.cornerRadius = 3.0;

    self.testBtn.frame = CGRectMake(150, 70, 80, 40);
    self.testBtn.backgroundColor = [UIColor greenColor];
    [self.testBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - Target Methods
- (void)btnClick:(UIButton *)sender
{
    NSLog(@"点击事件响应");
}
#pragma mark - Getter Methods

- (UIView *)backGroundView
{
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc]initWithFrame:self.bounds];

    }
    return _backGroundView;
}


- (void)show{

    self.height = 300;
    self.frame = CGRectMake(0, screen_height - self.height, self.width, self.height);
    self.transform = CGAffineTransformMakeTranslation(0, self.height);
    __weak typeof(self) weakSelf = self;
    [[UIApplication sharedApplication].keyWindow showViewWithBackView:weakSelf alpha:0.5 target:self touchAction:@selector(hide) animation:^{
        weakSelf.transform = CGAffineTransformIdentity;
    } timeInterval:0.25 fininshed:nil];
    
}
- (void)hide
{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    [window hideBackViewForView:self animation:^{
        self.transform = CGAffineTransformMakeTranslation(0,  self.height);
    } timeInterval:0.25 fininshed:nil];
}

@end
