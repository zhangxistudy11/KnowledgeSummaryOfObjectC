//
//  BaseicKnowledgeViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/6.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "BaseicKnowledgeViewController.h"
#import "EventInteractionViewController.h"
#import "UpdateLayoutController.h"
#import "ImageResizabVC.h"
#import "StackViewUseController.h"
#import "TableLeftSlideViewController.h"
@interface BaseicKnowledgeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation BaseicKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基础知识点";
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
            EventInteractionViewController * vc = [[EventInteractionViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
            UpdateLayoutController * vc = [[UpdateLayoutController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            ImageResizabVC * vc = [[ImageResizabVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            StackViewUseController * vc = [[StackViewUseController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            TableLeftSlideViewController * vc = [[TableLeftSlideViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
