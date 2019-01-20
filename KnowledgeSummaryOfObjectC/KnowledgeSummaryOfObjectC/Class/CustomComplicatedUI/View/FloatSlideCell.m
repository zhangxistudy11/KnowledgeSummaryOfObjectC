//
//  FloatSlideCell.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/5/11.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "FloatSlideCell.h"

@interface  FloatSlideCell()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FloatSlideCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(float)height
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, height) style:UITableViewStylePlain];
        [self.contentView addSubview:self.tableView];
        [self setUpView];
    }
    return self;
}
- (void)setUpView
{
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
}
#pragma mark - Setter Methods
- (void)innerCanScroll:(BOOL)canScroll
{
    self.cellCanScroll = canScroll;
    self.tableView.scrollEnabled = canScroll;
    if (!canScroll) {
        self.tableView.contentOffset = CGPointZero;
    }
}
//- (void)setCellCanScroll:(BOOL)cellCanScroll
//{
//    _cellCanScroll = cellCanScroll;
////    self.tableView.scrollEnabled = _cellCanScroll;
//    if (!_cellCanScroll) {
//        self.tableView.contentOffset = CGPointZero;
//    }
//}
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // return;
    CGFloat offsetY = scrollView.contentOffset.y;
    if(!self.cellCanScroll){
        self.tableView.contentOffset = CGPointZero;
        self.tableView.scrollEnabled = NO;
    }
    if (offsetY<=0) {
        self.cellCanScroll = NO;
        self.tableView.contentOffset = CGPointZero;
        self.tableView.scrollEnabled = NO;
        if ([self.delegate respondsToSelector:@selector(didMoveTop)]) {
            [self.delegate didMoveTop];
        }
    }
}
#pragma mark - UITableViewDelegte
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = RandomColor;
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell位置:%ld",(long)indexPath.row];
    return cell;
}
@end
