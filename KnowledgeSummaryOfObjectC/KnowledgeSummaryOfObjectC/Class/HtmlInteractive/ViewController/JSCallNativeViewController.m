//
//  JSCallNativeViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/27.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "JSCallNativeViewController.h"
#import "WebViewJavascriptBridge.h"
#import <AVFoundation/AVFoundation.h>
@interface JSCallNativeViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView * webView;

@property WebViewJavascriptBridge* webViewBridge;
@end

@implementation JSCallNativeViewController

#pragma mark - ViewController  Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"JS调用原生";
    
    [self test1];
}

#pragma mark - Private Methods
- (void)test1
{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    
    // UIWebView 滚动的比较慢，这里设置为正常速度
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self.webView loadRequest:request];
    
    
    _webViewBridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    // {setWebViewDelegate}这个方法，可以将UIWebView的代理，从_webViewBridge中再传递出来。
    // 所以如果你要在控制器中实现UIWebView的代理方法时，添加下面这样代码，否则可以不写。
    [_webViewBridge setWebViewDelegate:self];
    
    // 添加JS 要调用的Native 功能
    [self registerNativeFunctions];
}

- (void)registerNativeFunctions
{
    [self registScanFunction];
    
    [self registShareFunction];
//
//    [self registLocationFunction];
//    
//    [self regitstBGColorFunction];
//    
//    [self registPayFunction];
//
    [self registShakeFunction];
}
- (void)rightClick
{
    //    // 如果不需要参数，不需要回调，使用这个
    //    [_webViewBridge callHandler:@"testJSFunction"];
    //    // 如果需要参数，不需要回调，使用这个
    //    [_webViewBridge callHandler:@"testJSFunction" data:@"一个字符串"];
    // 如果既需要参数，又需要回调，使用这个
    [_webViewBridge callHandler:@"testJSFunction" data:@"一个字符串" responseCallback:^(id responseData) {
        NSLog(@"调用完JS后的回调：%@",responseData);
    }];
}
- (void)registScanFunction
{
    // 注册的handler 是供 JS调用Native 使用的。
    [_webViewBridge registerHandler:@"scanClick" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"扫一扫");
        NSString *scanResult = @"http://www.baidu.com";
        responseCallback(scanResult);
    }];
}
- (void)registShareFunction
{
    [_webViewBridge registerHandler:@"shareClick" handler:^(id data, WVJBResponseCallback responseCallback) {
        // data 的类型与 JS中传的参数有关
        NSDictionary *tempDic = data;
        // 在这里执行分享的操作
        NSString *title = [tempDic objectForKey:@"title"];
        NSString *content = [tempDic objectForKey:@"content"];
        NSString *url = [tempDic objectForKey:@"url"];
        
        // 将分享的结果返回到JS中
        NSString *result = [NSString stringWithFormat:@"分享成功:%@,%@,%@",title,content,url];
      //  responseCallback(result);
    }];
}

- (void)registShakeFunction
{
    [_webViewBridge registerHandler:@"shakeClick" handler:^(id data, WVJBResponseCallback responseCallback) {
        AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
    }];
}
@end
