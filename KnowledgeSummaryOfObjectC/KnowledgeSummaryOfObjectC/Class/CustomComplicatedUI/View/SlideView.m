//
//  SlideView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/15.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "SlideView.h"
#import "BaseTableView.h"
#import "SFLabel.h"
#import "SlideTableViewCell.h"
#import "SlideTabView.h"
#define TopHeight  50
#define TableHeaderImaHeight  180
#define SectionHeight 50
#define SubCellHeight 48
#define SubCellCount  20

@interface SlideView() <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)BaseTableView *tableView;
@property (nonatomic,strong)UIView *tableHeaderView;
@property (nonatomic,strong)UIView *sectionView;
@property (nonatomic,strong)SFLabel *topTitle;
@property (nonatomic,strong)SlideTabView *slideTabView;
@property (nonatomic,strong)SlideTableViewCell *slideContentCell;
@property (nonatomic,strong)UIImageView *backIV;
@property (nonatomic,strong)UIImageView * imaIV;
@end
@implementation SlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
        [self bindModel];
    }
    return self;
}
- (void)setUpView
{
    [self addSubview:self.tableView];
    
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, TopHeight)];
    [self addSubview:_topView];
    _topView.backgroundColor = [UIColor cyanColor];
    _topTitle = [[SFLabel alloc]initWithFrame:CGRectMake(60, 0, screen_width-120, _topView.height)];
    [_topView addSubview:_topTitle];
    _topTitle.textAlignment = NSTextAlignmentCenter;
    _topTitle.text = @"滑动悬浮";
    _topTitle.textColor = [UIColor blackColor];
    _topTitle.font = [UIFont boldSystemFontOfSize:18];
    _topTitle.edgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_topView addSubview:_backBtn];
    _backBtn.frame = CGRectMake(0, 0, 60, TopHeight);
    
    _backIV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 25, 10, 17)];
    [_backBtn addSubview:_backIV];
    _backIV.image = [UIImage imageNamed:@"Back_Arrow"];
}
- (void)bindModel
{
    [self.slideContentCell.didScrollSubject subscribeNext:^(NSNumber * offsetX) {
        NSInteger index = [offsetX floatValue]/ (self.slideContentCell.scrollView.width);
        [self.slideTabView selectedWithIndex:index];
    }];
}
#pragma mark - Getter Methods
- (BaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, self.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeaderView;
        //_tableView.bounces = NO;
    }
    return _tableView;
}
- (UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, TableHeaderImaHeight+TopHeight)];
        _imaIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, TopHeight, screen_width, TableHeaderImaHeight)];
        [_tableHeaderView addSubview:_imaIV];
        _imaIV.image = [UIImage imageNamed:@"header.jpg"];
    }
    return _tableHeaderView;
}
- (UIView *)sectionView
{
    if (!_sectionView) {
        _sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, SectionHeight)];
        _sectionView.backgroundColor = [UIColor orangeColor];
        UILabel * sectionLB = [[UILabel alloc]initWithFrame:_sectionView.bounds];
        [_sectionView addSubview:sectionLB];
        sectionLB.text = @"SectionTitle";
        sectionLB.textAlignment = NSTextAlignmentCenter;
        sectionLB.textColor = [UIColor whiteColor];
        sectionLB.font = [UIFont boldSystemFontOfSize:20];
    }
    return _sectionView;
}
-(SlideTabView *)slideTabView
{
    if (!_slideTabView) {
        _slideTabView = [[SlideTabView alloc]initWithFrame:CGRectMake(0, 0, screen_width, SectionHeight)];
        _slideTabView.lineColor = [UIColor yellowColor];
        _slideTabView.itemColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        _slideTabView.itemSelctedColor = [UIColor whiteColor];
        _slideTabView.itemWidth = _slideTabView.bounds.size.width/3;
        _slideTabView.font = [UIFont boldSystemFontOfSize:18];
        _slideTabView.backgroundColor = [UIColor orangeColor];
        _slideTabView.titles = @[@"左边列表",@"中间列表",@"右边列表"];
       
        [_slideTabView makeItemSelectedBlock:^(NSInteger index) {
           [self setScrollViewWithIndex:index];
        }];
        
    }
    return _slideTabView;
}
- (SlideTableViewCell *)slideContentCell
{
    if (!_slideContentCell) {
        _slideContentCell  = [[SlideTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"slide"];
    }
    return _slideContentCell;
}
#pragma mark - UITableVIewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SubCellCount*SubCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.slideContentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SectionHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.slideTabView;
}
#pragma mark - UIScrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat diff = offsetY - TableHeaderImaHeight;
    NSLog(@"offsetY=%f  diff=%f",offsetY,diff);
    [self changeTopViewSsyleWithOffset:diff];
    [self changeTableHeaderFrameWithOffset:offsetY];
  

}

#pragma mark - Private Methods
- (void)setScrollViewWithIndex:(NSInteger)index
{
    float ofsetX = screen_width*index;
    [UIView animateWithDuration:0.25 animations:^{
       self.slideContentCell.scrollView.contentOffset = CGPointMake(ofsetX, 0);
    } ];
    
}

- (void)changeTopViewSsyleWithOffset:(CGFloat)diff
{
    if (diff> 0 && diff <TopHeight) {
        _topView.transform = CGAffineTransformMakeTranslation(0,-diff);
}
    else if (diff<=0)
    {
    _topView.transform = CGAffineTransformIdentity;
    }else if (diff>=TopHeight)
    {
        _topView.transform =  CGAffineTransformMakeTranslation(0,-TopHeight);
    }

}
- (void)changeTableHeaderFrameWithOffset:(float)offsetY
{
    if (offsetY<0) {
        CGFloat Y = TopHeight+offsetY;
        CGFloat W = screen_width - 2* offsetY;
        CGFloat H = TableHeaderImaHeight-offsetY;
        self.imaIV.frame = CGRectMake(offsetY, Y, W, H);
    }
}
@end
