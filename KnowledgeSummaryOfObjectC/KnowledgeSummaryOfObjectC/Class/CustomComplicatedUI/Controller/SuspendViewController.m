//
//  SuspendViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/1.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "SuspendViewController.h"

#define TopMargin  100
#define HeaderPadding 20
#define HeaderHeight 200

@interface SuspendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *topLB;
@property (nonatomic,strong) UIView *headerView;
@end

@implementation SuspendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"自定义滑动悬停";
    [self addSubView];
}

- (void)addSubView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    self.topLB = [self creatLB];
    [self.topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(TopMargin);
        make.height.mas_equalTo(50);
        make.left.right.equalTo(self.view);
    }];
    self.topLB.text = @"不可下拉顶部LB";
    
    self.headerView = [[UIView alloc]init];
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(TopMargin+HeaderPadding+50);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(HeaderHeight);
    }];
    self.headerView.backgroundColor = [UIColor cyanColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, TopMargin+HeaderPadding+HeaderHeight, screen_width, 800)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];

}
- (UILabel *)creatLB
{
    UILabel *lb = [[UILabel alloc]init];
    [self.view addSubview:lb];
    lb.backgroundColor = RandomColor;
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont systemFontOfSize:25];
    return lb;
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
