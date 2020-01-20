//
//  RacLoginExampleController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/20.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "RacLoginExampleController.h"

@interface RacLoginExampleController ()
@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *signInButton;
@end

@implementation RacLoginExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"RAC登录的例子";
    [self setUpView];
    [self layoutUI];
    [self RACStudy];
}

- (void)setUpView{
    self.usernameTextField = [[UITextField alloc]init];
    [self.view addSubview:self.usernameTextField];
    self.usernameTextField.backgroundColor = [UIColor cyanColor];
    self.usernameTextField.placeholder = @"请输入账号";
    
    
    self.passwordTextField = [[UITextField alloc]init];
    [self.view addSubview:self.passwordTextField];
    self.passwordTextField.backgroundColor = [UIColor grayColor];
    self.passwordTextField.placeholder = @"请输入密码";
    
    self.signInButton = [[UIButton alloc]init];
    [self.view addSubview:self.signInButton];
    [self.signInButton setTitle:@"登录" forState:UIControlStateNormal];
    self.signInButton.backgroundColor = [UIColor blueColor];

}
- (void)layoutUI{
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
        make.top.equalTo(self.view.mas_top).offset(200);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.centerX.equalTo(self.usernameTextField);
        make.top.equalTo(self.usernameTextField.mas_bottom).offset(90);
    }];
    
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.centerX.equalTo(self.usernameTextField);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(90);

    }];
}
- (void)RACStudy{
    RACSignal *validUsernameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
        return text.length>=3 ? @(YES):@(NO);
    }];
    RAC(self.usernameTextField,backgroundColor) = [validUsernameSignal map:^id(id value) {
        return validUsernameSignal ? [UIColor redColor]:[UIColor cyanColor];
    }];
}
@end
