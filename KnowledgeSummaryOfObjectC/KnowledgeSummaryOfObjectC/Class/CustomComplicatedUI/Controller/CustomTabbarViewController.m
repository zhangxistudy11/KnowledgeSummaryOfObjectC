//
//  CustomTabbarViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "CustomTabbarViewController.h"
#import "ZHXCustomItemView.h"
#import "ZHXTabBarView.h"
@interface CustomTabbarViewController ()
@property (nonatomic,strong)ZHXCustomItemView *slideTabView;
@property (nonatomic,strong) ZHXTabBarView *tabBarView;
@property (nonatomic,strong) ZHXTabBarView *tabBarTwoView;
@property (nonatomic,strong) ZHXTabBarView *tabBarThreeView;

@end

@implementation CustomTabbarViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"自定义TabBar";
    [self addSubView];
}
- (void)addSubView{
//    [self.view addSubview:self.slideTabView];
    self.tabBarView = [[ZHXTabBarView alloc]initWithFrame:CGRectMake(0, 170, screen_width, 50) titles:@[@"男装",@"女装",@"儿童服装"]];
    [self.view addSubview:self.tabBarView];
    self.tabBarView.horizontalMargin = 20;
    self.tabBarView.fontSize = 15;
    self.tabBarView.lineColor = [UIColor blueColor];
    self.tabBarView.linePadding = 5;
    self.tabBarView.itemColor = [UIColor blackColor];
    self.tabBarView.itemSelctedColor = [UIColor blueColor];
    [self.tabBarView showBadgeAtIndex:1 title:@"减80" badgeStyle:@{@"backColor":@"#cccccc",@"textColor":@"#ffffff"}];

    [self.tabBarView setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"%ld位置",index);
    }];
    
    
    self.tabBarTwoView = [[ZHXTabBarView alloc]initWithFrame:CGRectMake(0, 300, screen_width, 50) titles:@[@"服务家电",@"电子商品"]];
    [self.view addSubview:self.tabBarTwoView];
    self.tabBarTwoView.backgroundColor = [UIColor grayColor];
    self.tabBarTwoView.horizontalMargin = 0;
    self.tabBarTwoView.fontSize = 15;
    self.tabBarTwoView.lineColor = [UIColor redColor];
    self.tabBarTwoView.linePadding = 5;
    self.tabBarTwoView.itemColor = [UIColor blackColor];
    self.tabBarTwoView.itemSelctedColor = [UIColor redColor];
    [self.tabBarTwoView showBadgeAtIndex:0 title:@"大促销" badgeStyle:@{@"backColor":@"#cccccc",@"textColor":@"#ffffff"}];
    
    [self.tabBarTwoView setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"%ld位置",index);
    }];
    
    self.tabBarThreeView = [[ZHXTabBarView alloc]initWithFrame:CGRectMake(0, 400, screen_width, 50) titles:@[@"机票",@"酒店",@"汽车/船票",@"火车票"]];
    [self.view addSubview:self.tabBarThreeView];
    self.tabBarThreeView.backgroundColor = [UIColor lightGrayColor];
    self.tabBarThreeView.horizontalMargin = 0;
    self.tabBarThreeView.fontSize = 15;
    self.tabBarThreeView.lineColor = [UIColor cyanColor];
    self.tabBarThreeView.linePadding = 5;
    self.tabBarThreeView.selectIndex = 2;
    self.tabBarThreeView.itemColor = [UIColor blackColor];
    self.tabBarThreeView.itemSelctedColor = [UIColor cyanColor];
    
    [self.tabBarThreeView setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"%ld位置",index);
    }];

}
-(ZHXCustomItemView *)slideTabView
{
    if (!_slideTabView) {
        _slideTabView = [[ZHXCustomItemView alloc]initWithFrame:CGRectMake(0, 200, screen_width, 50)];
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
