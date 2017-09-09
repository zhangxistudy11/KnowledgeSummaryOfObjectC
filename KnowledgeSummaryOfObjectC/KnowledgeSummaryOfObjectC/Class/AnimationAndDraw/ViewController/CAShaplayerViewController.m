//
//  CAShaplayerViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/6.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "CAShaplayerViewController.h"

@interface CAShaplayerViewController ()

@end

@implementation CAShaplayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CAShaplayer";
    
    [self drawCurve];
    [self drawTwo];
    [self drawThree];
    [self drawFour];
}

#pragma mark - Private Methods
- (void)drawCurve
{
    UIBezierPath * path = [[UIBezierPath alloc]init];
    CGPoint point1 = CGPointMake(10, 100);
    CGPoint point2 = CGPointMake(50, 50);
    CGPoint point3 = CGPointMake(170, 200);
    CGPoint point4 = CGPointMake(200, 100);
    [path moveToPoint:point1];
    [path addCurveToPoint:point4 controlPoint1:point2 controlPoint2:point3];
    
    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc]init];
    [self.view.layer addSublayer:shapeLayer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 3.0;
}
- (void)drawTwo
{
    CGFloat padding = 60;
    CGFloat width = (self.view.frame.size.width - 2* padding);
    CGFloat orginY = 220;
    CGFloat height = 120;
    CGPoint point1 = CGPointMake(padding, orginY);
    CGPoint point2 = CGPointMake(padding, orginY+height);
    CGPoint point3 = CGPointMake(padding+width, orginY+height);
    CGPoint point4 = CGPointMake(padding+width, orginY);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path closePath];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor clearColor].CGColor;
    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];
}
- (void)drawThree
{
    CGFloat padding = 60;
    CGFloat width = (self.view.frame.size.width - 2* padding);
    CGFloat orginY = 420;
    CGFloat height = 120;
    CGPoint point1 = CGPointMake(padding, orginY);
    CGPoint point2 = CGPointMake(padding, orginY+height);
    CGPoint point3 = CGPointMake(padding+width, orginY+height);
    CGPoint point4 = CGPointMake(padding+width, orginY);
    
    CGPoint point5 = CGPointMake(padding+width/(float)2, orginY-150);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
   // [path closePath];
    [path addQuadCurveToPoint:point1 controlPoint:point5];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    //shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor greenColor].CGColor;
//    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];

}
- (void)drawFour
{
    CGFloat padding = 60;
    CGFloat width = (self.view.frame.size.width - 2* padding);
    CGFloat orginY = 560;
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
    [path closePath];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor clearColor].CGColor;
    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];
    shaplayer.lineDashPattern = @[@6,@7];
}
@end
