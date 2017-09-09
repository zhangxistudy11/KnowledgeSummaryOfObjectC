//
//  TransformViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/8.
//  Copyright © 2017年 张玺. All rights reserved.
//
/**
 animationWithKeyPath的值：
 transform.scale = 比例轉換
 
 transform.scale.x = 闊的比例轉換
 
 transform.scale.y = 高的比例轉換
 
 transform.rotation.z = 平面圖的旋轉
 
 opacity = 透明度
 
 margin
 
 zPosition
 
 backgroundColor    背景颜色
 
 cornerRadius    圆角
 
 borderWidth
 
 bounds
 
 contents
 
 contentsRect
 
 cornerRadius
 
 frame
 
 hidden
 
 mask
 
 masksToBounds
 
 opacity
 
 position
 
 shadowColor
 */

#import "TransformViewController.h"

@interface TransformViewController ()

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"基本动画";
    
    [self test1];
    [self test2];
    [self test3];
    [self test4];
    [self test5];
    [self test6];
    [self test7];
}

/**
 Y方向位移
 */
- (void)test1
{
    
    UIView * blueView = [[UIView alloc]initWithFrame:CGRectMake(20, 120, 100, 70)];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.duration = 0.8;
    positionAnima.fromValue = @(blueView.center.y);
    positionAnima.toValue = @(blueView.center.y-30);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.repeatCount = HUGE_VALF;
   // positionAnima.repeatDuration = 0.8;
//    positionAnima.removedOnCompletion = NO;
//    positionAnima.fillMode = kCAFillModeForwards;
    
    [blueView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
    
}

/**
 整体方向位移
 */
- (void)test2
{
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(200, 120, 100, 70)];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnima.duration = 0.8;
    positionAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(redView.centerX, redView.centerY)];
    positionAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(redView.centerX+20, redView.centerY+40)];;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //positionAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
        positionAnima.removedOnCompletion = NO;
        positionAnima.fillMode = kCAFillModeForwards;
    
    [redView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
}

/**
 缩放动画
 */
- (void)test3
{
    UIView * yelloView = [[UIView alloc]initWithFrame:CGRectMake(20, 250, 100, 70)];
    [self.view addSubview:yelloView];
    yelloView.backgroundColor = [UIColor yellowColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    positionAnima.duration = 0.8;
    positionAnima.fromValue = [NSNumber numberWithFloat:1.0];
    positionAnima.toValue = [NSNumber numberWithFloat:2.0];;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    positionAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
//    positionAnima.removedOnCompletion = NO;
//    positionAnima.fillMode = kCAFillModeForwards;
//    
    [yelloView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
}

/**
 透明度动画
 */
- (void)test4
{
    UIView * orginView = [[UIView alloc]initWithFrame:CGRectMake(200, 250, 100, 70)];
    [self.view addSubview:orginView];
    orginView.backgroundColor = [UIColor orangeColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    positionAnima.duration = 2.0;
    positionAnima.fromValue = [NSNumber numberWithFloat:1.0];
    positionAnima.toValue = [NSNumber numberWithFloat:0.3];;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
    //    positionAnima.removedOnCompletion = NO;
    //    positionAnima.fillMode = kCAFillModeForwards;
    //
    [orginView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];

}

/**
 圆角动画
 */
- (void)test5
{
    UIView * cyanView = [[UIView alloc]initWithFrame:CGRectMake(20, 400, 70, 70)];
    [self.view addSubview:cyanView];
    cyanView.backgroundColor = [UIColor cyanColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    positionAnima.duration = 2.0;
    positionAnima.fromValue = [NSNumber numberWithFloat:0];
    positionAnima.toValue = [NSNumber numberWithFloat:50.0];;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
    //    positionAnima.removedOnCompletion = NO;
    //    positionAnima.fillMode = kCAFillModeForwards;
    //
    [cyanView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
}

/**
 旋转动画
 */
- (void)test6
{
    UIView * brownView = [[UIView alloc]initWithFrame:CGRectMake(200, 400, 70, 70)];
    [self.view addSubview:brownView];
    brownView.backgroundColor = [UIColor brownColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    positionAnima.duration = 2.0;
    positionAnima.fromValue = [NSNumber numberWithFloat:0];
    positionAnima.toValue = [NSNumber numberWithFloat:20];
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.repeatCount = 10;
    // positionAnima.repeatDuration = 0.8;
    //    positionAnima.removedOnCompletion = NO;
    //    positionAnima.fillMode = kCAFillModeForwards;
    //
    [brownView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
}

/**
 组动画
 */
- (void)test7
{
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(20, 500, 100, 70)];
    [self.view addSubview:greenView];
    greenView.backgroundColor = [UIColor greenColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
   // positionAnima.duration = 0.8;
    positionAnima.fromValue = [NSNumber numberWithFloat:1.0];
    positionAnima.toValue = [NSNumber numberWithFloat:2.0];;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    positionAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
    //    positionAnima.removedOnCompletion = NO;
    //    positionAnima.fillMode = kCAFillModeForwards;
    //
    //[greenView.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
    
    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
   // opacityAnima.duration = 0.8;
    opacityAnima.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnima.toValue = [NSNumber numberWithFloat:0];;
    opacityAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    opacityAnima.repeatCount = HUGE_VALF;
    // positionAnima.repeatDuration = 0.8;
    //    positionAnima.removedOnCompletion = NO;
    //    positionAnima.fillMode = kCAFillModeForwards;
    //
    //[opacityAnima.layer addAnimation:positionAnima forKey:@"AnimationMoveY"];
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 2.0f;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.animations = [NSArray arrayWithObjects:positionAnima,opacityAnima, nil];
    [greenView.layer addAnimation:groupAnimation forKey:@"AnimationMoveY"];
    
}
@end
