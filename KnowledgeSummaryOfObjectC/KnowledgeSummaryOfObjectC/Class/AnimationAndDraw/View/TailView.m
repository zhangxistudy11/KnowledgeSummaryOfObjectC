//
//  TailView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/2.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "TailView.h"

@interface TailView()
@property (nonatomic, weak) CAGradientLayer * gradientLayer;
@end

@implementation TailView

- (instancetype)init {
    if (self = [super init]) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView {
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc]init];
    gradientLayer.colors = @[(__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0,@0.8,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.frame = CGRectZero;
    [self.layer addSublayer:gradientLayer];
    self.gradientLayer = gradientLayer;
    
    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnima.duration = 2.0;
    opacityAnima.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnima.toValue = [NSNumber numberWithFloat:0.5];;
    opacityAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    opacityAnima.repeatCount = HUGE_VALF;
    opacityAnima.autoreverses = YES;
    [self.layer addAnimation:opacityAnima forKey:@"AnimationMoveY"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"frame -- %@", NSStringFromCGRect(self.bounds));
    
//    self.gradientLayer.frame = self.bounds;
}

@end
