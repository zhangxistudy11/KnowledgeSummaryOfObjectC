//
//  ChangeTwoViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/7/20.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ChangeTwoViewController.h"

@interface ChangeTwoViewController ()
@property (nonatomic, strong) UIButton *btnOne;
@property (nonatomic, strong) UIButton *btnTwo;

@property (nonatomic, strong) UIView *viewOne;
@property (nonatomic, strong) UIView *viewTwo;

@property (nonatomic, strong) UILabel *lb;
@end

@implementation ChangeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
}
- (void)setUpView {
    
    self.btnOne = [[UIButton alloc]init];
    [self.view addSubview:self.btnOne];
    [self.btnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    self.btnOne.backgroundColor = [UIColor orangeColor];
    [self.btnOne setTitle:@"左边add子组件" forState:UIControlStateNormal];
    
    
    self.btnTwo = [[UIButton alloc]init];
    [self.view addSubview:self.btnTwo];
    [self.btnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btnOne.mas_right).offset(50);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    
    self.btnTwo.backgroundColor = [UIColor orangeColor];
    [self.btnTwo setTitle:@"右边add子组件" forState:UIControlStateNormal];
    
    WEAK_SELF;
    [self.btnOne bk_whenTapped:^{
        STRONG_SELF;
        [self.viewOne addSubview:self.lb];
    }];

    [self.btnTwo bk_whenTapped:^{
        STRONG_SELF;
        [self.viewTwo addSubview:self.lb];
    }];
    
    self.viewOne = [[UIView alloc]init];
    [self.view addSubview:self.viewOne];
    [self.viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.top.equalTo(self.view).offset(200);
        make.width.height.mas_equalTo(100);
    }];
    self.viewOne.backgroundColor = [UIColor cyanColor];
    
    self.viewTwo = [[UIView alloc]init];
    [self.view addSubview:self.viewTwo];
    [self.viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewOne.mas_right).offset(80);
        make.top.equalTo(self.view).offset(200);
        make.width.height.mas_equalTo(100);
    }];
    self.viewTwo.backgroundColor = [UIColor blueColor];
    
    self.lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 40, 30)];
    [self.viewTwo addSubview:self.lb];
    self.lb.font = [UIFont systemFontOfSize:13];
    self.lb.text = @"子控件";
    self.lb.backgroundColor = [UIColor yellowColor];
}


@end
