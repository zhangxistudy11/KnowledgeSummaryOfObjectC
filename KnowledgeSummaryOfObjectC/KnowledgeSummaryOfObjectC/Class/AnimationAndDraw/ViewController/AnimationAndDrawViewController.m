//
//  ViewController.m
//  iOS_动画
//
//  Created by 张玺 on 16/2/17.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "AnimationAndDrawViewController.h"
#import "UIView+Extension.h"
#import "CAShaplayerViewController.h"
#import "UIBezierPathViewController.h"
#import "CAGradientLayerViewController.h"
#import "EarningsViewController.h"
#import "TransformViewController.h"
#import "KeyFrameViewController.h"
#import "HUDViewController.h"
#import "CustomHudViewController.h"
#import "CGAffineTransformViewController.h"
#import "CoverViewController.h"
#import "ProgressAnimationViewController.h"
@interface AnimationAndDrawViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}
@end

@implementation AnimationAndDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading tffffhe view, typically from a nib.
    self.title = @"动画与绘图";
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
            cell.textLabel.text = @"1-UIBezierPath使用";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"2-CAShaplayer使用";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"3-CAGradientLayer使用";
            return cell;
            break;
        case 3:
            cell.textLabel.text = @"4-收益折线渐变图";
            return cell;
            break;
        case 4:
            cell.textLabel.text = @"5-基本动画";
            return cell;
            break;
        case 5:
            cell.textLabel.text = @"6-关键帧动画";
            return cell;
            break;
        case 6:
            cell.textLabel.text = @"7-HUD动画";
            return cell;
            break;
        case 7:
            cell.textLabel.text = @"8-自定义加载动画";
            return cell;
            break;
        case 8:
            cell.textLabel.text = @"9-仿射变换";
            return cell;
            break;
        case 9:
            cell.textLabel.text = @"9-遮罩图形";
            return cell;
            break;
        case 10:
            cell.textLabel.text = @"10-进度条";
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
            UIBezierPathViewController * vc = [[UIBezierPathViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
            CAShaplayerViewController * vc = [[CAShaplayerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            
            CAGradientLayerViewController * vc = [[CAGradientLayerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            EarningsViewController * vc = [[EarningsViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            TransformViewController * vc = [[TransformViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            KeyFrameViewController * vc = [[KeyFrameViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            HUDViewController * vc = [[HUDViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            CustomHudViewController  * vc = [[CustomHudViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8:
        {
             CGAffineTransformViewController * vc = [[CGAffineTransformViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 9:
        {
            CoverViewController * vc = [[CoverViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 10:
        {
            ProgressAnimationViewController * vc = [[ProgressAnimationViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
