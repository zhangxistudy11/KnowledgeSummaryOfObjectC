//
//  MethodPacticeViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/3/20.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "MethodPacticeViewController.h"
#import <objc/runtime.h>
@interface MethodPacticeViewController ()

@end

@implementation MethodPacticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Runtime方法熟悉";
    
    [self test1];
}
#pragma mark - Test Methods
- (void)test1
{
    static unsigned int classCount;
    Class *classes = objc_copyClassList(&classCount);
    
    for (unsigned int i = 0; i < classCount; i++)
    {
        Class cls = classes[i];
       // NSLog(@"%@",cls);
    }
    free(classes);
}


@end
