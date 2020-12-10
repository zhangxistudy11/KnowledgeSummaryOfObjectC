//
//  TestViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/4/17.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"TestVC";
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
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"test-index-%ld",indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"000");
            NSLog(@"adddssssaaaaa");
            
        }
            break;
        case 1:
        {
            NSLog(@"111");
            NSLog(@"2222");

            NSLog(@"bfffbbb");

        }
            break;
            case 3:
                   {
                       NSLog(@"aaa");
                       NSLog(@"333");

                       NSLog(@"cccc");
                       NSLog(@"bbggggb");
                   }
                       break;
            case 4:
                          {
                              NSLog(@"333");
                              NSLog(@"fccbbbc4h555hhh");

                          }
                              break;
            
        default:
            break;
    }
}
@end
