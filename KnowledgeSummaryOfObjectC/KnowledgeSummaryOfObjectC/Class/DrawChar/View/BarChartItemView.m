//
//  BarChartItemView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/28.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BarChartItemView.h"

#define BarItem_Width 12
#define OrginY (175/2)

@implementation BarChartItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        NSLog(@"aa");
//        [self drawItemView];
    }
    return self;
}
- (void)drawItemView
{
    CGPoint point1 = CGPointMake(0, OrginY);
    CGPoint point2 = CGPointMake(BarItem_Width, OrginY);
    CGPoint point3 = CGPointMake(BarItem_Width, self.barHeight);
    CGPoint point4 = CGPointMake(0, self.barHeight);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path closePath];
    
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.fillColor =  self.barColor.CGColor;
    
    [self.layer addSublayer:shaplayer];
    
    
}
#pragma mark - Public Methods
/**
 重新绘制
 */
- (void)drawContent
{
    [self removeAllLayer];
    [self.layer addSublayer:[self barShapeLayer]];
    
}
- (CAShapeLayer *)barShapeLayer
{
    
    CGPoint point1 = CGPointMake(0, OrginY);
    CGPoint point2 = CGPointMake(BarItem_Width, OrginY);
    CGPoint point3 = CGPointMake(BarItem_Width, self.barHeight);
    CGPoint point4 = CGPointMake(0, self.barHeight);
    int aa = self.barHeight;
    NSLog(@"%d",aa);
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path closePath];
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor =  self.barColor.CGColor;
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
