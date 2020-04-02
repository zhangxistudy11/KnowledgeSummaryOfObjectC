//
//  DDSectionIndexView.h
//  DevelopmentLibrary
//
//  Created by 张桂杨 on 2017/11/17.
//  Copyright © 2017年 DD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDIndexView;

@protocol DDIndexViewDelegate <NSObject>

- (NSArray <NSString *>*)titlesForIndexView:(DDIndexView *)indexView;
@optional
- (void)indexView:(DDIndexView *)indexView didSelectedIndex:(NSInteger)index complete:(void (^)(NSInteger finalSelectedIndex))complete;

@end

@interface DDIndexView : UIView
- (void)reloadData;
- (void)updateSelectedIndex:(NSInteger)selectedIndex;

@property (nonatomic, weak)   id <DDIndexViewDelegate>delegate;

@end
