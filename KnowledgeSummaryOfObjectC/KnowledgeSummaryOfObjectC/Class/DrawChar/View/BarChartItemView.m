//
//  BarChartItemView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/28.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BarChartItemView.h"

#define BarItem_Width 12
#define OrginY 87.5

@implementation BarChartItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
/*
- (void)drawItemView
{
    CGPoint point1 = CGPointMake(0, OrginY);
    CGPoint point2 = CGPointMake(BarItem_Width, OrginY);
    CGPoint point3 = CGPointMake(BarItem_Width, self.barHeight);
    CGPoint point4 = CGPointMake(0, self.barHeight);
    CGPoint point5 = CGPointMake(BarItem_Width/(float)2, self.barHeight-10);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
 //   [path closePath];
    [path addQuadCurveToPoint:point1 controlPoint:point5];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.fillColor =  self.barColor.CGColor;
    
    [self.layer addSublayer:shaplayer];
}
 */
#pragma mark - Public Methods
/**
 重新绘制
 */
- (void)drawContent
{
    [self removeAllLayer];
    
//[self.layer addSublayer:[self barShapeLayer]];
   // self.clipsToBounds = YES;
    
    [self addChangeColor];
    
    
    
}
- (void)addChangeColor
{
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    
    gradLayer.frame = CGRectMake(0 , self.barHeight-15, BarItem_Width,87.5-(self.barHeight-15));
    
    gradLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradLayer.locations = @[@0,@0.88,@1.0];
    gradLayer.startPoint = CGPointMake(0, 0);
    gradLayer.endPoint = CGPointMake(0, 1);
    
    
    CGPoint point1 = CGPointMake(0, OrginY);
    CGPoint point2 = CGPointMake(BarItem_Width, OrginY);
    CGPoint point3 = CGPointMake(BarItem_Width, self.barHeight);
    CGPoint point4 = CGPointMake(0, self.barHeight);
    CGPoint point5 = CGPointMake(BarItem_Width/(float)2, self.barHeight-15);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    
    
    
    // [path addLineToPoint:point5];
    [path moveToPoint:point4];
    [path addLineToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    
    // [path closePath];
    [path addQuadCurveToPoint:point4 controlPoint:point5];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    //layer.fillColor =  [UIColor clearColor].CGColor;
    gradLayer.mask = layer;
    [self.layer addSublayer:gradLayer];
    
}
- (CAShapeLayer *)barShapeLayer
{
    
    CGPoint point1 = CGPointMake(0, OrginY);
    CGPoint point2 = CGPointMake(BarItem_Width, OrginY);
    CGPoint point3 = CGPointMake(BarItem_Width, self.barHeight);
    CGPoint point4 = CGPointMake(0, self.barHeight);
    CGPoint point5 = CGPointMake(BarItem_Width/(float)2, self.barHeight-15);

    
    
    
    
    
   // [self.layer addSublayer:gradLayer];
    
    
    int aa = self.barHeight;
    NSLog(@"%d",aa);
    UIBezierPath * path = [[UIBezierPath alloc]init];
   
    
    
   // [path addLineToPoint:point5];
    [path moveToPoint:point4];
     [path addLineToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    
   // [path closePath];
    [path addQuadCurveToPoint:point4 controlPoint:point5];

    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
     layer.fillColor =  [UIColor clearColor].CGColor;
    
    

    
    return layer;
    
   
}
#pragma mark - Private Methods
- (void)removeAllLayer
{
    NSArray * sublayers = [NSArray arrayWithArray:self.layer.sublayers];
    for (CALayer * layer in sublayers) {
        [layer removeAllAnimations];
        [layer removeFromSuperlayer];
    }
}
//- (void)drawRect:(CGRect)rect
//{
//     NSLog(@"bb");
//    self.backgroundColor = self.backColor;
//}
//- (void)setHeight:(float)Height
//{
//    _Height = Height;
//
//}
//
//- (void)setBackColor:(UIColor *)backColor
//{
//    _backColor = backColor;
//     NSLog(@"cc");
//}
@end
