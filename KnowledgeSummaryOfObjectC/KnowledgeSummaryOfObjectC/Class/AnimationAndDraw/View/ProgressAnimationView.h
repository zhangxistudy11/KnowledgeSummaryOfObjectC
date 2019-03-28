//
//  ProgressAnimationView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/3/28.
//  Copyright © 2019 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressAnimationView : UIView
//UIProgressView
@property (nonatomic,strong) UIProgressView *progressView;

//progressView 高度
@property (nonatomic,assign) float height;

/**
 默认加载加载
 */
- (void)defaultProgress;

/**
 结束加载
 */
- (void)endAnimationProgress;

/**

 @param value 进度条到达位置
 @param druation 到达value的动画时间
 */
- (void)animationProgessToValue:(float)value  druation:(float)druation;
@end

NS_ASSUME_NONNULL_END
