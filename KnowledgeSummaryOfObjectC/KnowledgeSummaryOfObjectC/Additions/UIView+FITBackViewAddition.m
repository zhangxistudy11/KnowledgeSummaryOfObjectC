//
//  UIView+FITBackViewAddition.m
//  FitBody
//
//  Created by WSS on 16/12/13.
//  Copyright © 2016年 caiyi. All rights reserved.
//

#import "UIView+FITBackViewAddition.h"
#import <objc/runtime.h>
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
static const void *kBackViewIdentifier = &kBackViewIdentifier;

@implementation UIView (FITBackViewAddition)

- (UIView*)backView{
    UIView* backView = objc_getAssociatedObject(self, kBackViewIdentifier);
    return backView;
}

// 1 背景渐变显示出来
- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector
                   animation:(void(^)(void))animation
                timeInterval:(NSTimeInterval)interval
                   fininshed:(void(^)(BOOL finished))fininshed{
    [self showViewWithBackView:view
                         alpha:0
                        target:target
                   touchAction:selector];
    [UIView animateWithDuration:interval
                     animations:^(void){
                         self.backView.alpha = a;
                         if (animation) {
                             animation ();
                         }
                     }
                     completion:fininshed];
}
// 2.背景直接显示出来
- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                   backColor:(UIColor*)backColor
                      target:(id)target
                 touchAction:(SEL)selector
                   animation:(void(^)(void))animation
                timeInterval:(NSTimeInterval)interval
                   fininshed:(void(^)(BOOL finished))fininshed{
    [self showViewWithBackView:view
                         alpha:a
                 backViewColor:backColor
                        target:target
                   touchAction:selector];
    [UIView animateWithDuration:interval
                     animations:animation
                     completion:fininshed];
}
// 背景图 ,默认黑色
- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector
{
    [self showViewWithBackView:view
                         alpha:a
                 backViewColor:[UIColor blackColor]
                        target:target
                   touchAction:selector];
}

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
               backViewColor:(UIColor*)backColor
                      target:(id)target
                 touchAction:(SEL)selector{
    if (![self backView]) {
        UIView* backView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64)];
        backView.backgroundColor = backColor;
        backView.alpha = a;
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
        [backView addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, kBackViewIdentifier, backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:backView];
        
        
        
    }
    [self addSubview:view];
    
}

- (void)hideBackViewForView:(UIView *)view
                  animation:(void(^)(void))animation
               timeInterval:(NSTimeInterval)interval
                  fininshed:(void(^)(BOOL complation))fininshed{
    __weak typeof(self) block_self = self;
    [UIView animateWithDuration:interval
                     animations:^(void){
                         self.backView.alpha = 0;
                         if (animation) {
                             animation();
                         }
                     }
                     completion:^(BOOL finish){
                         [block_self hideBackViewForView:view];
                         if (fininshed) {
                             fininshed(finish);
                         }
                     }];
}

- (void)hideBackViewForView:(UIView *)view{
    UIView* backView = [self backView];
    [view removeFromSuperview];
    [backView removeFromSuperview];
    objc_setAssociatedObject(self, kBackViewIdentifier, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //
}

@end
