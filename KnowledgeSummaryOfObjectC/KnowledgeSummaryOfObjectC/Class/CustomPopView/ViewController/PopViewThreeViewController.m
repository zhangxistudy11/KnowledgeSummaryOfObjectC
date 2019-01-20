//
//  PopViewThreeViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/9/27.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "PopViewThreeViewController.h"

@interface PopViewThreeViewController ()

@end

@implementation PopViewThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"PopView的方法二";
    
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: [self createItemButtonWith:@"弹起" action:@"pop"], [self createItemButtonWith:@"隐藏" action:@"hide"],nil]];
}

#pragma mark - Private Methods
- (UIBarButtonItem *)createItemButtonWith:(NSString *)title action:(NSString *)funString
{
    UIButton *pulishButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
    pulishButton.frame = CGRectMake(0, 0, 50, 30);
    [pulishButton setTitle:title forState:(UIControlStateNormal)];
    [pulishButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    pulishButton.layer.masksToBounds=YES;
    pulishButton.layer.cornerRadius=3;
    pulishButton.titleLabel.font=[UIFont systemFontOfSize:15];
    pulishButton.backgroundColor=[UIColor whiteColor];
    SEL selector = NSSelectorFromString(funString);
    [pulishButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *pulish = [[UIBarButtonItem alloc] initWithCustomView:pulishButton];
    return pulish;
}
#pragma mark - Target Methods
- (void)pop
{
//    NSLog(@"aa");
//    _popTwo = [[PopViewTwo alloc]initWithFrame:self.view.bounds];
//    [_popTwo show];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login"
                                                                             message:@"Enter Your Account Info Below"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 2.1 添加文本框
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"username";
//    }];
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"password";
//        textField.secureTextEntry = YES;
//    }];
    [self presentViewController:alertController animated:YES completion:nil];

   
}
- (void)hide
{
//    NSLog(@"bb");
//    [_popTwo hide];
}
@end
