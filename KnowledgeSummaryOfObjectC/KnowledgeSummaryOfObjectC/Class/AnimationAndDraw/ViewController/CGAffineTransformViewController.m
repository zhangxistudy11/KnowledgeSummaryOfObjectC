//
//  CGAffineTransformViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/1.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "CGAffineTransformViewController.h"

@interface CGAffineTransformViewController ()
@property (nonatomic,strong) UIButton *redBtn;
@property (nonatomic,strong) UIButton * greenBtn;
@property (nonatomic,strong) UIButton *redBtn1;
@property (nonatomic,strong) UIButton * greenBtn1;
@property (nonatomic,strong) UIButton *redBtn2;
@property (nonatomic,strong) UIButton * greenBtn2;
@property (nonatomic,strong) UIImageView *arrowIma;
@end

@implementation CGAffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = @"仿射变换";
    [self.view addSubview:self.redBtn];
    [self.view addSubview:self.greenBtn];
    [self.view addSubview:self.redBtn1];
    [self.view addSubview:self.greenBtn1];
    [self.view addSubview:self.redBtn2];
    [self.view addSubview:self.greenBtn2];
    [self.view addSubview:self.arrowIma];
}

#pragma mark - Getter Methods
- (UIButton *)redBtn
{
    if (!_redBtn) {
        _redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _redBtn.frame = CGRectMake(50, 80, 100, 40);
        _redBtn.backgroundColor = [UIColor redColor];
        [_redBtn setTitle:@"测试一" forState:UIControlStateNormal];
        [_redBtn addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redBtn;
}

- (UIButton *)greenBtn
{
    if (!_greenBtn) {
        _greenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _greenBtn.backgroundColor = [UIColor greenColor];
          _greenBtn.frame = CGRectMake(200, 80, 100, 40);
        [_greenBtn setTitle:@"测试二" forState:UIControlStateNormal];
        [_greenBtn addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
    }
    return _greenBtn;
}
- (UIButton *)redBtn1
{
    if (!_redBtn1) {
        _redBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _redBtn1.frame = CGRectMake(50, 130, 100, 40);
        _redBtn1.backgroundColor = [UIColor redColor];
        [_redBtn1 setTitle:@"测试三" forState:UIControlStateNormal];
        [_redBtn1 addTarget:self action:@selector(test3) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redBtn1;
}

- (UIButton *)greenBtn1
{
    if (!_greenBtn1) {
        _greenBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _greenBtn1.backgroundColor = [UIColor greenColor];
        _greenBtn1.frame = CGRectMake(200, 130, 100, 40);
        [_greenBtn1 setTitle:@"测试四" forState:UIControlStateNormal];
        [_greenBtn1 addTarget:self action:@selector(test4) forControlEvents:UIControlEventTouchUpInside];
    }
    return _greenBtn1;
}
- (UIButton *)redBtn2
{
    if (!_redBtn2) {
        _redBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _redBtn2.frame = CGRectMake(50, 180, 100, 40);
        _redBtn2.backgroundColor = [UIColor redColor];
        [_redBtn2 setTitle:@"测试五" forState:UIControlStateNormal];
        [_redBtn2 addTarget:self action:@selector(test5) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redBtn2;
}

- (UIButton *)greenBtn2
{
    if (!_greenBtn2) {
        _greenBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _greenBtn2.backgroundColor = [UIColor greenColor];
        _greenBtn2.frame = CGRectMake(200, 180, 100, 40);
        [_greenBtn2 setTitle:@"测试六" forState:UIControlStateNormal];
        [_greenBtn2 addTarget:self action:@selector(test6) forControlEvents:UIControlEventTouchUpInside];
    }
    return _greenBtn2;
}
- (UIImageView *)arrowIma
{
    if (!_arrowIma) {
        _arrowIma = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 30, 30)];
        _arrowIma.image = [UIImage imageNamed:@"ic_xiala_black_big"];
    }
    return _arrowIma;
}
#pragma mark - Target Methods
- (void)test1
{
  //  self.arrowIma.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.5 animations:^{
      self.arrowIma.transform = CGAffineTransformMakeRotation(-(179.99*M_PI)/180);
        //self.arrowIma.transform = CGAffineTransformMakeTranslation(20, 20);
    }];
}
- (void)test2
{
    [UIView animateWithDuration:1.5 animations:^{
       // self.arrowIma.transform = CGAffineTransformIdentity;
       // self.arrowIma.transform = CGAffineTransformMakeRotation(M_PI);
        self.arrowIma.transform = CGAffineTransformRotate(self.arrowIma.transform, M_PI);
    //self.arrowIma.transform = CGAffineTransformTranslate(self.arrowIma.transform , 20, 20);
        
    }];
    //self.arrowIma.transform = CGAffineTransformMakeRotation(-2*M_PI);
   // self.arrowIma.transform = CGAffineTransformMakeTranslation(100, 100);
    
}
- (void)test3
{
    NSLog(@"1::%@",NSStringFromCGRect(self.arrowIma.frame));
    self.arrowIma.transform = CGAffineTransformMakeTranslation(0, 100);
    NSLog(@"2::%@",NSStringFromCGRect(self.arrowIma.frame));
   
}
- (void)test4
{
    NSLog(@"3::%@",NSStringFromCGRect(self.arrowIma.frame));
    self.arrowIma.transform = CGAffineTransformIdentity;
    NSLog(@"4::%@",NSStringFromCGRect(self.arrowIma.frame));
}
- (void)test5
{
    NSLog(@"5::%@",NSStringFromCGRect(self.arrowIma.frame));
    self.arrowIma.transform = CGAffineTransformMakeTranslation(0, 30);
    NSLog(@"6::%@",NSStringFromCGRect(self.arrowIma.frame));
    
}
- (void)test6
{
    NSLog(@"7::%@",NSStringFromCGRect(self.arrowIma.frame));
    self.arrowIma.transform = CGAffineTransformTranslate(self.arrowIma.transform, 0, -30); ;
    NSLog(@"8::%@",NSStringFromCGRect(self.arrowIma.frame));
}
@end
