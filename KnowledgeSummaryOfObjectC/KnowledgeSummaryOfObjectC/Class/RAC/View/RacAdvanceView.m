//
//  RacAdvanceView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/29.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "RacAdvanceView.h"

@implementation RacAdvanceView

- (instancetype)init
{
    self =[super init];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - Init View Methods
- (void)initView
{
    [self addSubview:self.textfiled];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(100);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
}
#pragma mark - Getter Methods
- (UITextField *)textfiled
{
    if (!_textfiled) {
        _textfiled = [[UITextField alloc]init];
        _textfiled.backgroundColor = [UIColor cyanColor];
    }
    return _textfiled;
}
@end
