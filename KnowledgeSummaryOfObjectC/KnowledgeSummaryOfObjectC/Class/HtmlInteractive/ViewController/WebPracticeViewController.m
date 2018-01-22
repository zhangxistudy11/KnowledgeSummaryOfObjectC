//
//  WebPracticeViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/11.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "WebPracticeViewController.h"
#import "JSCallNativeViewController.h"
#import "LoadHtmlViewController.h"
@interface WebPracticeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation WebPracticeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HTML交互";
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
            cell.textLabel.text = @"1-WebViewJavascriptBridge调原生";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"2-加载本地Html";
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
            JSCallNativeViewController * vc = [[JSCallNativeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
            LoadHtmlViewController * vc = [[LoadHtmlViewController alloc]init];
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
