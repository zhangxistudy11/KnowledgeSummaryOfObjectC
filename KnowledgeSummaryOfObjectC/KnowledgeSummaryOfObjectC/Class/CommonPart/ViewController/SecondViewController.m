//
//  SecondViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2024/3/21.
//  Copyright © 2024 张玺. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Second Page";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 100)];
    label.text = @"This is second page.\nWait 5 seconds and check if the first page is still rendering.";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end 