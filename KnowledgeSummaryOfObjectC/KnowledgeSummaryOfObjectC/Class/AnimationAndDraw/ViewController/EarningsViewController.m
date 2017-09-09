//
//  EarningsViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/8.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "EarningsViewController.h"



@interface EarningsViewController ()

@end

@implementation EarningsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"收益折线渐变图";
    
   // [self test1];
   // [self test2];
   // [self test3];
    [self test4];
    [self test5];
}
- (void)test1
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10 , 100, self.view.width-20, 200)];
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:view];
    
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    
    gradLayer.frame = CGRectMake(0 , 0, view.width, view.height);
    
    gradLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradLayer.locations = @[@0,@0.88,@1.0];
    gradLayer.startPoint = CGPointMake(0, 0);
    gradLayer.endPoint = CGPointMake(0, 1);
    

    
    [view.layer addSublayer:gradLayer];
    
    
    UIBezierPath *shapeLayerPath = [[UIBezierPath alloc] init];
    // 点的坐标是相对于渐变层的
    CGFloat orginX = 0+10;
    CGFloat orginY = 10;
    CGFloat padding = 40;
    CGFloat height = view.height-20;
    CGPoint point1 = CGPointMake(orginX, orginY);
    CGPoint point2 = CGPointMake(orginX+padding, [self randomPointY]);
    CGPoint point3 = CGPointMake(orginX+2*padding, [self randomPointY]);
    CGPoint point4 = CGPointMake(orginX+3*padding, [self randomPointY]);
    CGPoint point5 = CGPointMake(orginX+4*padding, [self randomPointY]);
    CGPoint point6 = CGPointMake(orginX+5*padding, [self randomPointY]);
    CGPoint point7 = CGPointMake(orginX+6*padding, [self randomPointY]);
    CGPoint point8 = CGPointMake(orginX+6*padding, orginY+height);
    CGPoint point9 = CGPointMake(orginX, orginY+height);
    [shapeLayerPath moveToPoint:point1];
    [shapeLayerPath addLineToPoint:point2];
    [shapeLayerPath addLineToPoint:point3];
    [shapeLayerPath addLineToPoint:point4];
    [shapeLayerPath addLineToPoint:point5];
    [shapeLayerPath addLineToPoint:point6];
    [shapeLayerPath addLineToPoint:point7];
    [shapeLayerPath addLineToPoint:point8];
    [shapeLayerPath addLineToPoint:point9];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shapeLayerPath.CGPath;
    
    gradLayer.mask = shapeLayer;
    
    UIBezierPath *linePath = [[UIBezierPath alloc] init];
    // 点的坐标是相对于渐变层的
