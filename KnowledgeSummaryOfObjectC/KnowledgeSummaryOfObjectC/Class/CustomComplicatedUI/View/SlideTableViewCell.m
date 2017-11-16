//
//  SlideTableViewCell.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/15.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "SlideTableViewCell.h"
#import "SlideSubView.h"
@interface SlideTableViewCell()<UIScrollViewDelegate>

@property (nonatomic,strong)SlideSubView *leftSubView;
@property (nonatomic,strong)SlideSubView *middleSubView;
@property (nonatomic,strong)SlideSubView *rightSubView;
@end
@implementation SlideTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView
{
    [self addSubview:self.scrollView];
    self.leftSubView = [self createSubViewWithIndex:0];
    self.middleSubView = [self createSubViewWithIndex:1];
    self.rightSubView = [self createSubViewWithIndex:2];
    [self.scrollView addSubview:self.leftSubView];
    [self.scrollView addSubview:self.middleSubView];
    [self.scrollView addSubview:self.rightSubView];
}
#pragma mark - Getter Methods
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.frame = CGRectMake(0, 0, screen_width, SubCellCount*SubCellHeight);
        _scrollView.contentSize = CGSizeMake(screen_width * 3, 0);
        
    }
    return _scrollView;
}
- (RACSubject *)didScrollSubject
{
    if (!_didScrollSubject) {
        _didScrollSubject = [[RACSubject alloc]init];
    }
    return _didScrollSubject;
}
#pragma mark - Private Methods
- (SlideSubView *)createSubViewWithIndex:(NSInteger)index
{
    CGFloat x = index * screen_width;
    SlideSubView * slideView = [[SlideSubView alloc]initWithFrame:CGRectMake(x, 0, screen_width, SubCellCount*SubCellHeight) andTableViewType:index];
    return slideView;
}
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offsetX = scrollView.contentOffset.x;
    NSLog(@"offsetX::%f",offsetX);
    [self.didScrollSubject sendNext:[NSNumber numberWithFloat:offsetX]];
}
@end
