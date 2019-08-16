//
//  ZTFlightTabItemsView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ZTFlightTabItemsView.h"
static NSInteger const BUTTON_TAG = 1000;

@interface ZTFlightTabItemsView()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIView *moveLineView;
@property (nonatomic,strong) UIImageView *leftCoverView;
@property (nonatomic,strong) UIImageView *rightCoverView;
@property (nonatomic,copy)SlideTabItemSelectedBlock block;
@end
@implementation ZTFlightTabItemsView

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
    self.moveLineHeight = 2.5;
    self.font = [UIFont systemFontOfSize:14];
    self.itemWidth = 0;
    [self addSubview:self.scrollView];
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.moveLineView];
//    [self addSubview:self.leftCoverView];
//    [self addSubview:self.rightCoverView];
}
#pragma mark - Gettter Methods
- (UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (UIView *)moveLineView
{
    if(!_moveLineView)
    {
        _moveLineView = [UIView new];
    }
    return _moveLineView;
}
-(UIImageView *)leftCoverView
{
    if (!_leftCoverView) {
        _leftCoverView = [[UIImageView alloc]init];
        _leftCoverView.backgroundColor = [UIColor clearColor];
        _leftCoverView.image = [UIImage imageNamed:@"ranklist_item_left"];
        _leftCoverView.hidden = YES;
        _leftCoverView.userInteractionEnabled = NO;
    }
    return _leftCoverView;
}
-(UIImageView *)rightCoverView
{
    if (!_rightCoverView) {
        _rightCoverView = [[UIImageView alloc]init];
        _rightCoverView.backgroundColor = [UIColor clearColor];
        _rightCoverView.image = [UIImage imageNamed:@"ranklist_item_right"];
        _rightCoverView.userInteractionEnabled = NO;
    }
    return _rightCoverView;
}
#pragma mark - Setter Methods
- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    self.moveLineView.frame = CGRectZero;
    [self adjust];
    for (UIView *view in self.scrollView.subviews)
    {
        if(view != self.moveLineView)
        {
            [view removeFromSuperview];
        }
    }
    
    for (int i = 0; i < titles.count; i++)
    {
        NSString *title = titles[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = BUTTON_TAG + i;
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:self.itemColor forState:UIControlStateNormal];
        [button setTitleColor:self.itemSelctedColor forState:UIControlStateSelected];
        button.frame = CGRectMake(i * self.itemWidth, 0, self.itemWidth, self.scrollView.frame.size.height);
        button.titleLabel.font = self.font;
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
    self.scrollView.contentSize = CGSizeMake(self.itemWidth * titles.count, self.frame.size.height);
    if(titles.count > 0)
    {
        [self adjustSelectedWithTag:BUTTON_TAG animated:YES isDefault:YES];
    }
    
    [self setCoverViews];
}
- (void)adjustSelectedWithTag:(NSInteger)tag animated:(BOOL)animated isDefault:(BOOL)isDefault
{
    [self resetButtons];
    UIButton *button = (UIButton *)[self.scrollView viewWithTag:tag];
    button.selected = YES;
    [self moveLineWithButton:button];
    if(self.block && !isDefault)
    {
        self.block(tag - BUTTON_TAG);
    }
}
- (void)resetButtons
{
    for (UIView *view in self.scrollView.subviews)
    {
        if([view isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)view;
            button.selected = NO;
        }
    }
}
- (void)moveLineWithButton:(UIButton *)button
{
    CGFloat offset = button.center.x - self.frame.size.width * 0.5;
    
    if (offset < 0)
    {
        offset = 0;
    }
    
    CGFloat maxOffset = self.scrollView.contentSize.width - self.frame.size.width;
    if (offset > maxOffset)
    {
        offset = maxOffset;
    }
    
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}
-(void)setCoverViews
{
    if (self.titles.count == 0)return;
    double coverHeight = self.bounds.size.height;
    self.leftCoverView.frame = CGRectMake(20, 0, self.itemWidth, coverHeight);
    self.rightCoverView.frame = CGRectMake(self.bounds.size.width-self.itemWidth - 20, 0, self.itemWidth, coverHeight);//
    
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(-20, 0, 20, self.bounds.size.height)];
    aView.backgroundColor = [UIColor whiteColor];
    [_leftCoverView addSubview:aView];
    
    aView = [[UIView alloc]initWithFrame:CGRectMake(self.itemWidth, 0, 20, self.bounds.size.height)];
    aView.backgroundColor = [UIColor whiteColor];
    [_rightCoverView addSubview:aView];
    
    self.rightCoverView.hidden = self.titles.count*self.itemWidth <= self.bounds.size.width;
    
}
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self adjust];
}
#pragma mark - Private Methods
- (void)adjust
{
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.moveLineView.frame = CGRectMake(self.moveLineView.frame.origin.x, self.frame.size.height - self.moveLineHeight, self.itemWidth, self.moveLineHeight);
    self.moveLineView.backgroundColor = self.lineColor;
}
#pragma mark - Target Methods
- (void)buttonClicked:(id)sender
{
    UIButton *button = sender;
    if(button.selected)
    {
        return;
    }
    
    [self adjustSelectedWithTag:button.tag animated:YES];
    NSInteger index = button.tag - BUTTON_TAG;
    [UIView animateWithDuration:0.25f animations:^{
        self.moveLineView.frame = CGRectMake(index * self.itemWidth, self.moveLineView.frame.origin.y, self.itemWidth , self.moveLineView.frame.size.height);
    }];
}
- (void)adjustSelectedWithTag:(NSInteger)tag animated:(BOOL)animated
{
    [self adjustSelectedWithTag:tag animated:animated isDefault:NO];
}
#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self setConverViewsHiddenWithScrollView:scrollView];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setConverViewsHiddenWithScrollView:scrollView];
}
-(void)setConverViewsHiddenWithScrollView:(UIScrollView *)scrollView
{
    if (self.titles.count == 0)return;
    if (scrollView.contentOffset.x >= self.itemWidth) {
        self.leftCoverView.hidden = NO;
    }
    else{
        self.leftCoverView.hidden = YES;
    }
    if (scrollView.contentOffset.x == self.titles.count*self.itemWidth-self.bounds.size.width){
        self.rightCoverView.hidden = YES;
    }
    else{
        self.rightCoverView.hidden = NO;
    }
}
#pragma mark - Public Methods
- (void)makeItemSelectedBlock:(SlideTabItemSelectedBlock)selectedBlock
{
    self.block = selectedBlock;
}

- (void)selectedWithIndex:(NSInteger)index
{
    UIButton *button = (UIButton *)[self.scrollView viewWithTag:BUTTON_TAG + index];
    if(button.selected)
    {
        return;
    }
    [self adjustSelectedWithTag:BUTTON_TAG + index animated:YES isDefault:YES];
    [UIView animateWithDuration:0.25f animations:^{
        self.moveLineView.frame = CGRectMake(index * self.itemWidth, self.moveLineView.frame.origin.y, self.itemWidth , self.moveLineView.frame.size.height);
    }];
}

@end
