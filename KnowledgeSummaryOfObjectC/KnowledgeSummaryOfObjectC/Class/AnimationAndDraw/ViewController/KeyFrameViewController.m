//
//  KeyFrameViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/9.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController ()

@end

@implementation KeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"关键帧动画";
    [self test1];
    [self test2];
    [self test3];
}


/**
 Y方向位移
 */
- (void)test1
{
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 120, 70, 70)];
//    [path moveToPoint:CGPointMake(40, 100)];
//    [path addLineToPoint:CGPointMake(360, 100)];
//    [path addLineToPoint:CGPointMake(360, 200)];
//    [path addLineToPoint:CGPointMake(40, 200)];
//    [path addLineToPoint:CGPointMake(40, 300)];
//    [path addLineToPoint:CGPointMake(360, 300)];
//    [path closePath];
    
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor clearColor].CGColor;
    shaplayer.lineWidth = 2.0;
    [self.view.layer addSublayer:shaplayer];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = 4.0f;
    moveAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    moveAnimation.repeatCount = HUGE_VAL;
    
    UIView * blueView = [[UIView alloc]initWithFrame:CGRectMake(20, 120, 10, 10)];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView.layer addAnimation:moveAnimation forKey:@"moveAnimation"];

    
}


/**
 缩放动画
 */
- (void)test2
{
    UIView * yelloView = [[UIView alloc]initWithFrame:CGRectMake(120, 360, 100, 70)];
    [self.view addSubview:yelloView];
    yelloView.backgroundColor = [UIColor yellowColor];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:1],
                            [NSNumber numberWithFloat:1.5],
                            [NSNumber numberWithFloat:2.9],
                            [NSNumber numberWithFloat:1.0],
                            nil];
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setValues:frameValues];
    [animation setKeyTimes:frameTimes];
    animation.repeatCount = HUGE_VAL;
    animation.duration = 2.25;

    [yelloView.layer addAnimation:animation forKey:@"AnimationMoveY"];
    
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(150, 390, 30, 15)];
    [self.view addSubview:greenView];
    greenView.backgroundColor = [UIColor greenColor];
//    greenView.centerX = 120+150;
//    greenView.centerY = 360+35;
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    positionAnima.fromValue = [NSNumber numberWithFloat:1.0];
    positionAnima.toValue = [NSNumber numberWithFloat:0.5];
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    positionAnima.repeatCount = HUGE_VALF;
    
    
    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    opacityAnima.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnima.toValue = [NSNumber numberWithFloat:0];;
    opacityAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    opacityAnima.repeatCount = HUGE_VALF;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 2.0f;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.animations = [NSArray arrayWithObjects:positionAnima,opacityAnima, nil];

    [greenView.layer addAnimation:groupAnimation forKey:@"AnimationMoveY"];
    
}
/**
 组动画
 */
- (void)test3
{
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(20, 500, 15, 15)];
    [self.view addSubview:greenView];
    greenView.backgroundColor = [UIColor greenColor];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    positionAnima.fromValue = [NSNumber numberWithFloat:1.0];
    positionAnima.toValue = [NSNumber numberWithFloat:2.0];;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    positionAnima.repeatCount = HUGE_VALF;
   
    
    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];

    opacityAnima.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnima.toValue = [NSNumber numberWithFloat:0];;
    opacityAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    opacityAnima.repeatCount = HUGE_VALF;
    //opacityAnima.duration = 0.4;
   
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(30,500)];
    [path addLineToPoint:CGPointMake(300, 500)];
    [path addLineToPoint:CGPointMake(300, 600)];
    [path addLineToPoint:CGPointMake(200, 650)];
    [path addLineToPoint:CGPointMake(30, 500)];
  
    
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor clearColor].CGColor;
    shaplayer.lineWidth = 1.0;
    [self.view.layer addSublayer:shaplayer];
    
    CABasicAnimation *rotationAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnima.duration = 2.0;
    rotationAnima.fromValue = [NSNumber numberWithFloat:0];
    rotationAnima.toValue = [NSNumber numberWithFloat:20];
    rotationAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    rotationAnima.repeatCount = 10;

    
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    //moveAnimation.duration = 4.0f;
    moveAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    moveAnimation.repeatCount = HUGE_VAL;
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:1],
                            [NSNumber numberWithFloat:1.5],
                            [NSNumber numberWithFloat:2.9],
                            [NSNumber numberWithFloat:1.0],
                            nil];
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setValues:frameValues];
    [animation setKeyTimes:frameTimes];
    animation.repeatCount = HUGE_VAL;
    animation.duration = 0.3;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 2.0f;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.animations = [NSArray arrayWithObjects:rotationAnima,positionAnima,opacityAnima,moveAnimation,animation, nil];
    [greenView.layer addAnimation:groupAnimation forKey:@"AnimationMoveY"];
    
}


@end
