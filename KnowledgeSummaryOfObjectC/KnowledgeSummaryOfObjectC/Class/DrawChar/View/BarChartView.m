//
//  BarChartView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/2/28.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BarChartView.h"
#import "BarChartItemView.h"

#define ScrollViewHeight 175
#define DistributionCount 4
#define BarItemWidth 12
#define Padding 20

@interface BarChartView()

@property (nonatomic,strong) UIScrollView *scrollView;//可滑动的容器View

@property (nonatomic,strong) NSMutableArray *displayArray;//当前展示的数据

@end

@implementation BarChartView

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
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, ScrollViewHeight)];
    [self addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.width*3, ScrollViewHeight);
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.bounces = NO;
    
    for (int i =1; i<=3; i++) {
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, ScrollViewHeight/DistributionCount * i, self.width*3, 0.5)];
        [self.scrollView addSubview:line];
        line.backgroundColor = [UIColor lightGrayColor];
    }
   
  
}
#pragma mark - Private Methods

/**
 重新绘制
 */
- (void)drawBarView
{
    [self removeAllBar];
    
    [self drawBarItem];
    
}
- (void)removeAllBar
{
    NSArray * subviews = [NSArray arrayWithArray:self.scrollView.subviews];
    for (UIView * view in subviews) {
        if ([view isKindOfClass:[BarChartItemView class]]) {
            [(BarChartItemView *)view removeFromSuperview];
        }
    }
}
- (void)drawBarItem
{
    for (int i=0; i<self.displayArray.count; i++) {
        int value = [[self.displayArray objectAtIndex:i] intValue];
        BarChartItemView * item = [[BarChartItemView alloc]initWithFrame:CGRectMake(Padding*(i+1)+BarItemWidth*i, 0, BarItemWidth, ScrollViewHeight)];
        [self.scrollView addSubview:item];
        item.barColor = (value<0) ? [UIColor greenColor] : [UIColor redColor];
        item.barHeight = value;
        [item drawContent];
    }
}
#pragma mark - Setter Methods
- (void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
}
#pragma mark - Getter Methods
- (NSMutableArray *)displayArray
{
    if (!_displayArray) {
        _displayArray = [NSMutableArray array];
        for (int i=0; i<6; i++) {
            int value = arc4random() % 80;
            int result = (i%2==1) ? (-value):value;
            [_displayArray addObject:[NSNumber numberWithInt:result]];
        }
    }
    return _displayArray;
}

@end
