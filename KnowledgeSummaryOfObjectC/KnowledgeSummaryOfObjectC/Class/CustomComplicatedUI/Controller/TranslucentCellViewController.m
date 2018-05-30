//
//  TranslucentCellViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/5/12.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "TranslucentCellViewController.h"
#define ScrollDefaultY  200
#define TopMargin   350

@interface TranslucentCellViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation TranslucentCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"tablevie滑动悬停";
    [self addSubView];
}

- (void)addSubView
{
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, ScrollDefaultY, screen_width, 800)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
    UIView *colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 200)];
    colorView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView  = colorView;
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, screen_width, 50)];
    lb.text = @"ggggg";
    lb.textColor = [UIColor redColor];
    lb.textAlignment = NSTextAlignmentCenter;
    [colorView addSubview:lb];
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screen_width, 50)];
    lb.text = @"section";
    lb.textColor = [UIColor redColor];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.backgroundColor = [UIColor blackColor];
    return lb;
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
