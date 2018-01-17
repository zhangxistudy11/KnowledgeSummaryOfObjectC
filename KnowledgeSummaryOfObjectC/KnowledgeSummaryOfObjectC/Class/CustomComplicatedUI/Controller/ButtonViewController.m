//
//  ButtonViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/12/21.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"UIButton的了解";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addButtonOne];
    [self addButtonTwo];
    [self addButtonThree];
    [self addButtonFour];
}

- (void)addButtonOne
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 150, 40);
    btn.tag = 1000;
    [btn setTitle:@"点击按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"myMessage_CouponHint"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
}
- (void)addButtonTwo
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 150, 40);
    btn.tag = 1001;
    [btn setTitle:@"点击按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"myMessage_CouponHint"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    btn.imageEdgeInsets = UIEdgeInsetsMake(10, 100, 10, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);
}
- (void)addButtonThree
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 150, 40);
    btn.tag = 1003;
    [btn setTitle:@"点击按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
   [btn setImage:[UIImage imageNamed:@"myMessage_CouponHint"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 60);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
}
- (void)addButtonFour
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 400, 110, 60);
    btn.tag = 1004;
    [btn setTitle:@"点击按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"myMessage_CouponHint"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    btn.titleEdgeInsets = UIEdgeInsetsMake(-15, -18, 15, 18);
    btn.imageEdgeInsets = UIEdgeInsetsMake(20, 40, 0, -40);
}
- (void)click:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    if (tag == 1000) {
        NSLog(@"Tag is 1000");
    }else if (tag == 1001)
    {
       NSLog(@"Tag is 1001");
    }else if (tag == 1003)
    {
        NSLog(@"Tag is 1003");
    }else if (tag == 1004)
    {
        NSLog(@"Tag is 1004");
    }
}
@end
