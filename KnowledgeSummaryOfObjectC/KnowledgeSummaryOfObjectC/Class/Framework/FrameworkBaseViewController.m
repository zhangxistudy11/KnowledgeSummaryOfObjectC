//
//  FrameworkBaseViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "FrameworkBaseViewController.h"

@interface FrameworkBaseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation FrameworkBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"架构方面";
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
            cell.textLabel.text = @"0-事件交互";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"1-setNeedsLayout和layoutIfNeeded";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"2-图片拉伸";
            return cell;
            break;
        case 3:
            cell.textLabel.text = @"3-UIStackView使用";
            return cell;
            break;
        case 4:
            cell.textLabel.text = @"4-TableView左滑删除";
            return cell;
            break;
        case 5:
            cell.textLabel.text = @"5-交换两个子view";
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
//        case 0:
//        {
//            EventInteractionViewController * vc = [[EventInteractionViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 1:
//        {
//
//            UpdateLayoutController * vc = [[UpdateLayoutController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 2:
//        {
//            ImageResizabVC * vc = [[ImageResizabVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 3:
//        {
//            StackViewUseController * vc = [[StackViewUseController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 4:
//        {
//            TableLeftSlideViewController * vc = [[TableLeftSlideViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 5:
//        {
//            ChangeTwoViewController * vc = [[ChangeTwoViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
            
        default:
            break;
    }
}


@end
