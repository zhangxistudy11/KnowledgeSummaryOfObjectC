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
@property (nonatomic,strong) UIImageView *arrowIma;
@end

@implementation CGAffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = @"仿射变换";
    [self.view addSubview:self.redBtn];
    [self.view addSubview:self.greenBtn];
    [self.view addSubview:self.arrowIma];
}

#pragma mark - Getter Methods
- (UIButton *)redBtn
{
    if (!_redBtn) {
        _redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _redBtn.frame = CGRectMake(50, 100, 100, 40);
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
          _greenBtn.frame = CGRectMake(200, 100, 100, 40);
        [_greenBtn setTitle:@"测试二" forState:UIControlStateNormal];
        [_greenBtn addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
    }
    return _greenBtn;
}

- (UIImageView *)arrowIma
{
    if (!_arrowIma) {
        _arrowIma = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
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
@end
