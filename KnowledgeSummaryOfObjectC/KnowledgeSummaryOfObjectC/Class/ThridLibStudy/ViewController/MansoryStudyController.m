//
//  MansoryStudyController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/4/20.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "MansoryStudyController.h"

@interface MansoryStudyController ()
@property (nonatomic,strong)UIView *onePView;
@property (nonatomic,strong)UIView *oneSView;
@property (nonatomic,strong) UILabel *oneSubLabel;
@property (nonatomic,strong) UILabel *twoSubLabel;
@property (nonatomic,strong) UILabel *thrSubLabel;
@property (nonatomic,strong) UILabel *fourSubLabel;
@property (nonatomic,strong) UILabel *fiveSubLabel;
@property (nonatomic,strong) UILabel *sixSubLabel;

@property (nonatomic,strong)UIView *twoPView;


@end

@implementation MansoryStudyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"Mansory学习";
    
    [self testOne];
    [self testTwo];
    [self testThree];
}
- (void)testOne
{
    //子view撑开父view 子view要把相对父view的所有约束都写完整
    self.onePView = [[UIView alloc]init];
    [self.view addSubview:self.onePView];
    [self.onePView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.height.mas_equalTo(100);
        make.top.equalTo(self.view).offset(90);
    }];
    self.onePView.backgroundColor = [UIColor redColor];
    
    self.oneSView = [[UIView alloc]init];
    [self.onePView addSubview:self.oneSView];
    [self.oneSView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.onePView);
        make.height.mas_equalTo(100);
//        make.width.mas_equalTo(100);
        make.right.equalTo(self.onePView.mas_right).offset(-10);
    }];
    self.oneSView.backgroundColor = [UIColor yellowColor];
    
    self.oneSubLabel = [[UILabel alloc]init];
    [self.oneSView addSubview:self.oneSubLabel];
    [self.oneSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.oneSView);
        make.centerY.equalTo(self.oneSView);
//        make.right.equalTo(self.oneSView.mas_right).offset(-10);

    }];
    self.oneSubLabel.text = @"房间爱了圾房倒垃圾发";
    self.oneSubLabel.backgroundColor = [UIColor blueColor];
    
    self.twoSubLabel = [[UILabel alloc]init];
    [self.oneSView addSubview:self.twoSubLabel];
    [self.twoSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oneSubLabel.mas_right);
        make.centerY.equalTo(self.oneSView);
        make.right.equalTo(self.oneSView.mas_right).offset(-10);
    }];
    self.twoSubLabel.text = @"dddddddd";
    self.twoSubLabel.backgroundColor = [UIColor purpleColor];
}
- (void)testTwo
{
    //设置约束的边界值  可以设置MASViewAttribute和NSNumber
    self.fourSubLabel = [[UILabel alloc]init];
    [self.view addSubview:self.fourSubLabel];
    [self.fourSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.oneSView.mas_bottom).offset(20);
        make.height.mas_equalTo(20);
        make.width.lessThanOrEqualTo(@80);
    }];
    self.fourSubLabel.text = @"fffffffffffffffff";
    self.fourSubLabel.backgroundColor = [UIColor greenColor];
    
    self.fiveSubLabel = [[UILabel alloc]init];
    [self.view addSubview:self.fiveSubLabel];
    [self.fiveSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.fourSubLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];
    self.fiveSubLabel.text = @"fffffffffffffffff";
    self.fiveSubLabel.backgroundColor = [UIColor greenColor];
    
    self.sixSubLabel = [[UILabel alloc]init];
    [self.view addSubview:self.sixSubLabel];
    [self.sixSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.fiveSubLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
        make.right.greaterThanOrEqualTo(self.fourSubLabel.mas_right);
    }];
    self.sixSubLabel.text = @"ffff ";
    self.sixSubLabel.backgroundColor = [UIColor greenColor];
}
- (void)testThree
{
    //mas_updateConstraints 和  mas_remakeConstraints使用
    self.twoPView = [[UIView alloc]init];
    [self.view addSubview:self.twoPView];
    [self.twoPView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(80);
        make.top.equalTo(self.sixSubLabel.mas_bottom).offset(20);
    }];
    self.twoPView.backgroundColor = [UIColor cyanColor];
    
    [self.twoPView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
    }];
    
    [self.twoPView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixSubLabel.mas_bottom).offset(100);


    }];
}
@end
