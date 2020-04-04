//
//  DDSectionIndexView.m
//  DevelopmentLibrary
//
//  Created by 张桂杨 on 2017/11/17.
//  Copyright © 2017年 DD. All rights reserved.
//

#import "DDIndexView.h"
#import <objc/runtime.h>
@interface UIWindow (DDIndicatorView)
@property (nonatomic, strong) UIView *indicatorView;
@end

static const char *  kDDIndicatorView = "kDDIndicatorView";
@implementation UIWindow (DDIndicatorView)
- (void)setIndicatorView:(UIView *)indicatorView {
    objc_setAssociatedObject(self, kDDIndicatorView, indicatorView, OBJC_ASSOCIATION_RETAIN);
}
- (UIView *)indicatorView {
    return objc_getAssociatedObject(self, kDDIndicatorView);
}
@end
static CGFloat kItemWidth = 16.0f;
@interface DDIndexView ()
@property (nonatomic, strong) UIImageView *indicatorView;
@property (nonatomic, strong) UILabel *indicatorLabel;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UILabel *selectedItem;
@property (nonatomic, assign) NSInteger finalSelectedIndex;
@property (nonatomic, assign) BOOL touching;
@end

@implementation DDIndexView
#pragma mark - overwrite
#pragma mark ---UIView
- (instancetype)init {
    if (self = [super init]) {
        _indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
        _indicatorView.image = [UIImage imageNamed:@"indicator"];
        _indicatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _indicatorLabel.textAlignment = NSTextAlignmentCenter;
        _indicatorLabel.textColor = [UIColor whiteColor];
        [_indicatorView addSubview:_indicatorLabel];
    }
    return self;
}
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        [self renderUI];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = _titleArray.count * kItemWidth;
    self.frame = CGRectMake(CGRectGetWidth(self.superview.bounds) - kItemWidth - 5, (CGRectGetHeight(self.superview.bounds) - height)/2.0, kItemWidth + 5, height);
}

#pragma mark ---UIResponder
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _touching = YES;
    [self handleTouches:touches];
    [self showIndicator];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _touching = YES;
    [self handleTouches:touches];
    [self showIndicator];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _touching = NO;
    [self hideIndicator];
    [self updateSelectedIndex:_finalSelectedIndex];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _touching = NO;
    [self hideIndicator];
    [self updateSelectedIndex:_finalSelectedIndex];
}
#pragma mark - public
- (void)reloadData {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self renderUI];
}

- (void)updateSelectedIndex:(NSInteger)selectedIndex {
    if (_touching) {
        return;
    }
    if (selectedIndex >=0 && selectedIndex < _titleArray.count) {
        _selectedItem.backgroundColor = [UIColor clearColor];
        _selectedItem = [self viewWithTag:selectedIndex + 1000];
        _selectedItem.backgroundColor = [UIColor greenColor];
    }
}


#pragma mark - events
- (void)renderUI {
    _titleArray = [self.delegate titlesForIndexView:self];
    
    for (NSInteger i = 0; i < _titleArray.count; i ++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = _titleArray[i];
        label.frame = CGRectMake(0, i * kItemWidth, kItemWidth, kItemWidth);
        label.font = [UIFont systemFontOfSize:6];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = i + 1000;
        label.layer.cornerRadius = kItemWidth/2.0;
        label.clipsToBounds = YES;
        [self addSubview:label];
    }
}
- (void)showIndicator {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    if (!window.indicatorView) {
        [window addSubview:_indicatorView];
        _indicatorView.alpha = 0.0;
        [UIView animateWithDuration:0.35 animations:^{
            _indicatorView.alpha = 1.0;
        }];
        window.indicatorView = _indicatorView;
    }
    CGRect rect = [self convertRect:_selectedItem.frame toView:window];
    CGFloat width = CGRectGetWidth(_indicatorView.bounds);
    CGFloat height = CGRectGetHeight(_indicatorView.bounds);
    _indicatorView.frame = CGRectMake(CGRectGetMinX(rect) - width - 10, CGRectGetMidY(rect) - height/2.0, width, height);
}
- (void)hideIndicator {
    [UIView animateWithDuration:0.25 animations:^{
        _indicatorView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [_indicatorView removeFromSuperview];
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        window.indicatorView = nil;
    }];
}

- (void)handleTouches:(NSSet<UITouch *> *)touches{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    NSInteger selectedIndex = touchPoint.y / kItemWidth;
    if (selectedIndex >=0 && selectedIndex < _titleArray.count) {
        _finalSelectedIndex = selectedIndex;
        _selectedItem.backgroundColor = [UIColor clearColor];
        _selectedItem = [self viewWithTag:selectedIndex + 1000];
        _selectedItem.backgroundColor = [UIColor greenColor];
        _indicatorLabel.text = _titleArray[selectedIndex];
        
        if (![self.delegate respondsToSelector:@selector(indexView:didSelectedIndex:complete:)]) {
            return;
        }
        __weak typeof(self) wSelf = self;
        [self.delegate indexView:self didSelectedIndex:selectedIndex complete:^(NSInteger finalSelectedIndex) {
            __weak typeof(wSelf) sSelf = wSelf;
            sSelf.finalSelectedIndex = finalSelectedIndex;
        }];
        
    }
}


@end
