//
//  ThirdLibViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/4/20.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ThirdLibViewController.h"
#import "MansoryStudyController.h"
@interface ThirdLibViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation ThirdLibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"三方库的学习";
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
            cell.textLabel.text = @"0-Mansory学习";
            return cell;
            break;
//        case 1:
//            cell.textLabel.text = @"2-加载本地Html";
//            return cell;
//            break;
//        case 2:
//            cell.textLabel.text = @"3-JavaScriptCore熟悉";
//            return cell;
//            break;
//        case 3:
//            cell.textLabel.text = @"4-JavaScriptProtol熟悉";
//            return cell;
//            break;
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
            MansoryStudyController * vc = [[MansoryStudyController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
//        case 1:
//        {
//
//            LoadHtmlViewController * vc = [[LoadHtmlViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 2:
//        {
//            JavaScriptStuViewController * vc = [[JavaScriptStuViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
//        case 3:
//        {
//            JSProtocolViewController * vc = [[JSProtocolViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
        default:
            break;
    }
}

@end
