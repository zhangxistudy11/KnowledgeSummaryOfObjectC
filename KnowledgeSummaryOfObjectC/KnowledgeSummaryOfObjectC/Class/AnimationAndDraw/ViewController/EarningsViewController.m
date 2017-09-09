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
    
 
    [self test1];
    [self test2];
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

- (void)test2
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
  
    checkAnimation.beginTime = CACurrentMediaTime() + 0.9;
    
    [lineLayer addAnimation:checkAnimation forKey:@"checkAnimation"];
    
    
    
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    transformAnima.duration = 0.8;
    transformAnima.fromValue = [NSNumber numberWithFloat:0.1];
    transformAnima.toValue = [NSNumber numberWithFloat:1.0];;
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    transformAnima.removedOnCompletion = NO;
    transformAnima.fillMode = kCAFillModeForwards;
    
    [gradLayer addAnimation:transformAnima forKey:@"AnimationMoveY"];
}
- (CGFloat)randomPointY
{
    return  (10 + arc4random() % 40);
}
@end
