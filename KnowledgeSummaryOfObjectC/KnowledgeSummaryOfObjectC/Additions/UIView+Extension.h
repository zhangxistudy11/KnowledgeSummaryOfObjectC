//
//  UIView+Extension.h
//
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 LaoK. All rights reserved.
/*
 effect:该扩展可以直接使用self.view.x=self.bounds.origin.x;
 */

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@end
