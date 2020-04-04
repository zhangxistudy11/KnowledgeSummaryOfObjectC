//
//  MansoryAdvanced.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/27.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "MansoryAdvanced.h"

@interface MansoryAdvanced ()<UITextViewDelegate>
@property (nonatomic, strong) UIView *contentView1;
@property (nonatomic, strong) UILabel *lbV11;
@property (nonatomic, strong) UILabel *lbV12;
@property (nonatomic, strong) UILabel *lbV13;

@property (nonatomic, strong) UITextView *txV12;


@property (nonatomic, strong) UIButton *bnt2;
@property (nonatomic, strong) UIButton *bnt3;
@property (nonatomic, strong) UIButton *bnt4;
@property (nonatomic, strong) UIButton *bnt5;

@end

@implementation MansoryAdvanced

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"Mansory进阶学习";
    
    [self setUpView];
}
- (void)setUpView{
    [self testOne];
    [self testTwo];
    [self testThree];
    [self testFour];
    [self testFive];

}
/*
 子控件来撑开父控件。关键点：约束要依次限制好
 */
- (void)testOne{
    
    self.contentView1 = [[UIView alloc]init];
    [self.view addSubview:self.contentView1];
    self.contentView1.backgroundColor = [UIColor grayColor];
    [self.contentView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.left.equalTo(self.view).offset(50);
        make.width.mas_equalTo(200);
    }];
    
    self.lbV11 =[[UILabel alloc]init];
    [self.contentView1 addSubview:self.lbV11];
    self.lbV11.backgroundColor = [UIColor cyanColor];
    [self.lbV11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView1).offset(30);
        make.left.equalTo(self.contentView1).offset(15);
        make.right.equalTo(self.contentView1.mas_right).offset(-15);
    }];
    self.lbV11.textAlignment = NSTextAlignmentCenter;
    self.lbV11.text = @"头部";
    
    self.lbV12 =[[UILabel alloc]init];
    [self.contentView1 addSubview:self.lbV12];
    self.lbV12.backgroundColor = [UIColor yellowColor];
    [self.lbV12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lbV11.mas_bottom).offset(15);
        make.left.right.equalTo(self.lbV11);
        make.height.lessThanOrEqualTo(@(80));
    }];
    self.lbV12.textAlignment = NSTextAlignmentCenter;
    self.lbV12.text = @"很多内容";
    self.lbV12.lineBreakMode = NSLineBreakByWordWrapping;
    self.lbV12.numberOfLines = 0;
    
    self.txV12 = [[UITextView alloc]init];
    [self.contentView1 addSubview:self.txV12];
    [self.txV12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lbV12.mas_bottom).offset(15);
        make.left.right.equalTo(self.lbV11);
        make.height.mas_equalTo(40);
//        make.height.lessThanOrEqualTo(@100);
    }];
    self.txV12.backgroundColor = [UIColor blueColor];
    self.txV12.text = @"我是textView我是textView我是textView我是textView我是textView我是textView我是textView我是textView";
    self.txV12.font = [UIFont systemFontOfSize:16];
    self.txV12.scrollEnabled = NO;
    self.txV12.delegate = self;
    
    self.lbV13 =[[UILabel alloc]init];
    [self.contentView1 addSubview:self.lbV13];
    self.lbV13.backgroundColor = [UIColor cyanColor];
    [self.lbV13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txV12.mas_bottom).offset(15);
        make.left.right.equalTo(self.lbV11);
        make.bottom.equalTo(self.contentView1.mas_bottom).offset(-30);
    }];
    self.lbV13.textAlignment = NSTextAlignmentCenter;
    self.lbV13.text = @"底部";
    
}
/*
 动态改变值后，之前约束需要如何处理
 */
- (void)testTwo{
    
    self.bnt2 = [[UIButton alloc]init];
    [self.view addSubview:self.bnt2];
    [self.bnt2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView1.mas_right).offset(10);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.contentView1.mas_top);
    }];
    self.bnt2.backgroundColor = [UIColor orangeColor];
    [self.bnt2 setTitle:@"动态改变高度" forState:UIControlStateNormal];
    
    [self.bnt2 bk_whenTapped:^{
        self.lbV12.text = @"动态改变高度动态改变高度动态改变高度";
    }];
}
/*
 动态改变高度，有最大值限制
 */
- (void)testThree{
    self.bnt3 = [[UIButton alloc]init];
    [self.view addSubview:self.bnt3];
    [self.bnt3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.bnt2);
        make.top.equalTo(self.bnt2.mas_bottom).offset(10);
    }];
    self.bnt3.backgroundColor = [UIColor orangeColor];
    [self.bnt3 setTitle:@"最大值限制" forState:UIControlStateNormal];
    
    [self.bnt3 bk_whenTapped:^{
        self.lbV12.text = @"最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大无限大无限大无限大";
    }];
}
/*
 动态改变textView高度,无法实现textview动态适应
 */
- (void)testFour{
    self.bnt4 = [[UIButton alloc]init];
      [self.view addSubview:self.bnt4];
      [self.bnt4 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.right.height.equalTo(self.bnt2);
          make.top.equalTo(self.bnt3.mas_bottom).offset(10);
      }];
      self.bnt4.backgroundColor = [UIColor orangeColor];
      [self.bnt4 setTitle:@"动态textView" forState:UIControlStateNormal];
      
      [self.bnt4 bk_whenTapped:^{
//          [self.txV12 mas_updateConstraints:^(MASConstraintMaker *make) {
//              make.height.lessThanOrEqualTo(@(100));
//          }];
          self.txV12.text = @"动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView动态textView";
      }];
}
/*
 内容自适应，并且位移
 */
- (void)testFive{
    self.bnt5 = [[UIButton alloc]init];
     [self.view addSubview:self.bnt5];
     [self.bnt5 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.right.height.equalTo(self.bnt2);
         make.top.equalTo(self.bnt4.mas_bottom).offset(10);
     }];
     self.bnt5.backgroundColor = [UIColor orangeColor];
     [self.bnt5 setTitle:@"动态位移" forState:UIControlStateNormal];
     
     [self.bnt5 bk_whenTapped:^{
         self.lbV12.text = @"最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大值限制最大无限大无限大无限大";
         [self.contentView1 mas_updateConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(self.view.mas_top).offset(200);
         }];
     }];
}
#pragma mark - UITextView Delegate
- (void)textViewDidChange:(UITextView *)textView
{
     ///> 计算文字高度
       CGFloat height = ceilf([textView sizeThatFits:CGSizeMake(textView.frame.size.width, MAXFLOAT)].height);
       if (height >= 200) {
           textView.scrollEnabled = YES;   ///> 当textView高度大于等于最大高度的时候让其可以滚动
           height = 200;                   ///> 设置最大高度
       }
       ///> 重新设置frame, textView往上增长高度
       textView.frame = CGRectMake(0, CGRectGetMaxY(textView.frame) - height, self.view.bounds.size.width, height);
       [textView layoutIfNeeded];
}
@end
