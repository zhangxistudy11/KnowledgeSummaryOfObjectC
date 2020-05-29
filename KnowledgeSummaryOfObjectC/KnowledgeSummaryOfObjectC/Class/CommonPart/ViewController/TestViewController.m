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
            NSArray * arr = nil;
            [arr count];
            NSLog(@"ddd%ld",arr.count);
            NSLog(@"adddaa");
            [self testOne];
        }
            break;
        case 1:
        {
            

            NSLog(@"bbbb");

        }
            break;
            case 3:
                   {
                       
                       NSLog(@"cccc");

                   }
                       break;
            case 4:
                          {
                              
                              NSLog(@"fccbbbc4h555hhh");

                          }
                              break;
            
        default:
            break;
    }
}
- (void)testOne{
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:@[@(3),@(8),@(5),@(6),@(9),@(11),@(0),@(7)]];
    NSInteger sun = 11;
    [self sumtest:array andSum:sun];
}
- (void)sumtest:(NSMutableArray *)array andSum:(NSInteger)sum{
    for (int i=0; i<array.count; i++) {
        for (NSInteger j = array.count-1; j>i; j--) {
            NSInteger dd = [array[i] integerValue] + [array[j] integerValue];
            if (dd == sum) {
                NSLog(@"%@",@[@(i),@(j)]);
            }
        }
    }
}
@end
