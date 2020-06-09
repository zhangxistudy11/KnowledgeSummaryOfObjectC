//
//  TableLeftSlideViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/6/8.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "TableLeftSlideViewController.h"

@interface TableLeftSlideViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)  UITableView  *tableView;
@property (nonatomic, strong) UIImageView *superImav;

@end

@implementation TableLeftSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"左滑动画";
    
    [self  setUpView];
}

- (void)setUpView
{
    _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, self.view.width
                                                               , self.view.height + 100) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view  addSubview:_tableView];
    
    for (UIGestureRecognizer *ges in self.tableView.gestureRecognizers) {
        if ([ges isKindOfClass:NSClassFromString(@"_UISwipeActionPanGestureRecognizer")]) {
            [ges addTarget:self action:@selector(_swipeRecognizerDidRecognize:)];
        }
    }
    
}
- (void)_swipeRecognizerDidRecognize:(UISwipeGestureRecognizer *)swip {
    [_superImav removeFromSuperview];
    _superImav = nil;
    /*
    CGPoint currentPoint = [swip locationInView:self.tableView];
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        if (CGRectContainsPoint(cell.frame, currentPoint)) {
            if (cell.frame.origin.x > 0) {
                cell.frame = CGRectMake(0, cell.frame.origin.y,cell.bounds.size.width, cell.bounds.size.height);
            }
        }
    }
     */
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    cell.textLabel.text = @"发剪短发；发剪短发";
    return cell;
}


- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)){
    
    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:[NSString stringWithFormat:@"             "] handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"第一个");
        NSLog(@"viewName:%@",NSStringFromClass([sourceView class]));

//        action.image =  [UIImage imageNamed:@"back_resizab"];
        if (self.superImav.superview) { // 说明确认删除Label显示在界面上
            NSLog(@"确认删除");
        } else {
            NSLog(@"显示确认删除Label");
            // 核心代码
            UIView *rootView = nil; // 这个根view指的是UISwipeActionPullView，最上层的父view
            
//            if ([sourceView isKindOfClass:NSClassFromString(@"UISwipeActionStandardButton")]) {
                rootView = sourceView.superview;
////                self.sureDeleteLabel.font = ((UILabel *)sourceView).font;
//            }
            self.superImav.frame = CGRectMake(rootView.width-15, 20, 0, rootView.height-40);
//            NSLog(@"sourceView-frame%@",NSStringFromCGRect(sourceView.frame));
//            NSLog(@"superImav-frame%@",NSStringFromCGRect(self.superImav.frame));


            [rootView addSubview:self.superImav];

            [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect labelFrame = self.superImav.frame;
                labelFrame.origin.x = 15;
                labelFrame.size.width = rootView.width-30;
                self.superImav.frame = labelFrame;
            } completion:^(BOOL finished) {

            }];
        }
    }];
    deleteRowAction.image = [UIImage imageNamed:@"bbbb"];
    deleteRowAction.backgroundColor = [UIColor cyanColor];

    
    
    UIContextualAction *remarkAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"第二个");

        // 如果确认删除Label显示在界面上，那么本次点击备注的区域响应确认删除按钮事件
        if(self.superImav.superview) {
            NSLog(@"确认删除");
        } else {
            NSLog(@"备注");
        }
    }];
//    remarkAction.image = [UIImage imageNamed:@"aaaa"];
    UISwipeActionsConfiguration *config;
    if (indexPath.row%2 == 0) {
        config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];
    }else {
        config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction,remarkAction]];
    }
    config.performsFirstActionWithFullSwipe = NO;
    
    return config;
}

- (UIImageView *)superImav {
    if (!_superImav) {
        _superImav = [[UIImageView alloc]init];
        _superImav.image = [UIImage imageNamed:@"back_resizab"];
    }
    return _superImav;
}


@end
