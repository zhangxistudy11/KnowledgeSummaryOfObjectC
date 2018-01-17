//
//  HUDViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/12/25.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "HUDViewController.h"
#import "MBProgressHUD.h"
#import "SCCatWaitingHUD.h"
@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"HUD动画展示";
    
    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:firstBtn];
    firstBtn.backgroundColor = [UIColor blueColor];
    firstBtn.frame = CGRectMake(10, 100, 100, 50);
    [firstBtn setTitle:@"Show" forState:UIControlStateNormal];
    [firstBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:twoBtn];
    twoBtn.backgroundColor = [UIColor blueColor];
    twoBtn.frame = CGRectMake(150, 100, 100, 50);
    [twoBtn setTitle:@"Hide" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark - Target Methods
- (void)rightclick:(UIBarButtonItem *)sender
{
  //[MBProgressHUD hideHUDForView:self.view animated:YES];
     [[SCCatWaitingHUD sharedInstance] animateWithInteractionEnabled:YES];
}
- (void)show
{
    CGFloat size = 100;
    NSMutableArray *imaMutabArr = [NSMutableArray array];
    for (int i=2; i<30; i++) {
        NSString *ima = [NSString stringWithFormat:@"Coin_loading_%d",i];
        [imaMutabArr addObject:ima];
    }
    NSArray *imageNames = [imaMutabArr copy];
    NSMutableArray *images = [NSMutableArray array];
//    NSString * bb = @"Coin_loading_0";
//    UIImage *aa = [UIImage imageNamed:bb];
    for (NSString *imageName in imageNames)
    {
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    // imageView.image = [images firstObject];
    imageView.animationImages = images;
    imageView.animationDuration = 1;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    imageView.backgroundColor = [UIColor clearColor];
    
    MBProgressHUD *  HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.backgroundColor = [UIColor clearColor];
    HUD.customView = imageView;
    //17,设置隐藏的时候是否从父视图中移除，默认是NO
    HUD.removeFromSuperViewOnHide = NO;
    HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.bezelView.backgroundColor = [UIColor clearColor];
    HUD.userInteractionEnabled = NO;
    [HUD showAnimated:YES];
    
}
- (void)hide
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)hideHUD
{
    
}
@end
