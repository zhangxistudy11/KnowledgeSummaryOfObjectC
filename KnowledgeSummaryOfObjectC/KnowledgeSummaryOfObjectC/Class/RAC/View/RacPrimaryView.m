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
}
#pragma mark - Getter Methods
- (UIButton *)redBtn
{
    if (!_redBtn) {
        _redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _redBtn.backgroundColor = [UIColor redColor];
        [_redBtn setTitle:@"测试一" forState:UIControlStateNormal];
    }
    return _redBtn;
}
@end
