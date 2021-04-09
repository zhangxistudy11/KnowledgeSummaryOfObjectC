//
//  GetTopViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/4/8.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "GetTopViewController.h"

@interface GetTopViewController ()

@end

@implementation GetTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"获取最顶层VC";
    [self test1];
    [self test2];
}

- (void)test1 {
    UIViewController * aa = [self topViewController];
    NSLog(@"%@",aa);
}

- (void)test2 {
    UIViewController * bb = [self getCurrentVC];
    NSLog(@"%@",bb);
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}



//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    //拿到keyWindow 的 rootVC
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 如果根VC 有 present 出来的，拿到present出来的  当根vc
        rootVC = [rootVC presentedViewController];
    }

    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController ，根据选中的继续递归查找
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController ，根据 visible 继续查找
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}

@end