//    CGFloat orginX = 0+10;
//    CGFloat orginY = 10;
//    CGFloat padding = 40;
//    CGFloat height = view.height-20;
//    CGPoint point1 = CGPointMake(orginX, orginY);
//    CGPoint point2 = CGPointMake(orginX+padding, [self randomPointY]);
//    CGPoint point3 = CGPointMake(orginX+2*padding, [self randomPointY]);
//    CGPoint point4 = CGPointMake(orginX+3*padding, [self randomPointY]);
//    CGPoint point5 = CGPointMake(orginX+4*padding, [self randomPointY]);
//    CGPoint point6 = CGPointMake(orginX+5*padding, [self randomPointY]);
//    CGPoint point7 = CGPointMake(orginX+6*padding, [self randomPointY]);
//    CGPoint point8 = CGPointMake(orginX+6*padding, orginY+height);
//    CGPoint point9 = CGPointMake(orginX, orginY+height);
    [linePath moveToPoint:point1];
    [linePath addLineToPoint:point2];
    [linePath addLineToPoint:point3];
    [linePath addLineToPoint:point4];
    [linePath addLineToPoint:point5];
    [linePath addLineToPoint:point6];
    [linePath addLineToPoint:point7];
   
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    lineLayer.lineWidth = 1.5;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [view.layer addSublayer:lineLayer];
}
- (CGFloat)randomPointY
{
    return  (10 + arc4random() % 40);
}
- (void)test2
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 100 , CGRectGetMidY(self.view.frame) - 100, 200, 200)];
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:view];
    
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    
    gradLayer.frame = CGRectMake(100, 100, 100, 100);
    
    gradLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor];
    
    gradLayer.startPoint = CGPointMake(0, 1);
    gradLayer.endPoint = CGPointMake(1, 1);
    gradLayer.locations = @[@0.2,@0.5,@0.7];
    gradLayer.type = kCAGradientLayerAxial;
    
    [view.layer addSublayer:gradLayer];
    
    
    UIBezierPath *shapeLayerPath = [[UIBezierPath alloc] init];
    // 点的坐标是相对于渐变层的
    [shapeLayerPath moveToPoint:CGPointMake(0,100)];
    [shapeLayerPath addLineToPoint:CGPointMake(50, 50)];
    [shapeLayerPath addLineToPoint:CGPointMake(100, 100)];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shapeLayerPath.CGPath;
    
    
    gradLayer.mask = shapeLayer;
}
- (void)test3
{
    UIBezierPath * bezierPath = [[UIBezierPath alloc]init];
    CGFloat orginX = 20;
    CGFloat orginY = 150;
    CGFloat width  = 250;
    CGFloat padding = 20;
    CGFloat height = 90;
    CGPoint point1 = CGPointMake(orginX, orginY);
    CGPoint point2 = CGPointMake(orginX+padding, [self randomPointY]);
    CGPoint point3 = CGPointMake(orginX+2*padding, [self randomPointY]);
    CGPoint point4 = CGPointMake(orginX+3*padding, [self randomPointY]);
    CGPoint point5 = CGPointMake(orginX+4*padding, [self randomPointY]);
    CGPoint point6 = CGPointMake(orginX+5*padding, [self randomPointY]);
    CGPoint point7 = CGPointMake(orginX+6*padding, [self randomPointY]);
    CGPoint point8 = CGPointMake(orginX+6*padding, orginY+height);
    CGPoint point9 = CGPointMake(orginX, orginY+height);
    [bezierPath moveToPoint:point1];
    [bezierPath addLineToPoint:point2];
    [bezierPath addLineToPoint:point3];
    [bezierPath addLineToPoint:point4];
    [bezierPath addLineToPoint:point5];
    [bezierPath addLineToPoint:point6];
    [bezierPath addLineToPoint:point7];
    [bezierPath addLineToPoint:point8];
    [bezierPath addLineToPoint:point9];
    [bezierPath closePath];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = bezierPath.CGPath;
    shaplayer.strokeColor = [UIColor redColor].CGColor;
    shaplayer.fillColor = [UIColor blueColor].CGColor;
    shaplayer.lineWidth = 1.5;
    shaplayer.strokeStart = 0;
    shaplayer.strokeEnd = 0.3;
    
    
    
    CAGradientLayer * gradientLayer = [[CAGradientLayer alloc]init];
    gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    gradientLayer.locations = @[@0,@0.3,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = self.view.bounds;
    gradientLayer.mask = shaplayer;
    //   gradientLayer.type = kCAGradientLayerAxial;
    [self.view.layer addSublayer:gradientLayer];
    
    //  [self.view.layer addSublayer:shaplayer];
}
- (void)test4
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10 , 100, self.view.width-20, 200)];
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:view];
    
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    
    gradLayer.frame = CGRectMake(0 , 0, view.width, view.height);
    
    gradLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradLayer.locations = @[@0,@0.88,@1.0];
    gradLayer.startPoint = CGPointMake(0, 0);
    gradLayer.endPoint = CGPointMake(0, 1);
    
    
    
    [view.layer addSublayer:gradLayer];
    
    
    UIBezierPath *shapeLayerPath = [[UIBezierPath alloc] init];
    // 点的坐标是相对于渐变层的
    CGFloat orginX = 0+10;
    CGFloat orginY = 10;
    CGFloat padding = 40;
    CGFloat height = view.height-40;
    CGPoint point1 = CGPointMake(orginX, orginY);
    CGPoint point2 = CGPointMake(orginX+padding, [self randomPointY]);
    CGPoint point3 = CGPointMake(orginX+2*padding, [self randomPointY]);
    CGPoint point4 = CGPointMake(orginX+3*padding, [self randomPointY]);
    CGPoint point5 = CGPointMake(orginX+4*padding, [self randomPointY]);
    CGPoint point6 = CGPointMake(orginX+5*padding, [self randomPointY]);
    CGPoint point7 = CGPointMake(orginX+6*padding, [self randomPointY]);
    CGPoint point8 = CGPointMake(orginX+6*padding, orginY+height);
    CGPoint point9 = CGPointMake(orginX, orginY+height);
    [shapeLayerPath moveToPoint:point1];
    [shapeLayerPath addLineToPoint:point2];
    [shapeLayerPath addLineToPoint:point3];
    [shapeLayerPath addLineToPoint:point4];
    [shapeLayerPath addLineToPoint:point5];
    [shapeLayerPath addLineToPoint:point6];
    [shapeLayerPath addLineToPoint:point7];
    [shapeLayerPath addLineToPoint:point8];
    [shapeLayerPath addLineToPoint:point9];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shapeLayerPath.CGPath;
    
    gradLayer.mask = shapeLayer;
    
    UIBezierPath *linePath = [[UIBezierPath alloc] init];

    [linePath moveToPoint:point1];
    [linePath addLineToPoint:point2];
    [linePath addLineToPoint:point3];
    [linePath addLineToPoint:point4];
    [linePath addLineToPoint:point5];
    [linePath addLineToPoint:point6];
    [linePath addLineToPoint:point7];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    lineLayer.lineWidth = 1.5;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [view.layer addSublayer:lineLayer];
    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = 1.5f;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
    //checkAnimation.delegate = self;
    [lineLayer addAnimation:checkAnimation forKey:@"checkAnimation"];
    
}

