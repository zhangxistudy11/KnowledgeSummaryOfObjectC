//
//  CustomHudViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/12/25.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "CustomHudViewController.h"
#import "SCCatWaitingHUD.h"
@interface CustomHudViewController ()

@end

@implementation CustomHudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"自定义加载动画";
    
    UIButton *saveButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [saveButton setTitle:@"show" forState:(UIControlStateNormal)];
    [saveButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    saveButton.layer.masksToBounds=YES;
    saveButton.layer.cornerRadius=3;
    saveButton.titleLabel.font=[UIFont systemFontOfSize:15];
    saveButton.backgroundColor= [UIColor whiteColor];
    [saveButton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *pulishButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [pulishButton setTitle:@"hide" forState:(UIControlStateNormal)];
    [pulishButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    pulishButton.layer.masksToBounds=YES;
    pulishButton.layer.cornerRadius=3;
    pulishButton.titleLabel.font=[UIFont systemFontOfSize:15];
    pulishButton.backgroundColor=[UIColor whiteColor];
    [pulishButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    pulishButton.frame = CGRectMake(0, 0, 50, 30);
    saveButton.frame=CGRectMake(0, 0, 50, 30);
    
    UIBarButtonItem *pulish = [[UIBarButtonItem alloc] initWithCustomView:pulishButton];
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithCustomView:saveButton];
    
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: pulish, save,nil]];
}
- (void)show
{
    [[SCCatWaitingHUD sharedInstance] animateWithInteractionEnabled:NO];
}
- (void)hide
{
    [[SCCatWaitingHUD sharedInstance] stop];
}
@end
