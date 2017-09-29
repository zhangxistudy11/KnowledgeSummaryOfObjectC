//
//  PopViewOne.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/29.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "PopViewOne.h"
@interface PopViewOne ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIView * backGroundView;

@property (nonatomic,strong) UILabel * label;

@property (nonatomic,strong) UIView * subView;

@property (nonatomic,strong) UIButton *testBtn;
@end
@implementation PopViewOne

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - Init View
- (void)initView
{
    [self addSubview:self.backGroundView];
    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.backGroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    self.label = [[UILabel alloc]init];
    self.label.text = @"我是弹框";
    self.label.backgroundColor = [UIColor yellowColor];
    [self.backGroundView addSubview:self.label];
    _subView = self.label;
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.backGroundView);
        make.height.with.equalTo(@40);
    }];
    
    self.testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testBtn setTitle:@"点击测试" forState:UIControlStateNormal];
    [self.backGroundView addSubview:self.testBtn];
    self.testBtn.layer.cornerRadius = 3.0;
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backGroundView);
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.height.equalTo(@40);
        make.width.equalTo(@100);
    }];
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
        _backGroundView = [[UIView alloc]init];
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundViewAction:)];
        tapGesturRecognizer.delegate = self;
        [_backGroundView addGestureRecognizer:tapGesturRecognizer];
    }
    return _backGroundView;
}
// 蒙层点击事件
-(void)tapBackgroundViewAction:(id)tap
{
    // 点击区域在子视图内
    CGPoint point = [tap locationInView:self.backGroundView];
    if(CGRectContainsPoint(self.subView.frame, point)) {
        return;
    }
    
    [self removeFromSuperview];
    
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isDescendantOfView:_subView]) {
        return NO;
    }
    else {
        return YES;
    }
}
@end
