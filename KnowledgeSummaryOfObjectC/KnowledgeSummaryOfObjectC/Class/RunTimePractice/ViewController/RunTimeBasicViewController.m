//
//  RunTimeBasicViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/3/20.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "RunTimeBasicViewController.h"
#import "MethodPacticeViewController.h"
#import "MethodSwizzlingViewController.h"
@interface RunTimeBasicViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation RunTimeBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"111111");
    self.navigationItem.title = @"RunTime使用";
    NSLog(@"2222");
    [self  setUpView];
     NSLog(@"333");
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
            cell.textLabel.text = @"0-方法熟悉";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"1-Method Swizzling";
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
            MethodPacticeViewController * vc = [[MethodPacticeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            MethodSwizzlingViewController * vc = [[MethodSwizzlingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            
            
        }
            break;
        case 3:
        {
            
            
        }
            break;
        default:
            break;
    }
}


@end
