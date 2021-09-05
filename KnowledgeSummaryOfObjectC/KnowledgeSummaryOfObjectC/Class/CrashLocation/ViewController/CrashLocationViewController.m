//
//  CrashLocationViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/10.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "CrashLocationViewController.h"

@interface CrashLocationViewController ()

@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation CrashLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self test1];
//    [self test2];
    
//    [self test3];
//    [self test4];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self invalidateTimer];
}
/**
 数组越界
 */
- (void)test1
{
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"li",@"ff",@"eee" ,nil];
    [array removeObjectAtIndex:5];
}
- (void)test2
{
    [self startTimer];
}
- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(logName) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}
- (void)logName
{
    NSLog(@"计时器");
}
- (void)invalidateTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
//- (void)dealloc
//{
//    [self invalidateTimer];
//}
//字典空值
- (void)test3 {
    //key 和 value 都不能空
    NSString * key = nil;
    NSString * value = @"aa";
    NSDictionary *dict = @{key:value};
    NSLog(@"%@",dict);
//    NSLog(@"%@",dict[key]);

}
- (void)test4 {
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(40, 10, 300, 50)];
    [self.navigationController.navigationBar  addSubview:self.searchBar];
}
@end
