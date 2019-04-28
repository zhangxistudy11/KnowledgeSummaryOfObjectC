//
//  ProgressAnimationViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/3/28.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ProgressAnimationViewController.h"
#import "ProgressAnimationView.h"
@interface ProgressAnimationViewController ()
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) ProgressAnimationView *customView;
@end

@implementation ProgressAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"Progress动画";
    
    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:firstBtn];
    firstBtn.backgroundColor = [UIColor blueColor];
    firstBtn.frame = CGRectMake(10, 100, 60, 30);
    [firstBtn setTitle:@"begin" forState:UIControlStateNormal];
    [firstBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:twoBtn];
    twoBtn.backgroundColor = [UIColor blueColor];
    twoBtn.frame = CGRectMake(80, 100, 60, 30);
    [twoBtn setTitle:@"first" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(first) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:threeBtn];
    threeBtn.backgroundColor = [UIColor blueColor];
    threeBtn.frame = CGRectMake(170, 100, 60, 30);
    [threeBtn setTitle:@"two" forState:UIControlStateNormal];
    [threeBtn addTarget:self action:@selector(two) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    [self setUpProgressView];
      [self setUpCustomProgressView];
}
- (void)setUpCustomProgressView
{
    self.customView = [[ProgressAnimationView alloc]initWithFrame:CGRectMake(0, 400, screen_width, 40)];
    [self.view addSubview:self.customView];
//    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(400);
////        make.width.mas_equalTo(screen_width);
//        make.left.right.equalTo(self.view);
//    }];
//    self.customView.he/ight = 40.0f;
}
- (void)setUpProgressView
{
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.frame = CGRectMake(0, 200, screen_width, 40);
    [self.view addSubview:self.progressView];
//    NSLog( @"%@",NSStringFromCGRme));
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 40/(float)2.0f);
    self.progressView.transform = transform;
}

- (void)show
{
    [self.customView defaultProgress];
    
//    [UIView animateWithDuration:2 animations:^{
//         [self.progressView setProgress:0.3 animated:YES];
//    }];
   
}
- (void)first
{
    [self.customView animationProgessToValue:0.5 druation:3];
}
- (void)two
{
    [self.customView animationProgessToValue:0.9 druation:2];
}
//- (void)hide
//{
////    [UIView animateWithDuration:0.1 animations:^{
////        [self.progressView setProgress:0.8 animated:YES];
////    }];
//}
- (void)rightclick
{
    [self.customView endAnimationProgress];
//    [self.progressView setProgress:0.0 animated:YES];

}
@end
