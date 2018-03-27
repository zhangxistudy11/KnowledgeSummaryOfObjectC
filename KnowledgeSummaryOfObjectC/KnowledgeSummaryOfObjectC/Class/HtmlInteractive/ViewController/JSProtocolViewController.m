//
//  JSProtocolViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/3/19.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "JSProtocolViewController.h"
#import "JSProtocolObj.h"
@interface JSProtocolViewController ()
@property (nonatomic, strong) JSProtocolObj *obj;
@property (nonatomic, strong) JSContext *context;
@end

@implementation JSProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"JS调原生";
    
    [self test1];
}

#pragma mark - Test Methods
- (void)test1
{
    self.context = [[JSContext alloc] init];
    //设置异常处理
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        [JSContext currentContext].exception = exception;
        NSLog(@"exception:%@",exception);
    };
    //将obj添加到context中
    self.obj = [[JSProtocolObj alloc]init];
    self.context[@"obj"] = self.obj;
   JSValue *value = [self.context evaluateScript:@"obj.whatYouName()"];
   
    NSLog(@"result:%@",[value toString]);
   
}




@end
