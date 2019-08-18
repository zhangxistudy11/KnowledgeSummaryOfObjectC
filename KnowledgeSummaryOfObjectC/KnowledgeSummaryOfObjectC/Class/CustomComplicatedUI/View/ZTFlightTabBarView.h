//
//  ZTFlightTabBarView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^IndexChangeBlock)(NSInteger index);


@interface ZTFlightTabBarView : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
/**
 水平方向两边的间距 默认为0
 */
@property (nonatomic,assign) float horizontalMargin;

/**
 顶部的间距 默认为0
 */
@property (nonatomic,assign) float topMargin;
/**
 底部的间距 默认为0
 */
@property (nonatomic,assign) float bottomMargin;

/**
 文案的数组
 */
@property (nonatomic,strong) NSArray *titles;


/**
 指定选中位置  默认为 0
 */
@property (nonatomic,assign) NSInteger selectIndex;

/**
 *  单个item背景色,默认白色
 */
@property (nonatomic,strong)UIColor *itemBackColor;

/**
 字体字号 默认14号
 */
@property (nonatomic,assign) float fontSize;

/**
 *  底部移动线条颜色
 */
@property (nonatomic,strong)UIColor *lineColor;

/**
 横线相对文字长度内缩举例 默认线为20
 */
@property (nonatomic,assign) float linePadding;

/**
 *  默认字体颜色 
 */
@property (nonatomic,strong)UIColor *itemColor;

/**
 *  选中颜色
 */
@property (nonatomic,strong)UIColor *itemSelctedColor;

/**
 选中位置后回调
 */
@property (nonatomic,copy) IndexChangeBlock indexChangeBlock;

/**
 显示右上角图标提示

 @param index 第几个tab，默认从0开始
 @param title 显示的文案
 @param badgeStyleDict 图标样式 非必传
 {
 @"backColor":@"#ffffff",默认橘黄色
 @"textColor":@"#ccccc",默认白色
 @"textSize":@(10) 默认10号
 }
 @
 */
- (void)showBadgeAtIndex:(NSInteger)index title:(NSString *)title badgeStyle:(NSDictionary *)badgeStyleDict;
@end

NS_ASSUME_NONNULL_END
