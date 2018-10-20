//
//  MemoryLeakViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/10/20.
//  Copyright © 2018 张玺. All rights reserved.
//

#import "MemoryLeakViewController.h"
#import "MemoryTestView.h"

#define WEAK_SELF __weak typeof(self)weakSelf = self

@interface MemoryLeakViewController ()

@end

@implementation MemoryLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"内存泄漏";
    
    MemoryTestView *leakView= [[MemoryTestView alloc]init];
    [self.view addSubview:leakView];
    [leakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(100);
        make.width.height.mas_equalTo(200);
    }];
    WEAK_SELF;
    leakView.clickBlock = ^{
        [weakSelf testLog];
    };
}
- (void)testLog
{
    NSLog(@"gogogo");
}
- (void)dealloc
{
    NSLog(@"内存释放");
}
@end
