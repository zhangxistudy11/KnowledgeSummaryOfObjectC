//
//  CollectionIndexCell.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/4/2.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "CollectionIndexCell.h"
#import "MansoryAdvanced.h"
@interface  CollectionIndexCell()
@property (nonatomic, strong) UILabel *dateLB;
@end
@implementation CollectionIndexCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView{
    self.dateLB = [[UILabel alloc]init];
      [self.contentView addSubview:self.dateLB];
    [self.dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
                  make.top.equalTo(self.contentView.mas_top).offset(7);
                  make.height.mas_equalTo(16);
    }];
//    [self.dateLB mas_ma]
//      [self.dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
//          make.centerX.equalTo(self.contentView.mas_centerX);
//          make.top.equalTo(self.contentView.mas_top).offset(7);
//          make.height.mas_equalTo(16);
//      }];
      self.dateLB.textColor = [UIColor blackColor];
      self.dateLB.font = [UIFont systemFontOfSize:11];
      self.dateLB.textAlignment = NSTextAlignmentCenter;
}
- (void)updateStr:(NSString *)str{
    self.dateLB.text = str;
}
@end
