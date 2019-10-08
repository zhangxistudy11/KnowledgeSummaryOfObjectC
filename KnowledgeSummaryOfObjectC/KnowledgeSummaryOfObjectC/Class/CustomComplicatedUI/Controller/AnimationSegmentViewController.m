//
//  AnimationSegmentViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/10/8.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "AnimationSegmentViewController.h"
#import "ZHXSegmentBarView.h"

@interface AnimationSegmentViewController ()
@property (nonatomic,strong) ZHXSegmentBarView *tabBarView;

@end

@implementation AnimationSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"带动画的Segment";
    [self addSubView];
}
- (void)addSubView{
    //    [self.view addSubview:self.slideTabView];
    self.tabBarView = [[ZHXSegmentBarView alloc]initWithFrame:CGRectMake(0, 170, screen_width, 50) titles:@[@"男装",@"女装",@"儿童服装"]];
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
    
    self.tabBarView.backgroundColor = [UIColor cyanColor];
}
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    @end
