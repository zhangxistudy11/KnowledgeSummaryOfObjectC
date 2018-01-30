//
//  FiltrateSlideView.h
//  Leadfund
//
//  Created by zhangxi on 2018/1/29.
//

#import "BaseView.h"

@interface FiltrateSlideView : BaseView

/**
 显示部分距离屏幕边缘的值
 */
@property (nonatomic,assign) float limitPadding;

/**
 容器View
 */
@property (nonatomic,strong) UIView *contentView;


/**
 显示View
 */
- (void)showView;

/**
 隐藏View
 */
- (void)hideView;

@end
