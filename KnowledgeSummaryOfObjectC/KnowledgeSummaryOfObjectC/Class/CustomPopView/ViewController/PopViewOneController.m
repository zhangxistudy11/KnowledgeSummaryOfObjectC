//
//  PopViewOneController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/29.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "PopViewOneController.h"
#import "PopViewOne.h"
@interface PopViewOneController ()

@property (nonatomic,strong) PopViewOne * onePopView;

@property (nonatomic,strong) UILabel * label;

@end

@implementation PopViewOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"PopView的方法一";
    

    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: [self createItemButtonWith:@"弹起" action:@"pop"], [self createItemButtonWith:@"隐藏" action:@"hide"],nil]];
    
    self.label = [[UILabel alloc]init];
    self.label.text = @"FADASAFSA";
    self.label.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.height.with.equalTo(@100);
    }];
}
#pragma mark - Target Methods
- (void)pop
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti1" object:nil];
    

    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
    return;
    NSLog(@"aa");
    [self.view addSubview:self.onePopView];
    [self.onePopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
   
}
- (void)hide
{
   NSLog(@"bb");
    [self.onePopView removeFromSuperview];
    self.onePopView = nil;
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
#pragma mark - Getter Methods
- (PopViewOne *)onePopView
{
    if (!_onePopView) {
        _onePopView = [[PopViewOne alloc]init];
        
    }
    return _onePopView;
}
@end
