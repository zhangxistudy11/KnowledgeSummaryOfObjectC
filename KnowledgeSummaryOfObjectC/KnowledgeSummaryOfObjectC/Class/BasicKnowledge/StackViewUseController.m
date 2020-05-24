//
//  StackViewUseController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/5/24.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "StackViewUseController.h"

@interface StackViewUseController ()
@property(nonatomic,strong) UIStackView *stackView;
@property(nonatomic,strong) NSArray <NSString *> *titleArray;
@end

@implementation StackViewUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UIStackView使用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleArray = @[@"测试使用",@"dd",@"kk测试测试使用使用",@"测用"];
    [self addStackViewOne];
    
}
- (void)addStackViewOne {
    self.stackView = [[UIStackView alloc]init];
    [self.view addSubview:self.stackView];
    self.stackView.backgroundColor = [UIColor redColor];
    self.stackView.axis = UILayoutConstraintAxisHorizontal; //横向
    self.stackView.distribution = UIStackViewDistributionFill; // 布满
    self.stackView.alignment = UIStackViewAlignmentLastBaseline; //中间
    self.stackView.spacing = 5.0f; // 间距

    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.and.left.equalTo(self.view);
        make.height.equalTo(@200);
    }];
    
    for (NSString *title in self.titleArray) {
        UILabel *lb=[[UILabel alloc]init];
        lb.backgroundColor = RandomColor;
        lb.font = [UIFont systemFontOfSize:16];
        lb.text = title;
        [self.stackView addArrangedSubview:lb];

        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.stackView);
            make.height.mas_offset(60);
//                        make.size.mas_equalTo(CGSizeMake(100, 100)).priorityLow();
        }];
    }
//    for(int i = 0; i < 4; i++)
//    {
//        UIView * subView = [[UIView alloc] init];
//        [subView mas_makeConstraints:^(MASConstraintMaker *make){
//
//            make.size.mas_equalTo(CGSizeMake(100, 100));
//            // 注意降低优先级
//
//        }];
//        subView.backgroundColor = [UIColor greenColor];
//        [self.stackView addArrangedSubview:subView];
//
//    }
}


@end
