//
//  FloatSlideViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/5/11.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "FloatSlideViewController.h"
#import "FloatSlideCell.h"
#define kTableDeaultOrginY  200
#define kMinTopMargin 100

@interface FloatSlideViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,FloatSlideCellMoveTopDelegate>

@property (nonatomic,strong) UITableView *outTableView;

@property (nonatomic,strong) FloatSlideCell *innerCell;

@property (nonatomic, assign) BOOL canScroll;

@end

@implementation FloatSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"111");
    self.navigationItem.title = @"滑动停止";
    
    [self setUpView];
}
- (void)setUpView
{
    self.canScroll = YES;
    self.outTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTableDeaultOrginY, screen_width, 700)];
    [self.view addSubview:self.outTableView];
    self.outTableView.delegate = self;
    self.outTableView.dataSource = self;
    //self.outTableView.bounces = NO;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat outerOffset = scrollView.contentOffset.y;
    if (outerOffset>=kMinTopMargin) {
        self.outTableView.contentOffset = CGPointMake(0, kMinTopMargin);
          self.outTableView.scrollEnabled = NO;
        if (self.canScroll){
            self.canScroll = NO;
            //self.innerCell.cellCanScroll = YES;


        }
       
    }else{
        if (!self.canScroll) {
            self.outTableView.contentOffset = CGPointMake(0, kMinTopMargin);
              self.outTableView.scrollEnabled = NO;
             [self.innerCell innerCanScroll:YES];
        }else{
            self.outTableView.contentOffset = CGPointMake(0, outerOffset);
        }
    }
}
- (void)didMoveTop
{
    self.canScroll = YES;
//    self.innerCell.cellCanScroll = NO;
          [self.innerCell innerCanScroll:NO];
    self.outTableView.scrollEnabled = YES;

}
#pragma mark - UITableViewDelegate &&DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 50;
    }
    return 1000;
   // return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"222"];
//    cell.textLabel.text = @"fadfadf";
//    cell.backgroundColor = RandomColor;
//    return cell;
    if (indexPath.row == 0) {
        UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"222"];
        cell.textLabel.text = @"fadfadf";
        cell.backgroundColor = [UIColor cyanColor];
        return cell;
    }
    else if (indexPath.row ==1){
        return self.innerCell;
    }
    return nil;
}
#pragma mark - GetterMethod
- (FloatSlideCell *)innerCell
{
    if (!_innerCell) {
        _innerCell = [[FloatSlideCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111" height:1000];
        _innerCell.delegate = self;
    }
    return _innerCell;
}

@end
