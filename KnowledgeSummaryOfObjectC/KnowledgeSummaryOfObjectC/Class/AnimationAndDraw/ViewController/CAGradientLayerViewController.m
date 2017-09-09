//
//  CAGradientLayerViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/7.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@property (nonatomic,strong) CAShapeLayer * shapeLayer;
@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"渐变图形";
    
    [self drawRectangle];
    [self drawCircle];
    
}
- (void)drawRectangle
{
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 180, 280)];
    [self.view addSubview:backView];
    CAGradientLayer * gradientLayer = [[CAGradientLayer alloc]init];
    gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradientLayer.locations = @[@0,@0.3,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = backView.bounds;
    [backView.layer addSublayer:gradientLayer];
}
- (void)drawCircle
{
   /*
                       以CAShapeLayer作为layer的mask属性
                       
                       CALayer的mask属性可以作为遮罩让layer显示mask遮住(非透明)的部分；CAShapeLayer为CALayer的子类，通过path属性可以生成不同的形状，将CAShapeLayer对象用作layer的mask属性的话，就可以生成不同形状的图层。故生成颜色渐变有以下几个步骤：
                       
                       生成一个imageView(也可以为layer)，image的属性为颜色渐变的图片
                       生成一个CAShapeLayer对象，根据path属性指定所需的形状
                       将CAShapeLayer对象赋值给imageView的mask属性
                       */
    CGPoint center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2+70);
    CGFloat radius = 50;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:- M_PI_2 endAngle: (M_PI * 2)- M_PI_2 clockwise:YES];
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.lineWidth = 2.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    self.shapeLayer.lineCap =  kCALineCapRound;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.lineDashPhase = 10;
    self.shapeLayer.lineDashPattern = @[[NSNumber numberWithFloat:1.2],[NSNumber numberWithFloat:3.0]];
    self.shapeLayer.path = path.CGPath;
    
    CALayer *gradientLayer = [CALayer layer];
    
    // 左侧渐变
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width/2, self.view.bounds.size.height);
    leftLayer.locations = @[@0.3, @0.9, @1.0];
    leftLayer.colors = @[ (id)[UIColor redColor].CGColor, (id)[UIColor yellowColor].CGColor];
    [gradientLayer addSublayer:leftLayer];
    
    
    // 右侧渐变
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(self.view.bounds.size.width/2, 0, self.view.bounds.size.width/2, self.view.bounds.size.height);
    rightLayer.locations = @[@0.3, @0.9, @1.0];
    rightLayer.colors =  @[(id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor];
    [gradientLayer addSublayer:rightLayer];
    // 使用 bigShapeLayer 来截取 渐变层
    // gradientLayer.mask = self.bigShapeLayer;
    gradientLayer.mask = self.shapeLayer;
    //    gradientLayer.masksToBounds = YES;
    
    [self.view.layer addSublayer:gradientLayer];

}
@end
