//
//  CoverViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/5/30.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "CoverViewController.h"

@interface CoverViewController ()

@end

@implementation CoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"遮罩图形";
    [self setUpView1];
    [self setUpView2];
    [self setUpView3];
    [self setUpView4];
    [self setUpView5];

}
- (void)setUpView1
{
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 50)];
    redView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:redView];
    
    CAShapeLayer* cropLayer = [[CAShapeLayer alloc] init];
    [redView.layer addSublayer:cropLayer];
    // 创建一个绘制路径
    CGMutablePathRef path =CGPathCreateMutable();
    // 空心矩形的rect
    CGRect cropRect = CGRectMake(5, 5, 69, 30);
    // 绘制rect
    CGPathAddRect(path, nil, redView.bounds);
    CGPathAddRect(path, nil, cropRect);
    // 设置填充规则(重点)
    [cropLayer setFillRule:kCAFillRuleEvenOdd];
    // 关联绘制的path
    [cropLayer setPath:path];
    // 设置填充的颜色
    [cropLayer setFillColor:[[UIColor redColor] CGColor]];

}
- (void)setUpView2
{
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 100, 40)];
    redView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:redView];
    
    CAShapeLayer* cropLayer = [[CAShapeLayer alloc] init];
    [redView.layer addSublayer:cropLayer];
    // 创建一个绘制路径
    CGMutablePathRef path =CGPathCreateMutable();
    // 空心矩形的rect
    CGRect cropRect = CGRectMake(5, 5, 69, 30);
    // 绘制rect
    CGPathAddRect(path, nil, redView.bounds);
   // CGPathAddRect(path, nil, cropRect);
    CGPathAddArc(path, NULL, 100, 20, 10, 0.5*M_PI, 1.5*M_PI, NO);
    // 设置填充规则(重点)
    [cropLayer setFillRule:kCAFillRuleNonZero];
    // 关联绘制的path
    [cropLayer setPath:path];
    // 设置填充的颜色
    [cropLayer setFillColor:[[UIColor redColor] CGColor]];
}
- (void)setUpView3
{
    CGFloat padding = 60;
    CGFloat width = 100;
    CGFloat orginY = 300;
    CGFloat height = 80;
    CGPoint point1 = CGPointMake(padding, orginY);
    CGPoint point2 = CGPointMake(padding, orginY+height);
    CGPoint point3 = CGPointMake(padding+width, orginY+height);
    CGPoint point4 = CGPointMake(padding+width, orginY);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
//    [path closePath];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
  //  shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor greenColor].CGColor;
    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];
    
}
- (void)setUpView4{
    //创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 添加圆到path
    [path addArcWithCenter:CGPointMake(200, 340) radius:20 startAngle:0.5*M_PI endAngle:M_PI*1.5 clockwise:YES];

    
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.fillColor = [UIColor greenColor].CGColor;
    
    [self.view.layer addSublayer:shaplayer];
}
- (void)setUpView5
{
    CGFloat padding = 60;
    CGFloat width = 100;
    CGFloat orginY = 500;
    CGFloat height = 80;
    CGFloat radius =20;
    CGPoint point1 = CGPointMake(padding, orginY);
    CGPoint point2 = CGPointMake(padding, orginY+height);
    CGPoint point3 = CGPointMake(padding+width, orginY+height);
    CGPoint point4 = CGPointMake(padding+width, orginY+height/2+radius);
    
    CGPoint point5 = CGPointMake(padding+width, orginY+height/2-radius);

    CGPoint point6 = CGPointMake(padding+width, orginY);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
   
    
    [path addArcWithCenter:CGPointMake(padding+width, orginY+height/2) radius:20 startAngle:0.5*M_PI endAngle:M_PI*1.5 clockwise:YES];
    [path addLineToPoint:point4];
     [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    //    [path closePath];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    //  shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor greenColor].CGColor;
//    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];
}
@end
