//
//  ExceptionController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/3.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ExceptionController.h"

@interface ExceptionController ()

@end

@implementation ExceptionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"异常处理";
    [self testOne];
}
- (void)testOne{
    @try {
        NSString *bva = nil;

           NSDictionary *oneDict = @{@"aaa":@"avalue",@"bb":bva};
         NSLog(@"%@",oneDict);
    } @catch (NSException *exception) {
        NSLog(@"异常%@",exception);
    } @finally {
        NSLog(@"end");
    }
 
}


@end
