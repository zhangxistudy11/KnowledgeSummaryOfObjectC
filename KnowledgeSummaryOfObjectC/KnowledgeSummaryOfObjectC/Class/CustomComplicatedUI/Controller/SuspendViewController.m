//
//  SuspendViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/1.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "SuspendViewController.h"
#import "SuspendTabTableViewCell.h"


#define TopMargin  100
#define HeaderPadding 20
#define HeaderHeight 200

@interface SuspendViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *topLB;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headerIV;

@property (nonatomic, strong) SuspendTabTableViewCell *suspendCell;
@property (nonatomic, strong) UIView *floatView;
@end

@implementation SuspendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"滑动悬停-新方案";
    [self addSubView];
}

- (void)addSubView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    

    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, HeaderHeight)];
//    self.headerView.backgroundColor = [UIColor cyanColor];
    
    self.headerIV = [[UIImageView alloc]initWithFrame:self.headerView.bounds];
    [self.headerView addSubview:self.headerIV];
    self.headerIV.image = [UIImage imageNamed:@"header.jpg"];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = self.headerView;
    
    [self.tableView registerClass:[SuspendTabTableViewCell class] forCellReuseIdentifier:@"SuspendTabTableViewCell"];
    
    self.floatView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_width, 40)];
    [self.view addSubview:self.floatView];
    self.floatView.backgroundColor = [UIColor cyanColor];
    self.floatView.hidden = YES;
//    self.floatView.alpha = 0;
    
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
    if (indexPath.row == 5) {
        static  NSString *  CellIdentifier = @"SuspendTabTableViewCell";
        SuspendTabTableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        self.suspendCell = cell;
        [cell setClickTabBlock:^(NSInteger index) {
            [self.tableView reloadData];
        }];
        return cell;
    } else {
        static  NSString *  CellIdentifier = @"CellIdentifier";
        UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.textLabel.text = [NSString stringWithFormat:@"cell位置:%ld",(long)indexPath.row];
        return cell;
    }
    return nil;
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float ofsetY = scrollView.contentOffset.y;
    float limitY = self.headerView.frame.size.height + 40*5;
    if (ofsetY >= limitY) {
        [self.floatView addSubview:self.suspendCell.contentView];
        self.floatView.hidden = NO;
    } else {
        self.floatView.hidden = YES;
        [self.suspendCell addSubview:self.suspendCell.contentView];
    }
}
@end
