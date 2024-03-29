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
#import "GetPrivateObjViewController.h"
#import "ZXSonViewController.h"

@interface RunTimeBasicViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation RunTimeBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"RunTime使用";
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
            cell.textLabel.text = @"0-方法熟悉";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"1-Method Swizzling";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"2-获取成员变量";
            return cell;
            break;
        case 3:
            cell.textLabel.text = @"3-修改私有属性";
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
            GetPrivateObjViewController * vc = [[GetPrivateObjViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 3:
        {
            ZXSonViewController * vc = [[ZXSonViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
    }
}


@end
