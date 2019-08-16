//
//  CustomTabbarViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "CustomTabbarViewController.h"
#import "ZTFlightTabItemsView.h"
#import "ZTFlightTabBarView.h"
@interface CustomTabbarViewController ()
@property (nonatomic,strong)ZTFlightTabItemsView *slideTabView;
@property (nonatomic,strong) ZTFlightTabBarView *tabBarView;

@end

@implementation CustomTabbarViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"自定义TabBar";
    [self addSubView];
}
- (void)addSubView{
//    [self.view addSubview:self.slideTabView];
    self.tabBarView = [[ZTFlightTabBarView alloc]initWithFrame:CGRectMake(0, 200, screen_width, 50) titles:@[@"国内",@"国际/港澳台(中国)",@"特价"]];
    [self.view addSubview:self.tabBarView];
    self.tabBarView.horizontalMargin = 20;
    self.tabBarView.fontSize = 15;
    self.tabBarView.lineColor = [UIColor blueColor];
    self.tabBarView.linePadding = 5;
    self.tabBarView.itemColor = [UIColor blackColor];
    self.tabBarView.itemSelctedColor = [UIColor blueColor];
    [self.tabBarView setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"%ld位置",index);

    }];
//    self.tabBarView.titles = @[@"国内",@"国际/港澳台(中国)",@"特价"];

}
-(ZTFlightTabItemsView *)slideTabView
{
    if (!_slideTabView) {
        _slideTabView = [[ZTFlightTabItemsView alloc]initWithFrame:CGRectMake(0, 200, screen_width, 50)];
        _slideTabView.lineColor = [UIColor blueColor];
        _slideTabView.itemColor = [UIColor blackColor] ;
        _slideTabView.itemSelctedColor = [UIColor blueColor];
        _slideTabView.itemWidth = _slideTabView.bounds.size.width/3;
        _slideTabView.font = [UIFont boldSystemFontOfSize:18];
        _slideTabView.backgroundColor = [UIColor whiteColor];
//        _slideTabView.titles = @[@"国内",@"国际/港澳台",@"特价"];
        _slideTabView.titles = @[@"国内",@"国际/港澳台(中国)",@"特价"];

        [_slideTabView makeItemSelectedBlock:^(NSInteger index) {
            NSLog(@"%ld位置",index);
        }];
        
    }
    return _slideTabView;
}
@end
