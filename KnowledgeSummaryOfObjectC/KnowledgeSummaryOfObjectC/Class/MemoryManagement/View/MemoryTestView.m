//
//  MemoryTestView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/10/20.
//  Copyright © 2018 张玺. All rights reserved.
//

#import "MemoryTestView.h"

@implementation MemoryTestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView
{
    UIButton *btn = [[UIButton alloc]init];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.left.equalTo(self).offset(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
    }];
    [btn setTitle:@"按钮one" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
}
- (void)clickBtn
{
    if (self.clickBlock) {
        self.clickBlock();
    }
}
@end
