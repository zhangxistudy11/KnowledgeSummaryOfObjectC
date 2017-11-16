//
//  SlideTabView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/16.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SlideTabItemSelectedBlock)(NSInteger index);

@interface SlideTabView : UIView

@property (nonatomic,strong)NSArray *titles;
/**
 *  默认2.5
 */
@property (nonatomic,assign)CGFloat moveLineHeight;

/**
 *  底部移动线条颜色
 */
@property (nonatomic,strong)UIColor *lineColor;

/**
 *  选择项默认宽度
 */
@property (nonatomic,assign)CGFloat itemWidth;

/**
 *  默认字体颜色
 */
@property (nonatomic,strong)UIColor *itemColor;

/**
 *  选中颜色
 */
@property (nonatomic,strong)UIColor *itemSelctedColor;

/**
 *  字体大小 默认14
 */
@property (nonatomic,strong)UIFont *font;


- (void)makeItemSelectedBlock:(SlideTabItemSelectedBlock)selectedBlock;

- (void)selectedWithIndex:(NSInteger)index;
@end
