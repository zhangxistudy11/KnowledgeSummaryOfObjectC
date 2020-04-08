//
//  RacPrimaryController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/26.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "RacPrimaryController.h"
#import "RacPrimaryView.h"
@interface RacPrimaryController ()

@property (nonatomic,strong) RacPrimaryView *primaryView;

@end

@implementation RacPrimaryController


#pragma mark - ViewController Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"RAC的初级使用";
    
    [self setUpView];
    [self layoutAllSubView];
    [self bindData];
}
#pragma mark - Init View Methods
- (void)setUpView
{
    [self.view addSubview:self.primaryView];
}
- (void)layoutAllSubView
{
    [self.primaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}
#pragma mark - RAC BindData
- (void)bindData
{
    [[self.primaryView.redBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了按钮");
    }];
    
    [[self.primaryView.nameTF rac_signalForControlEvents:UIControlEventEditingChanged]subscribeNext:^(id x) {
        UITextField * tf = (UITextField *)x;
        NSLog(@"%@",tf.text);
    }];
    
    [[self.primaryView.nameTF rac_textSignal] subscribeNext:^(id x) {
       NSLog(@"--%@",x);
    }];
    
    [[self.primaryView.greenBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self showAlertGreenView];
    }];
    
    [RACObserve(self.primaryView.scrollView, contentOffset)subscribeNext:^(id x) {
        NSNumber * aa = (NSNumber *)x;
//        CGPoint offset = [x];
        NSLog(@"gg1111");
       // NSLog(@"offY:%f",offset.y);
    } ];
}
#pragma mark - Target Methods
- (void)showAlertGreenView
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"弹出框" message:@"aa" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"cancle1111" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定333");
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"wait" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"待定4444");
    }]];
    
}
#pragma mark - Getter Methods
- (RacPrimaryView *)primaryView
{
    if (!_primaryView) {
        _primaryView = [[RacPrimaryView alloc]init];
    }
    return _primaryView;
}
@end
