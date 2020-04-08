//
//  RacPrimaryView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/28.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "RacPrimaryView.h"
@interface RacPrimaryView()

@end
@implementation RacPrimaryView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - Init View Methods
- (void)initView
{
    [self addSubview:self.redBtn];
    [self addSubview:self.nameTF];
    [self addSubview:self.greenBtn];
    [self addSubview:self.yellowBtn];
    
    [self addTestView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(100);
        make.height.equalTo(@40);
        make.width.equalTo(@80);
    }];
    
    [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redBtn.mas_bottom).offset(200);
        make.left.right.height.equalTo(self.redBtn);
    }];
    
    [self.greenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redBtn.mas_right).offset(20);
        make.top.equalTo(self.redBtn.mas_top);
        make.height.equalTo(@40);
        make.width.equalTo(@80);
    }];
    
    [self.yellowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.greenBtn.mas_left);
        make.top.equalTo(self.redBtn.mas_bottom).offset(10);
        make.height.equalTo(@40);
        make.width.equalTo(@80);
    }];
    
}
- (void)addTestView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 150, 100, 200)];
    _scrollView.contentSize = CGSizeMake(200, 700);
    _scrollView.backgroundColor = [UIColor cyanColor];
    [self addSubview:_scrollView];
}
#pragma mark - Getter Methods
- (UIButton *)redBtn
{
    if (!_redBtn) {
        _redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _redBtn.backgroundColor = [UIColor cyanColor];
        [_redBtn setTitle:@"测试一111tttt" forState:UIControlStateNormal];
    }
    return _redBtn;
}

- (UIButton *)greenBtn
{
    if (!_greenBtn) {
        _greenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _greenBtn.backgroundColor = [UIColor cyanColor];
        [_greenBtn setTitle:@"测试二22222" forState:UIControlStateNormal];
    }
    return _greenBtn;
}
- (UIButton *)yellowBtn
{
    if (!_yellowBtn) {
        _yellowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _yellowBtn.backgroundColor = [UIColor cyanColor];
        [_yellowBtn setTitle:@"测试三" forState:UIControlStateNormal];
    }
    return _yellowBtn;
}
- (UITextField *)nameTF
{
    if (!_nameTF) {
        _nameTF = [[UITextField alloc]init];
        _nameTF.backgroundColor = [UIColor blueColor];
    }
    return _nameTF;
}
@end
