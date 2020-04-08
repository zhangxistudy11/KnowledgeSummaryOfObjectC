//
//  RacLoginExampleController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/20.
//  Copyright © 2020 张玺. All rights reserved.
//
/*
 认知：
 ReactiveCocoa是github去年开源的一个项目，是在iOS平台上对FRP的实现。FRP的核心是信号，信号在ReactiveCocoa(以下简称RAC)中是通过RACSignal来表示的，信号是数据流，可以被绑定和传递。
 可以把信号想象成水龙头，只不过里面不是水，而是玻璃球(value)，直径跟水管的内径一样，这样就能保证玻璃球是依次排列，不会出现并排的情况(数据都是线性处理的，不会出现并发情况)。水龙头的开关默认是关的，除非有了接收方(subscriber)，才会打开。这样只要有新的玻璃球进来，就会自动传送给接收方。可以在水龙头上加一个过滤嘴(filter)，不符合的不让通过，也可以加一个改动装置，把球改变成符合自己的需求(map)。也可以把多个水龙头合并成一个新的水龙头(combineLatest:reduce:)，这样只要其中的一个水龙头有玻璃球出来，这个新合并的水龙头就会得到这个球。
 */

#import "RacLoginExampleController.h"
#import "RWDummySignInService.h"

@interface RacLoginExampleController ()
@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *signInButton;
@property(nonatomic,strong) RWDummySignInService *signInService;
@end

@implementation RacLoginExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.signInService = [[RWDummySignInService alloc]init];
    self.navigationItem.title = @"RAC登录的例zzzz子";
    [self setUpView];
    [self layoutUI];
    [self RACStudy];
}

- (void)setUpView{
    self.usernameTextField = [[UITextField alloc]init];
    [self.view addSubview:self.usernameTextField];
    self.usernameTextField.backgroundColor = [UIColor cyanColor];
    self.usernameTextField.placeholder = @"请999输ppp入账号";
    
    
    self.passwordTextField = [[UITextField alloc]init];
    [self.view addSubview:self.passwordTextField];
    self.passwordTextField.backgroundColor = [UIColor grayColor];
    self.passwordTextField.placeholder = @"请6666输入密码";
    
    self.signInButton = [[UIButton alloc]init];
    [self.view addSubview:self.signInButton];
    [self.signInButton setTitle:@"登44222244333录" forState:UIControlStateNormal];
    self.signInButton.backgroundColor = [UIColor grayColor];
    self.signInButton.enabled = NO;

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
        return text.length>=4 ? @(YES):@(NO);
    }];
    //map使用:可以将信号传递出去的类型进行改变，进行一次映射 RAC
    RAC(self.usernameTextField,backgroundColor) = [validUsernameSignal map:^id(NSNumber * value) {
        return [value boolValue] ? [UIColor redColor]:[UIColor cyanColor];
    }];
//    [RACObserve(self.usernameTextField, backgroundColor) subscribeNext:^(id x) {
//        ZXLog(@"---%@",x);
//    }];
    
    RACSignal *validPasswordSignal = [self.passwordTextField.rac_textSignal map:^id(NSString *text) {
           return text.length>=4 ? @(YES):@(NO);
       }];
       //map使用
       RAC(self.passwordTextField,backgroundColor) = [validPasswordSignal map:^id(NSNumber * value) {
           return [value boolValue] ? [UIColor redColor]:[UIColor cyanColor];
       }];
    
    RACSignal *validUsernameSignal1 =
      [self.usernameTextField.rac_textSignal
        map:^id(NSString *text) {
          return text.length>4 ? @(YES):@(NO);
        }];

    RACSignal *validPasswordSignal1 =
      [self.passwordTextField.rac_textSignal
        map:^id(NSString *text) {
          return text.length>4 ? @(YES):@(NO);
        }];
    
    /*
     拆分：信号可以有多个订阅者和作为多个管道后续环节的来源。在上图中，验证账号和密码的布尔值信号就被单独拆分，并用于两个不同的方面。
     组合：多个信号可以组合为全新的信号。在这个例子中，两个布尔值信号被组合到了一起。但不局限于此，实际上你可以组合任意值类型的信号
     */
    
   [[RACSignal combineLatest:@[validPasswordSignal1,validUsernameSignal1] reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }] subscribeNext:^(NSNumber * valid) {
        self.signInButton.enabled = [valid boolValue];
        self.signInButton.backgroundColor = [valid boolValue]?[UIColor blueColor]:[UIColor grayColor];
    }];
     
    /*
    [[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        NSLog(@"登录成功");
    }];
     */
    /*
    [[[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside]map:^id(id value) {
        return [self signInSignal];
    }] subscribeNext:^(id x) {
        NSLog(@"---result%@",x);
    }];
    */
    /*
     flattenMap:将信号里嵌套的信号结果发送出来
     */
    /*
     doNext:环节。注意doNext:是一个副作用，所以block没有返回任何值；它并不影响事件的内容
     */
    [[[[self.signInButton
       rac_signalForControlEvents:UIControlEventTouchUpInside]
       doNext:^(id x) {
        
    }]
      flattenMap:^id(id value) {
        return [self signInSignal];
    }]
     subscribeNext:^(id x) {
//        self.signInButton.enabled = YES;

        NSLog(@"---result%@",x);
    }];
}
//创建一个假的服务器登录信号
- (RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.signInService signInWithUsername:self.usernameTextField.text password:self.passwordTextField.text complete:^(BOOL success) {
            [subscriber sendNext:@(success)];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
@end
#pragma mark - 另外两种事件类型：error和complete
/*
 - (RACSignal *)requestAccessToTwitterSignal {
  
   // 1 - define an error
   NSError *accessError = [NSError errorWithDomain:RWTwitterInstantDomain
                                              code:RWTwitterInstantErrorAccessDenied
                                          userInfo:nil];
  
   // 2 - create the signal
   @weakify(self)
   return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
     // 3 - request access to twitter
     @strongify(self)
     [self.accountStore
        requestAccessToAccountsWithType:self.twitterAccountType
          options:nil
       completion:^(BOOL granted, NSError *error) {
           // 4 - handle the response
 //可以发送失败
           if (!granted) {
             [subscriber sendError:accessError];
           } else {
             [subscriber sendNext:nil];
             [subscriber sendCompleted];
           }
         }];
     return nil;
   }];
 }
 */
/*
 deliverOn:切换线程
 [[[[[[self requestAccessToTwitterSignal]
 then:^RACSignal *{
   @strongify(self)
   return self.searchText.rac_textSignal;
 }]
 filter:^BOOL(NSString *text) {
   @strongify(self)
   return [self isValidSearchText:text];
 }]
 flattenMap:^RACStream *(NSString *text) {
   @strongify(self)
   return [self signalForSearchWithText:text];
 }]
 deliverOn:[RACScheduler mainThreadScheduler]]
 subscribeNext:^(id x) {
   NSLog(@"%@", x);
 } error:^(NSError *error) {
   NSLog(@"An error occurred: %@", error);
 }];
 */
#pragma mark -限流
/*
 throttle操作只有在时间间隔内没有接收到新的next事件时才会发送next事件给下一环节。这是不是相当简单！

 编译运行，这时搜索结果只在停止输入超过500毫秒时才会更新。这感觉好多了对吗？你的用户也会这么想的。

 
 */
