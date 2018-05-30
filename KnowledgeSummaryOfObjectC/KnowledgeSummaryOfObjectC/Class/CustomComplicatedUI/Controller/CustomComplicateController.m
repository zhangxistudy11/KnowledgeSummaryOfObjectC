//
//  CustomComplicateController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/10/17.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "CustomComplicateController.h"
#import "LoopViewController.h"
#import "DynamicImageViewController.h"
#import "SlideViewController.h"
#import "ButtonViewController.h"
#import "SlideMenuDemoController.h"
#import "FloatTableViewController.h"
#import "FloatSlideViewController.h"
#import "TranslucentCellViewController.h"
@interface CustomComplicateController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation CustomComplicateController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"复杂UI控件的封装";
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
            cell.textLabel.text = @"1-可循环利用的轮播图";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"2-gif动图";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"3-滑动悬停效果";
            return cell;
        case 3:
            cell.textLabel.text = @"4-UIButton的使用";
            return cell;
            break;
        case 4:
            cell.textLabel.text = @"5-侧滑按钮的使用";
            return cell;
            break;
        case 5:
            cell.textLabel.text = @"6-TableView联动";
            return cell;
            break;
        case 6:
            cell.textLabel.text = @"7-悬停滑动";
            return cell;
            break;
        case 7:
            cell.textLabel.text = @"8-tableview悬停滑动";
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
            LoopViewController * vc = [[LoopViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            DynamicImageViewController * vc = [[DynamicImageViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            SlideViewController * vc = [[SlideViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            ButtonViewController * vc = [[ButtonViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            SlideMenuDemoController * vc = [[SlideMenuDemoController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            FloatTableViewController * vc = [[FloatTableViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            FloatSlideViewController * vc = [[FloatSlideViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            TranslucentCellViewController * vc = [[TranslucentCellViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}



@end
