//
//  BarChartView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/28.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BaseView.h"

@interface BarChartView : BaseView

@property (nonatomic,strong) UIColor *backColor;//图标背景颜色

- (void)drawBarView;
@end
