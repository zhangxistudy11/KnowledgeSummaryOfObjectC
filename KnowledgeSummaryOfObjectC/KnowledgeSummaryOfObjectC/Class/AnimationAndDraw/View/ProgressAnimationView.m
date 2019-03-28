//
//  ProgressAnimationView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/3/28.
//  Copyright © 2019 张玺. All rights reserved.
//

#define FIRST_VALUE  0.3
#define FIRST_DURATION 10

#define LAST_VALUE  0.9
#define LAST_DURATION 0.066

#import "ProgressAnimationView.h"

@interface ProgressAnimationView()
@property (nonatomic,assign) float progressValue;
@end

@implementation ProgressAnimationView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView
{
    self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.frame = self.bounds;
    [self addSubview:self.progressView];
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, self.bounds.size.height/(float)2.0f);
    self.progressView.transform = transform;
//    [self defaultProgress];
//    [self.progressView setProgress:FIRST_VALUE animated:YES];
}
#pragma mark - Setter Methods
- (void)setHeight:(float)height
{
    _height = height;
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, height/(float)2.0f);
    self.progressView.transform = transform;
}

- (void)defaultProgress
{
//    [self testValue];
    self.progressValue = FIRST_VALUE;
    [UIView animateWithDuration:FIRST_DURATION animations:^{
        [self.progressView setProgress:self.progressValue animated:YES];
    }];
}
- (void)testValue
{
    [UIView animateWithDuration:15 animations:^{
        [self.progressView setProgress:0.3 animated:YES];
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            [self.progressView setProgress:0.9 animated:YES];
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:FIRST_DURATION animations:^{
                [self.progressView setProgress:1.0 animated:YES];
            }completion:^(BOOL finished) {
                
            }];
        }];
    }];
}
- (void)endAnimationProgress
{
    [UIView animateWithDuration:LAST_DURATION animations:^{
        [self.progressView setProgress:1.0 animated:YES];
    }completion:^(BOOL finished) {

    }];
}
- (void)animationProgessToValue:(float)value  druation:(float)druation
{
    if (value<=self.progressValue&&self.progressValue>=LAST_VALUE) {
        return;
    }
    [UIView animateWithDuration:druation animations:^{
        [self.progressView setProgress:value animated:YES];
    }completion:^(BOOL finished) {
        self.progressValue = value;
    }];
}
@end
