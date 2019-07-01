//
//  SuspendTableController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/1.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "SuspendTableController.h"
#define TopMargin  88
#define TopHeight 50
#define HeaderPadding 20
#define HeaderHeight 200
@interface SuspendTableController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *topLB;
@property (nonatomic,strong) UIView *headerView;
@end



@implementation SuspendTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"TableView实现的滑动悬停";
    [self addSubView];
}

- (void)addSubView
{
    self.view.backgroundColor = [UIColor blueColor];
    
    self.topLB = [self creatLB];
    [self.topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(TopMargin);
        make.height.mas_equalTo(TopHeight);
        make.left.right.equalTo(self.view);
    }];
    self.topLB.text = @"不可下拉顶部LB";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, TopMargin+TopHeight, screen_width, 800) style:UITableViewStylePlain];
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
    if (section==0) {
        return 2;
    }else if (section==1){
        return 40;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.0001;
    }else if (section==1){
        return 40;
    }
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    if (indexPath.section==0) {
        UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor = RandomColor;
        
        cell.textLabel.text =@"跟随滑动顶部";
        return cell;
    }else if (indexPath.section==1){
        UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor = RandomColor;
        
        cell.textLabel.text = [NSString stringWithFormat:@"cell位置---->%ld",indexPath.row];
        return cell;
    }
   
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screen_width, 40)];
        lb.backgroundColor = [UIColor grayColor];
        lb.text = @"悬浮控件";
        return lb;
    }else{
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 20)];
        view.backgroundColor = [UIColor yellowColor];
        return view;
    }
    return nil;
}
@end
