//
//  UIView+FITBackViewAddition.h
//  FitBody
//
//  Created by WSS on 16/12/13.
//  Copyright © 2016年 caiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FITBackViewAddition)

@property (nonatomic, readonly)UIView *backView;

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector;

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector
                   animation:(void(^)(void))animation
                timeInterval:(NSTimeInterval)interval
                   fininshed:(void(^)(BOOL finished))fininshed;

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                   backColor:(UIColor*)backColor
                      target:(id)target
                 touchAction:(SEL)selector
                   animation:(void(^)(void))animation
                timeInterval:(NSTimeInterval)interval
                   fininshed:(void(^)(BOOL finished))fininshed;

- (void)hideBackViewForView:(UIView *)view
                  animation:(void(^)(void))animation
               timeInterval:(NSTimeInterval)interval
                  fininshed:(void(^)(BOOL complation))fininshed;

- (void)hideBackViewForView:(UIView *)view;

@end
