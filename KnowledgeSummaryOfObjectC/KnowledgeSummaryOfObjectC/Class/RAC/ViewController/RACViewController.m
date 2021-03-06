//
//  RACViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/26.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "RACViewController.h"
#import "RacPrimaryController.h"
#import "RacAdvanceController.h"
#import "RacLoginExampleController.h"
#import "RACGrammarViewController.h"
@interface RACViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ReactiveCocoa使用";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self  setUpView];
}
- (void)setUpView
{
    _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, self.view.width
                                                               , self.view.height + 100) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view  addSubview:_tableView];
    
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"1-RAC初步了解";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"2-RAC进阶使用";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"3-RAC登录的例子";
            return cell;
            break;
        case 3:
            cell.textLabel.text = @"4-RAC语法学习";
            return cell;
            break;
        default:
            break;
    }
    
    cell.textLabel.text = @"待使用";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            RacPrimaryController * vc = [[RacPrimaryController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            RacAdvanceController * vc = [[RacAdvanceController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            RacLoginExampleController * vc = [[RacLoginExampleController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            RACGrammarViewController * vc = [[RACGrammarViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
    }
}



@end
