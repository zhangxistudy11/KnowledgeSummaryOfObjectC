//
//  LoadHtmlViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/1/22.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "LoadHtmlViewController.h"

@interface LoadHtmlViewController ()

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation LoadHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"加载html";
    [self setUpView];
}

- (void)setUpView
{
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:@"/Users/zhangxi/Desktop/OCSummary/KnowledgeSummaryOfObjectC/KnowledgeSummaryOfObjectC/Resources/Html/index.html"]]];
   
    
}

@end
