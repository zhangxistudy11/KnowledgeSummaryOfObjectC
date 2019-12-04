//
//  CustomPopViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/29.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "CustomPopViewController.h"
#import "PopViewOneController.h"
#import "PopViewTwoController.h"
#import "PopViewThreeViewController.h"
@interface CustomPopViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}


@end

@implementation CustomPopViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"111111aaaaaa");
    self.navigationItem.title = @"PopView的使用";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self  setUpView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti1) name:@"noti1" object:nil];
}
- (void)noti1{
    [self.navigationController popViewControllerAnimated:YES];
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
            cell.textLabel.text = @"1-PopView方法一cccbbb";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"2-PopView方法二bbbbbggggg";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"3-PopView方法三ccccddd";
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
            PopViewOneController * vc = [[PopViewOneController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            PopViewTwoController * vc = [[PopViewTwoController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            PopViewThreeViewController * vc = [[PopViewThreeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
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
