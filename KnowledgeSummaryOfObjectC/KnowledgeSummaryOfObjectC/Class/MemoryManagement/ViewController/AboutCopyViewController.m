//
//  AboutCopyViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/1.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "AboutCopyViewController.h"

@interface AboutCopyViewController ()

@property (nonatomic,copy) NSMutableArray * copydMutableArray;

@property (nonatomic,strong) NSMutableArray * strongMutableArray;

@property (nonatomic,copy) NSArray * copydArray;

@property (nonatomic,strong) NSArray * strongArray;

@end

@implementation AboutCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"深拷贝与浅拷贝";
    /**浅拷贝与深拷贝*/
    [self testString];
    [self testArray];
    [self testMutableString];
    [self testMutableArray];
   
    /**copy与strong*/
    
    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:firstBtn];
    firstBtn.backgroundColor = [UIColor blueColor];
    firstBtn.frame = CGRectMake(100, 100, 200, 50);
    [firstBtn setTitle:@"直接赋值测试" forState:UIControlStateNormal];
    [firstBtn addTarget:self action:@selector(testAssignment) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:twoBtn];
    twoBtn.backgroundColor = [UIColor blueColor];
    twoBtn.frame = CGRectMake(100, 200, 200, 50);
    [twoBtn setTitle:@"可变数组测试" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(testimmutableArray) forControlEvents:UIControlEventTouchUpInside];
}

- (void)testString
{
    NSLog(@"非集合不可变类型进行Copy与MutableCopy");
   NSString * orginStr = @"原始数据";
   NSString * copyStr = [orginStr copy];
   NSMutableString * mutableStr = [orginStr mutableCopy];
   NSLog(@"内存地址-->orginStr:%p  copyStr:%p  mutableStr:%p",orginStr,copyStr,mutableStr);
   NSLog(@"内容orginStr:%@  copyStr:%@  mutableStr:%@",orginStr,copyStr,mutableStr);
}
- (void)testArray
{
    NSLog(@"集合不可变类型进行Copy与MutableCopy");
    NSArray * orginArray = [NSArray arrayWithObjects:@"小红",@"小明",@"小李",nil];
    NSArray * copyArray = [orginArray copy];
    NSMutableArray * mutableCopyArray = [orginArray mutableCopy];
    NSLog(@"内存地址-->orginArray:%p  copyArray:%p  mutableCopyArray:%p",orginArray,copyArray,mutableCopyArray);
    // NSLog(@"内容orginArray:%@  copyArray:%@  mutableCopyArray:%@",orginArray,copyArray,mutableCopyArray);
}
- (void)testMutableString
{
    NSLog(@"非集合可变类型进行Copy与MutableCopy");
    NSMutableString * orginStr = [[NSMutableString alloc]initWithString:@"原始数据"];
    NSString * copyStr = [orginStr copy];
    NSMutableString * mutableStr = [orginStr mutableCopy];
    NSLog(@"内存地址-->orginStr:%p  copyStr:%p  mutableStr:%p",orginStr,copyStr,mutableStr);
    NSLog(@"内容orginStr:%@  copyStr:%@  mutableStr:%@",orginStr,copyStr,mutableStr);
}

- (void)testMutableArray
{
    NSLog(@"集合可变类型进行Copy与MutableCopy");
    NSArray * orginArray = [NSMutableArray arrayWithObjects:@"小红",@"小明",@"小李", nil];
    
    NSArray * copyArray = [orginArray copy];
    NSMutableArray * mutableCopyArray = [orginArray mutableCopy];
    NSLog(@"内存地址-->orginArray:%p  copyArray:%p  mutableCopyArray:%p",orginArray,copyArray,mutableCopyArray);
}


- (void)testAssignment
{
    NSLog(@"NSMutableArray的修饰词测试");
    NSMutableArray * orginMutableArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    self.copydMutableArray = orginMutableArray;
    self.strongMutableArray = orginMutableArray;
    NSLog(@"内存地址-->orginMutableArray:%p  self.copydMutableArray:%p  self.strongMutableArray:%p",orginMutableArray,self.copydMutableArray,self.strongMutableArray);
    
    [self.strongMutableArray removeLastObject];
    /**
      这里会出现闪退
      [self.copydMutableArray removeLastObject];
     */
   
}
- (void)testimmutableArray
{
    NSLog(@"NSArray的修饰词测试");
    NSMutableArray * orginMutableArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    self.copydArray = orginMutableArray;
    self.strongArray = orginMutableArray;
    NSLog(@"内存地址-->orginMutableArray:%p  self.copydArray:%p  self.strongMutableArray:%p",orginMutableArray,self.copydArray,self.strongArray );
     NSLog(@"内容-->orginMutableArray:%@  self.copydArray:%@  self.strongMutableArray:%@",orginMutableArray,self.copydArray,self.strongArray );
    
    [orginMutableArray removeLastObject];
    NSLog(@"删除一个元素后内容-->orginMutableArray:%@  self.copydArray:%@  self.strongMutableArray:%@",orginMutableArray,self.copydArray,self.strongArray );
  
}
@end
