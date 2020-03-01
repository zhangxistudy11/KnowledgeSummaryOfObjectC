//
//  EventInteraction ViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/1/6.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "EventInteractionViewController.h"
#import "UIView+BlocksKit.h"
@interface EventInteractionViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *cyanView;
@property(nonatomic,strong) UITextView *textView;
@end

@implementation EventInteractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"事件交互";
    
    [self testOne];
}

/// 事件点击层级
- (void)testOne{
    self.redView = [[UIView alloc]init];
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(300);
        make.top.equalTo(self.view.mas_top).offset(84);
    }];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.userInteractionEnabled = YES;
    
    self.yellowView = [[UIView alloc]init];
    [self.redView addSubview:self.yellowView];
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.redView);
        make.width.height.mas_equalTo(200);
    }];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    self.yellowView.userInteractionEnabled = YES;
    
    
    self.cyanView = [[UIView alloc]init];
    [self.yellowView addSubview:self.cyanView];
    [self.cyanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.yellowView);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    self.cyanView.backgroundColor = [UIColor cyanColor];
    self.cyanView.userInteractionEnabled = YES;
    
    
    [self addEventMethod];
    
    self.textView = [[UITextView alloc]init];
    [self.view addSubview:self.textView];
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.height.mas_equalTo(150);
    }];
    
      NSString *test = @"<b>【活动规则】：<b><br/><font>1、国际机票回馈活动，最高返88元现金红包，可提现(需升级至最新版本APP参与)；</font><br/><br/><font>2、该红包在您完成订单时自动发放，您需要分享至微信好友，分享后24小时内达到好友帮拆数量条件即可获得红包金额，每订单最高可返88元；</font><br/><br/><font>3、活动发起24小时红包开启，具体可返现金额以结束时红包金额为准；</font><br/><br/><font>4、红包成功开启后，金额在用户出行后到账，红包金额以现金方式直接划入APP钱包中，可提现。如用户取消订单或产生退票行为，好友帮拆的红包金额将不会到账或退票时需要扣除对应金额；</font><br/><br/><font>5、下单完成后，72小时内用户未分享视为不参与活动，活动结束；</font><br/><br/><font>6、活动中，参与用户如出现不正当行为，包括作弊、扰包括作弊、扰乱系统、网络攻击等，活动发起方有权取消其返现金额并终止其参与本次活动包括作弊、扰乱系统、网络攻击等，活动发起方有权取消其返现金额并终止其参与本次活动包括作弊、扰乱系统、网络攻击等，活动发起方有权取消其返现金额并终止其参与本次活动包括作弊、扰乱系统、网络攻击等，活动发起方有权取消其返现金额并终止其参与本次活动包括作弊、扰乱系统、网络攻击等，活动发起方有权取消其返现金额并终止其参与本次活动乱系统、网络攻击等，活动发起方有权取消其返现金额并终止其参与本次活动的资格。<br/>";
//    self.textView.text = test;
    
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[test dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        self.textView.attributedText = attributedString;
    self.textView.editable = NO;
}
- (void)addEventMethod{
    [self.yellowView bk_whenTapped:^{
        NSLog(@"点击了黄色模块了");
    }];
}

@end
