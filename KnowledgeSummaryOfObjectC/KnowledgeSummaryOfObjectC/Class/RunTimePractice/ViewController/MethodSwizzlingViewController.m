//
//  MethodSwizzlingViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/6/10.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "MethodSwizzlingViewController.h"
#import "NSArray+Safe.h"
@interface MethodSwizzlingViewController ()

@end

@implementation MethodSwizzlingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"MethodSwizzling使用";
    [self testArrayCrash];
}
- (void)testArrayCrash
{
    NSArray *arr = @[@"22",@"33"];
    NSString *temp = [arr objectAtIndex:5];
}






@end
