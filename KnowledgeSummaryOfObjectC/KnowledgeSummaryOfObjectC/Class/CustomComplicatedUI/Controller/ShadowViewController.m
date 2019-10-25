//
//  ShadowViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/10/24.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ShadowViewController.h"
#import "UIColor+Extension.h"

@interface ShadowViewController ()
@property (nonatomic, strong) UIView *firstView;
@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"阴影设置";
    [self setUpView];
}
- (void)setUpView
{
    self.firstView = [[UIView alloc]init];
    [self.view addSubview:self.firstView];
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(screen_width-100);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    self.firstView.backgroundColor = [UIColor cyanColor];
    
    self.firstView.layer.shadowColor = [UIColor colorWithString:@"#000000"].CGColor;
    self.firstView.layer.shadowOpacity = 0.04f;
    self.firstView.layer.shadowOffset = CGSizeMake(0,-2);


}


@end
