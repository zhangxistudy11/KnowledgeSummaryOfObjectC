//
//  UIBezierPathCustomView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/6.
//  Copyright © 2017年 张玺. All rights reserved.
//



#import "UIBezierPathCustomView.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height
#define kLineW ScreenWidth-10*2
#define kMargin 10

@implementation UIBezierPathCustomView

- (void)drawRect:(CGRect)rect
{
    //由于UIBezierPath绘制出来的是矢量图形(即layer路径)并不能真正的展示出来,因此,想让它显示在图层上,需要设置线条颜色
    [[UIColor orangeColor] set];
    
    // 示例代码:
    // 1. 绘制一条直线,即一次贝塞尔曲线
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 1.f;
    path.lineCapStyle = kCGLineCapSquare;
    path.lineJoinStyle = kCGLineCapRound;
    path.miterLimit = 10.f;
    path.flatness = 10.f;
    path.usesEvenOddFillRule = YES;
    // 设置起始点
    [path moveToPoint:CGPointMake(kMargin, kMargin)];
    // 添加子路径
    [path addLineToPoint:CGPointMake(kLineW, kMargin)];//添加一条子路径
    // 根据坐标点连线
    [path stroke];
    
    // 2.绘制一条折线,其实就是增加一个端点
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(kMargin, kMargin*2)];
    [path1 addLineToPoint:CGPointMake(kLineW, kMargin*2)];//添加一条子路径
    [path1 addLineToPoint:CGPointMake(kLineW, kMargin*3)];//添加两条子路径
    [path1 closePath];//当构建子路径数>=2条时,可以调用`closePath`方法来闭合路径.
    [path1 stroke];
    
    // 3.绘制一个矩形
    // 方法1: 类似上面,用点去绘制;
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(kMargin, kMargin*4)];
    [path2 addLineToPoint:CGPointMake(kLineW, kMargin*4)];
    [path2 addLineToPoint:CGPointMake(kLineW, kMargin*5)];
    [path2 addLineToPoint:CGPointMake(kMargin, kMargin*5)];
    
    [path2 stroke];
    
    // 方法2: 初始化方法直接绘制
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(kMargin, kMargin*6, kLineW, kMargin*5)];
    [path3 fill];// 设置填充
    [path3 stroke];
    
    // 4. 绘制带圆角的矩形
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(kMargin, kMargin*13, kLineW, kMargin*5) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(15, kMargin)];
  //  [path4 strokeWithBlendMode:kCGBlendModeMultiply alpha:0.3];
    [path4 fill];
    [path4 stroke];
    
    // 5. 绘制椭圆
    UIBezierPath *path5 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.center.x-100, kMargin*20, 200, 50)];
    [path5 fillWithBlendMode:kCGBlendModeOverlay alpha:0.5];
    [path5 stroke];
    
    // 6. 绘制圆形
    UIBezierPath *path6 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(kMargin*5, kMargin*26, 100, 100)];
    [path6 stroke];
    
    // 7. 绘制一段圆弧
    UIBezierPath *path7 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kMargin*30, kMargin*31) radius:50 startAngle:1.5*3.1415926 endAngle:3.1415926 clockwise:YES];
    [path7 stroke];
    
    // 8.绘制扇形
    UIBezierPath * path8 = [UIBezierPath bezierPath]; // 创建路径
    [path8 moveToPoint:CGPointMake(100, kMargin*45)]; // 设置起始点
    [path8 addArcWithCenter:CGPointMake(100, kMargin*45) radius:50 startAngle:0 endAngle:3.14159/2 clockwise:YES];
    //[[UIColor lightGrayColor] setStroke];
    //[[UIColor lightGrayColor] setFill];
    [path8 closePath];
    [path8 stroke];
    
    // 9. 绘制竖直虚线
    UIBezierPath *verticalLinePath = [UIBezierPath bezierPath];
    CGFloat dash[] = {20.0, 10.0,3.0,17.0};
    verticalLinePath.lineWidth = 6.0;
    [verticalLinePath setLineDash:dash count:4 phase:0];
    [verticalLinePath moveToPoint: CGPointMake(5, 0)];
    [verticalLinePath addLineToPoint: CGPointMake(5, 200*2)];
    [verticalLinePath stroke];
    [verticalLinePath fill];
    
    // 10.绘制二次贝塞尔曲线
    UIBezierPath *path9 = [UIBezierPath bezierPath];
    [path9 moveToPoint:CGPointMake(250, 450)];
    [path9 addQuadCurveToPoint:CGPointMake(350, 450) controlPoint:CGPointMake(300, 550)];
    [path9 stroke];
    
    // 11.绘制三次贝塞尔曲线
    UIBezierPath *path10 = [UIBezierPath bezierPath];
    [path10 moveToPoint:CGPointMake(50, 550)];
    [path10 addCurveToPoint:CGPointMake(300, 550) controlPoint1:CGPointMake(150, 450) controlPoint2:CGPointMake(290, 600)];
    [path10 stroke];
    
}

@end