- (void)test5
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10 , 400, self.view.width-20, 200)];
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:view];
    
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    
    gradLayer.frame = CGRectMake(0 , 0, view.width, view.height);
    
    gradLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradLayer.locations = @[@0,@0.88,@1.0];
    gradLayer.startPoint = CGPointMake(0, 0);
    gradLayer.endPoint = CGPointMake(0, 1);
    
    
    
    [view.layer addSublayer:gradLayer];
    
    
    UIBezierPath *shapeLayerPath = [[UIBezierPath alloc] init];
    // 点的坐标是相对于渐变层的
    CGFloat orginX = 0+10;
    CGFloat orginY = 10;
    CGFloat padding = 40;
    CGFloat height = view.height-40;
    CGPoint point1 = CGPointMake(orginX, orginY);
    CGPoint point2 = CGPointMake(orginX+padding, [self randomPointY]);
    CGPoint point3 = CGPointMake(orginX+2*padding, [self randomPointY]);
    CGPoint point4 = CGPointMake(orginX+3*padding, [self randomPointY]);
    CGPoint point5 = CGPointMake(orginX+4*padding, [self randomPointY]);
    CGPoint point6 = CGPointMake(orginX+5*padding, [self randomPointY]);
    CGPoint point7 = CGPointMake(orginX+6*padding, [self randomPointY]);
    CGPoint point8 = CGPointMake(orginX+6*padding, orginY+height);
    CGPoint point9 = CGPointMake(orginX, orginY+height);
    [shapeLayerPath moveToPoint:point1];
    [shapeLayerPath addLineToPoint:point2];
    [shapeLayerPath addLineToPoint:point3];
    [shapeLayerPath addLineToPoint:point4];
    [shapeLayerPath addLineToPoint:point5];
    [shapeLayerPath addLineToPoint:point6];
    [shapeLayerPath addLineToPoint:point7];
    [shapeLayerPath addLineToPoint:point8];
    [shapeLayerPath addLineToPoint:point9];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shapeLayerPath.CGPath;
    
    gradLayer.mask = shapeLayer;
    
    UIBezierPath *linePath = [[UIBezierPath alloc] init];
    
    [linePath moveToPoint:point1];
    [linePath addLineToPoint:point2];
    [linePath addLineToPoint:point3];
    [linePath addLineToPoint:point4];
    [linePath addLineToPoint:point5];
    [linePath addLineToPoint:point6];
    [linePath addLineToPoint:point7];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    lineLayer.lineWidth = 1.5;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [view.layer addSublayer:lineLayer];
    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = 1.5f;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
 checkAnimation.fillMode = kCAFillModeBackwards;
   // checkAnimation.beginTime = 12;
    checkAnimation.beginTime = CACurrentMediaTime() + 0.9;
    //checkAnimation.delegate = self;
    [lineLayer addAnimation:checkAnimation forKey:@"checkAnimation"];
    
    
    
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    transformAnima.duration = 0.8;
    transformAnima.fromValue = [NSNumber numberWithFloat:0.1];
    transformAnima.toValue = [NSNumber numberWithFloat:1.0];;
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  //  transformAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
    transformAnima.removedOnCompletion = NO;
    transformAnima.fillMode = kCAFillModeForwards;
    
    [gradLayer addAnimation:transformAnima forKey:@"AnimationMoveY"];
}
@end
