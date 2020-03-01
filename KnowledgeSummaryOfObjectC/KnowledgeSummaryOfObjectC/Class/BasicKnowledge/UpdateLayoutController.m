//
//  UpdateLayoutController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "UpdateLayoutController.h"

@interface UpdateLayoutController ()
@property(nonatomic,strong) UIView *redView;
@property(nonatomic,strong) UIButton *clickBtn;
@property(nonatomic,strong) UIButton *clickTwoBtn;
@property(nonatomic,strong) UIButton *clickThrBtn;
@property(nonatomic,strong) UIButton *clickFourBtn;

@end

@implementation UpdateLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"setNeedsLayout和layoutIfNeeded";
    [self setUpView];
}
- (void)setUpView {
    self.redView = [[UIView alloc]init];
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.top.equalTo(self.view).offset(150);
        make.width.height.mas_equalTo(100);
    }];
    self.redView.backgroundColor = [UIColor redColor];
    
    self.clickBtn = [[UIButton alloc]init];
    [self.view addSubview:self.clickBtn];
    [self.clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redView.mas_right).offset(40);
        make.top.equalTo(self.redView.mas_top);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    [self.clickBtn setTitle:@"调用setNeedsLayout" forState:UIControlStateNormal];
    [self.clickBtn bk_whenTapped:^{
        [self testOne];
    }];
    self.clickBtn.backgroundColor = [UIColor blueColor];
    
    self.clickTwoBtn = [[UIButton alloc]init];
    [self.view addSubview:self.clickTwoBtn];
    [self.clickTwoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redView.mas_right).offset(40);
        make.top.equalTo(self.clickBtn.mas_bottom).offset(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    [self.clickTwoBtn setTitle:@"动画调用setNeedsLayout" forState:UIControlStateNormal];
    [self.clickTwoBtn bk_whenTapped:^{
        [self testTwo];
    }];
    self.clickTwoBtn.backgroundColor = [UIColor blueColor];
    
    self.clickThrBtn = [[UIButton alloc]init];
    [self.view addSubview:self.clickThrBtn];
    [self.clickThrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redView.mas_right).offset(40);
        make.top.equalTo(self.clickTwoBtn.mas_bottom).offset(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    [self.clickThrBtn setTitle:@"动画调用layoutIfNeeded" forState:UIControlStateNormal];
    [self.clickThrBtn bk_whenTapped:^{
        [self testThr];
    }];
    self.clickThrBtn.backgroundColor = [UIColor blueColor];
    
    self.clickFourBtn = [[UIButton alloc]init];
    [self.view addSubview:self.clickFourBtn];
    [self.clickFourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redView.mas_right).offset(40);
        make.top.equalTo(self.clickThrBtn.mas_bottom).offset(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    [self.clickFourBtn setTitle:@"两个都调用" forState:UIControlStateNormal];
    [self.clickFourBtn bk_whenTapped:^{
        [self testFour];
    }];
    self.clickFourBtn.backgroundColor = [UIColor blueColor];
}
- (void)testOne {
    [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(300);
    }];
}
- (void)testTwo {

    [UIView animateWithDuration:0.5 animations:^{
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(300);
           }];
        [self.view setNeedsLayout];

    }];
}
- (void)testThr {

    [UIView animateWithDuration:0.5 animations:^{
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(300);
           }];
        [self.view layoutIfNeeded];

    }];
    
}
- (void)testFour {
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.height.mas_equalTo(300);
           }];
       [self.view setNeedsLayout];
              [self.view layoutIfNeeded];

    }];

}


@end
