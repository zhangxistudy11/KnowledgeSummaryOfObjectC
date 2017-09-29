//
//  RacAdvanceController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/29.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "RacAdvanceController.h"
#import "RacAdvanceView.h"
@interface RacAdvanceController ()

@property (nonatomic,strong) RacAdvanceView *advanceView;

@end

@implementation RacAdvanceController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.navigationItem.title = @"ReactiveCocoa高级使用";
    
    self.advanceView = [[RacAdvanceView alloc]init];
    [self.view addSubview:self.advanceView];
    [self.advanceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self test1];
    
    [self bindingData];
    
}

- (void)test1
{
    //创建信号
    RACSignal * single = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"想");
        [subscriber sendNext:@"发送了一个信号"];//发送信号
        NSLog(@"你");
        //RACDisposable 手动移除订阅者
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"豆腐");
        }];
    }];
    //订阅信号
    NSLog(@"我");
    RACDisposable * disposable = [single subscribeNext:^(id x) {
        NSLog(@"吃");
        NSLog(@"信号的值：%@",x);
    }];
    //手动移除订阅
    [disposable dispose];
    
   
}
- (void)bindingData
{
  [[self.advanceView.textfiled.rac_textSignal filter:^BOOL(NSString * value) {
      return value.length>3 ?YES:NO;
  }]subscribeNext:^(NSString * x) {
      NSLog(@"内容:%@",x);
  }];
    
    [[[self.advanceView.textfiled.rac_textSignal filter:^BOOL(NSString* value) {
        return value.length>3?YES:NO;
    }]map:^id(NSString* value) {
        return value.length > 4?[UIColor redColor]:[UIColor cyanColor];
    }]subscribeNext:^(UIColor* value) {
        self.advanceView.textfiled.backgroundColor = value;
    }];
    
   
    
}
@end
