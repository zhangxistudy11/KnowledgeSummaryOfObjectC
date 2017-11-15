//
//  SlideSubView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/15.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "SlideSubView.h"

@interface SlideSubView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) TableViewType tableType;
@property (nonatomic,strong) BaseTableView *tableView;
@end
@implementation SlideSubView
- (instancetype)initWithFrame:(CGRect)frame andTableViewType:(TableViewType)tableType
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableType = tableType;
        [self setUpView];
    }
    return self;
}
- (void)setUpView
{
   
    [self addSubview:self.tableView];
}
#pragma makr - Getter Methods
- (BaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, self.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return SubCellCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SubCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * loctionDes ;
    if (_tableType == Left_type) {
        loctionDes = @"左边";
    }else if (_tableType == Middle_type)
    {
        loctionDes = @"中间";
    }else if (_tableType == Right_Type)
    {
        loctionDes = @"右边";
    }
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"idea"];
    cell.textLabel.text = [NSString stringWithFormat:@"位置-%@  个数-%zi",loctionDes,indexPath.row];
    return cell;
    
}

@end
