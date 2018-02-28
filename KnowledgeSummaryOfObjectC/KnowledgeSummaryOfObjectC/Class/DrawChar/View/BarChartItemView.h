//
//  BarChartItemView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/28.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BaseView.h"

@interface BarChartItemView : BaseView

@property (nonatomic,strong) UIColor *barColor;

@property (nonatomic,assign) float barHeight;

/**
重新绘制
 */
- (void)drawContent;
@end
