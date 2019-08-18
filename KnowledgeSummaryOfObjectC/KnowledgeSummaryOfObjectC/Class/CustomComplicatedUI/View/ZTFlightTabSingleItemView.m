//
//  ZTFlightTabSingleItemView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ZTFlightTabSingleItemView.h"
@implementation ZTFlightTabSingleItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self initView];
    }
    return self;
}
- (void)initView{
    self.label = [[UILabel alloc]init];
    [self addSubview:self.label];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
    }];
    self.label.backgroundColor = [UIColor purpleColor];
    
    self.line = [[UIView alloc]init];
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(3);
    }];
    
    self.badge = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.badge];
    [self.badge setContentEdgeInsets:UIEdgeInsetsMake(1, 4, 1, 4)];
    self.badge.titleLabel.font = [UIFont systemFontOfSize:10];
    self.badge.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.badge setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.badge.backgroundColor = [UIColor yellowColor];
    [self.badge mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label.mas_right);
        make.bottom.equalTo(self.label.mas_top).offset(8);
        make.width.mas_equalTo(33);
        make.height.mas_equalTo(15);
    }];

    CGSize size =CGSizeMake(7.5, 7.5);
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 33, 15) byRoundingCorners: UIRectCornerBottomRight|UIRectCornerTopRight|UIRectCornerTopLeft cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.badge.layer.mask = shape;
    
    self.badge.hidden = YES;
}



@end
