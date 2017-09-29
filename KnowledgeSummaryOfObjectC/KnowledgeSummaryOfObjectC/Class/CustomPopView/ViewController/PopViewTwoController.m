//
//  PopViewTwoController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/29.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "PopViewTwoController.h"
#import "PopViewTwo.h"
@interface PopViewTwoController ()

@property (nonatomic,strong) PopViewTwo *popTwo;

@end

@implementation PopViewTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"PopView的方法二";
    
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: [self createItemButtonWith:@"弹起" action:@"pop"], [self createItemButtonWith:@"隐藏" action:@"hide"],nil]];
}

#pragma mark - Private Methods
- (UIBarButtonItem *)createItemButtonWith:(NSString *)title action:(NSString *)funString
{
    UIButton *pulishButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
    pulishButton.frame = CGRectMake(0, 0, 50, 30);
    [pulishButton setTitle:title forState:(UIControlStateNormal)];
    [pulishButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    pulishButton.layer.masksToBounds=YES;
    pulishButton.layer.cornerRadius=3;
    pulishButton.titleLabel.font=[UIFont systemFontOfSize:15];
    pulishButton.backgroundColor=[UIColor whiteColor];
    SEL selector = NSSelectorFromString(funString);
    [pulishButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *pulish = [[UIBarButtonItem alloc] initWithCustomView:pulishButton];
    return pulish;
}
#pragma mark - Target Methods
- (void)pop
{
    NSLog(@"aa");
    _popTwo = [[PopViewTwo alloc]initWithFrame:self.view.bounds];
    [_popTwo show];
    
}
- (void)hide
{
    NSLog(@"bb");
    [_popTwo hide];
}
@end
