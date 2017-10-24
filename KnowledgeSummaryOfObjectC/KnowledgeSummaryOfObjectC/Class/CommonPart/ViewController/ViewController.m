//
//  ViewController.m
//  iOS_动画
//
//  Created by 张玺 on 16/2/17.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "MemoryManageViewController.h"
#import "AnimationAndDrawViewController.h"
#import "CrashLocationViewController.h"
#import "WebPracticeViewController.h"
#import "RACViewController.h"
#import "CustomPopViewController.h"
#import "sys/utsname.h"
#import "CustomComplicateController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Object_C知识总结";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
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
            cell.textLabel.text = @"0-内存管理";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"1-绘图与动画";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"2-闪退定位";
            return cell;
            break;
        case 3:
            cell.textLabel.text = @"3-WebView交互";
            return cell;
            break;
        case 4:
            cell.textLabel.text = @"4-ReactiveCocoa交互";
            return cell;
            break;
        case 5:
            cell.textLabel.text = @"5-PopView的使用";
            return cell;
            break;
        case 6:
            cell.textLabel.text = @"6-复杂UI控件的封装";
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
            MemoryManageViewController * vc = [[MemoryManageViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
        {
            AnimationAndDrawViewController * vc = [[AnimationAndDrawViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            CrashLocationViewController * vc = [[CrashLocationViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            WebPracticeViewController * vc = [[WebPracticeViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            RACViewController * vc = [[RACViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            CustomPopViewController * vc = [[CustomPopViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            CustomComplicateController * vc = [[CustomComplicateController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
#pragma mark - Target Methods
- (void)rightclick:(UIBarButtonItem *)sender
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    NSLog(@"platform:%@",platform);
}

@end
