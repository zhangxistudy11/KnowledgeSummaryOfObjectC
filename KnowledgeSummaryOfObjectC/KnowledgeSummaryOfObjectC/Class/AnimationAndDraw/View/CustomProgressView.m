//
//  CustomProgressView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/1.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "CustomProgressView.h"
#define ContentHeight  40
#define ArrowWidth 30
@interface  CustomProgressView()
@property (nonatomic,strong) UIView *tailView;
@property (nonatomic,strong) UIImageView *arrowIV;
@property (nonatomic,strong)  CAGradientLayer * gradientLayer;

@end
@implementation CustomProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}
- (void)setupView{
    self.tailView = [[UIView alloc]init];
    [self addSubview:self.tailView];
    self.tailView.frame = CGRectMake(0, 0, 0, ContentHeight);
    self.tailView.backgroundColor = [UIColor blueColor];
    
        CAGradientLayer * gradientLayer = [[CAGradientLayer alloc]init];
        gradientLayer.colors = @[(__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
        gradientLayer.locations = @[@0,@0.8,@1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
        gradientLayer.frame = self.tailView.bounds;
    
        [self.tailView.layer addSublayer:gradientLayer];
    
    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
     opacityAnima.duration = 2.0;
    opacityAnima.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnima.toValue = [NSNumber numberWithFloat:0.5];;
    opacityAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    opacityAnima.repeatCount = HUGE_VALF;
    opacityAnima.autoreverses = YES;
    [self.tailView.layer addAnimation:opacityAnima forKey:@"AnimationMoveY"];

    
    self.arrowIV =[[UIImageView alloc]init];
    [self addSubview:self.arrowIV];
    self.arrowIV.frame = CGRectMake(0, 0, ArrowWidth, ContentHeight);
    self.arrowIV.backgroundColor = [UIColor greenColor];
    self.arrowIV.image = [UIImage imageNamed:@"myMessage_TradingAssistance"];
    
}
- (void)startLoad{
    
    [UIView animateWithDuration:8 animations:^{
        [self updateViewFrameWithValue:0.7];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)completeLoad{
    [UIView animateWithDuration:0.8 animations:^{
        [self updateViewFrameWithValue:1.0];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)resetLoad{
     [self updateViewFrameWithValue:0];
}
- (void)updateViewFrameWithValue:(float)value
{
    float x = screen_width * value;
    CGRect arrowOrginReact = self.arrowIV.frame;
    self.arrowIV.frame = CGRectMake(x, arrowOrginReact.origin.y, arrowOrginReact.size.width, arrowOrginReact.size.height);
    
    CGRect tailOrginReact = self.tailView.frame;
    self.tailView.frame = CGRectMake(0, tailOrginReact.origin.y, x, tailOrginReact.size.height);
    
    

    
}
@end
