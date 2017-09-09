//
//  CAShaplayerViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/6.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "UIBezierPathViewController.h"

//views
#import "UIBezierPathCustomView.h"

@interface UIBezierPathViewController ()

@end

@implementation UIBezierPathViewController



#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"UIBezierPath";
    
    UIBezierPathCustomView * view = [[UIBezierPathCustomView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    
}


@end
