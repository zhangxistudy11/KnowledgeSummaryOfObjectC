//
//  TestUIViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/22.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "TestUIViewController.h"

@interface TestUIViewController ()
@property(nonatomic, strong) UISwitch *pushSwitch;

@end

@implementation TestUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TestVC";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self  setUpView];
    
}
- (void)setUpView{
    _pushSwitch = [[UISwitch alloc] init];
         
           //设置按钮在屏幕中心
           _pushSwitch.center = CGPointMake(self.view.center.x, self.view.center.y);

    [self.view addSubview:self.pushSwitch];
    
    [self.pushSwitch setOn:YES];

}

@end
