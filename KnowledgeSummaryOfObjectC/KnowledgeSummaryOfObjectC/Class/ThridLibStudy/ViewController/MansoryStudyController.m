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
@property (nonatomic,strong)UIView *thrPView;
@property (nonatomic,strong) UILabel *sevenSubLabel;
@property (nonatomic,strong) UILabel *eightSubLabel;

@property (nonatomic,strong)UIView *thrSonePView;
@end

@implementation MansoryStudyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"Mansory学习";
    
    [self testOne];
    [self testTwo];
    [self testThree];
    [self testFour];

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
- (void)testFour
{
    self.thrPView = [[UIView alloc]init];
    [self.view addSubview:self.thrPView];
    [self.thrPView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.twoPView.mas_bottom).offset(25);
        make.height.mas_equalTo(40);
    }];
    self.thrPView.backgroundColor = [UIColor redColor];
    
//    self.thrSonePView = [[UIView alloc]init];
//    [self.thrPView addSubview:self.thrSonePView];
//    [self.thrSonePView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.thrPView);
//        make.centerY.equalTo(self.thrSonePView);
//        make.height.mas_equalTo(15);
//        make.width.mas_equalTo(40);
//        make.right.equalTo(self.thrPView.mas_right);
//    }];
//    self.thrSonePView.backgroundColor = [UIColor blueColor];
    
    for (int i=0; i<=3; i++) {
        UIView * lv = [[UIView alloc]init];
        [self.thrPView addSubview:lv];
        lv.backgroundColor = [UIColor greenColor];
        [lv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.thrPView).offset(i*40);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self.thrPView);
            make.width.mas_equalTo(40);
            if (i==3) {
                make.right.equalTo(self.thrPView.mas_right);
            }
        }];
        
    }
    
    self.sevenSubLabel = [[UILabel alloc]init];
    [self.view addSubview:self.sevenSubLabel];
    [self.sevenSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thrPView.mas_right);
        make.top.equalTo(self.twoPView.mas_bottom).offset(25);
        make.height.mas_equalTo(20);
        make.width.lessThanOrEqualTo(@(90));
    }];
    self.sevenSubLabel.text = @"gggggggggggggggggggg";
    self.sevenSubLabel.backgroundColor = [UIColor greenColor];
    
    self.eightSubLabel = [[UILabel alloc]init];
    [self.view addSubview:self.eightSubLabel];
    [self.eightSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sevenSubLabel.mas_right);
        make.centerY.equalTo(self.sevenSubLabel);
        make.height.mas_equalTo(20);
    }];
    self.eightSubLabel.text = @"ffff ";
    self.eightSubLabel.backgroundColor = [UIColor yellowColor];
}
@end
