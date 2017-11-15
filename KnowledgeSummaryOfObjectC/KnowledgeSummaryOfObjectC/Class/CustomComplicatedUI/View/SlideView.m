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
#define TopHeight  50
#define TableHeaderImaHeight  180
#define SectionHeight 50
@interface SlideView() <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)BaseTableView *tableView;
@property (nonatomic,strong)UIView *tableHeaderView;
@property (nonatomic,strong)UIView *sectionView;
@property (nonatomic,strong)SFLabel *topTitle;
@end
@implementation SlideView

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
    [self addSubview:self.tableView];
    
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, TopHeight)];
    [self addSubview:_topView];
    _topView.backgroundColor = [UIColor cyanColor];
    _topTitle = [[SFLabel alloc]initWithFrame:CGRectMake(0, 0, screen_width, _topView.height)];
    [_topView addSubview:_topTitle];
    _topTitle.textAlignment = NSTextAlignmentCenter;
    _topTitle.text = @"隐身导航栏";
    _topTitle.textColor = [UIColor blueColor];
    _topTitle.font = [UIFont systemFontOfSize:20];
    _topTitle.edgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
}
#pragma makr - Getter Methods
- (BaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, self.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeaderView;
       
    }
    return _tableView;
}
- (UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, TableHeaderImaHeight+TopHeight)];
        UIImageView * imaIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, TopHeight, screen_width, TableHeaderImaHeight)];
        [_tableHeaderView addSubview:imaIV];
        imaIV.image = [UIImage imageNamed:@"header.jpg"];
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
#pragma mark - UITableVIewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"idea"];
    cell.textLabel.text = [NSString stringWithFormat:@"SubCell-%zi",indexPath.row];
    /*
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"idea"];
        cell.textLabel.text = [NSString stringWithFormat:@"SubCell-%zi",indexPath.row];
    }
     */
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SectionHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionView;
}
#pragma mark - UIScrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat diff = offsetY - TableHeaderImaHeight;
    NSLog(@"offsetY=%f  diff=%f",offsetY,diff);
    [self changeTopViewSsyleWithOffset:diff];
}
#pragma mark - Private Methods
- (void)changeTopViewSsyleWithOffset:(CGFloat)diff
{
    if (diff> 0 && diff <TopHeight) {
        float scale = 1- diff/(float)TopHeight;
        float tempH = TopHeight *scale;
        NSLog(@"scale %f",scale);
        NSLog(@"tempH %f",tempH);
        _topView.frame = CGRectMake(_topView.x, _topView.y, screen_width, tempH);
    }else if (diff<=0)
    {
        _topView.frame = CGRectMake(_topView.x, _topView.y, screen_width, TopHeight);
    }else if (diff>=TopHeight)
    {
        _topView.frame = CGRectMake(_topView.x, _topView.y, screen_width, 0);
    }
    _topTitle.frame = CGRectMake(_topTitle.x, _topTitle.y, screen_width, _topView.height);
}

@end
