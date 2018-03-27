//
//  JavaScriptStuViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/3/19.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "JavaScriptStuViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface JavaScriptStuViewController ()

@property (nonatomic,strong) JSContext *context;

@end

@implementation JavaScriptStuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"JavaScriptCore代码熟悉";
    [self test1];
    [self test2];
}

#pragma mark - Test Methods
- (void)test1
{
    /*
    OC 调用  JS
     创建一个JSContext对象，然后将JS代码加载到context里面，最后取到这个函数对象，调用callWithArguments这个方法进行参数传值。（JS里面函数也是对象）
     */
    self.context = [[JSContext alloc] init];
    
    NSString *js = @"function add(a,b) {return a+b}";
    
    [self.context evaluateScript:js];
    
    JSValue *n = [self.context[@"add"] callWithArguments:@[@2, @3]];
    
    NSLog(@"---%@", @([n toInt32]));//---5
    
   
}

- (void)test2
{
    /*
     JavaScript -> Objective-C
     我们定义一个block，然后保存到context里面，其实就是转换成了JS的function。然后我们直接执行这个function，调用的就是我们的block里面的内容了
     */
    self.context = [[JSContext alloc] init];
    
    self.context[@"add"] = ^(NSInteger a, NSInteger b) {
        NSLog(@"---%@", @(a + b));
    };
    
    [self.context evaluateScript:@"add(2,3)"];
    
   
}

@end
