//
//  SlideMenuDemoController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2018/1/30.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "SlideMenuDemoController.h"
#import "FiltrateSlideView.h"
@interface SlideMenuDemoController ()

@property (nonatomic,strong) UIView *navigationView;

@property (nonatomic,strong) UIButton *showBtn;

@property (nonatomic,strong) UIButton *hideBtn;

@property (nonatomic,strong) FiltrateSlideView *slideView;//容器view

@property (nonatomic,strong) UIView *subContentView;//子View，可以按照自己的需要绘制

@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;//拖拽手势
@end

@implementation SlideMenuDemoController

#pragma mark - ViewControle Cycle Method
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.navigationView];
    [self.view addSubview:self.showBtn];
    [self.view addSubview:self.hideBtn];
    
    [self.view addGestureRecognizer:self.panGesture];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
#pragma mark - Getter Method
- (UIView *)navigationView
{
    if (!_navigationView) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,screen_width, NavigationHeight)];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(10, 20, 44, 44);
        [backBtn setImage:[UIImage imageNamed:@"ic_back.png"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [_navigationView addSubview:backBtn];
        
        UILabel *titileLab = [[UILabel alloc] initWithFrame:CGRectMake((screen_width - 120) / 2 , 27, 120, 30)];
        titileLab.text = @"侧滑菜单";
        titileLab.font = [UIFont fontWithName:@"PingFangSC-Light" size:18];
        titileLab.textColor = [UIColor blackColor];
        titileLab.textAlignment = NSTextAlignmentCenter;
        [_navigationView addSubview:titileLab];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, NavigationHeight-0.5, screen_width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [_navigationView addSubview:line];
    }
    return _navigationView;
}
- (UIButton *)showBtn
{
    if (!_showBtn) {
        _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _showBtn.backgroundColor = [UIColor redColor];
        _showBtn.frame = CGRectMake(80, 200, 70, 40);
        [_showBtn setTitle:@"显示" forState:UIControlStateNormal];
        [_showBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;
}

- (UIButton *)hideBtn
{
    if (!_hideBtn) {
        _hideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _hideBtn.backgroundColor = [UIColor greenColor];
        _hideBtn.frame = CGRectMake(200, 200, 70, 40);
        [_hideBtn setTitle:@"隐藏" forState:UIControlStateNormal];
        [_hideBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return _hideBtn;
}

- (UIView *)subContentView
{
    if (!_subContentView) {
        _subContentView = [[UIView alloc]initWithFrame:self.slideView.contentView.bounds];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu One" index:0]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Two" index:1]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Three" index:2]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Three" index:3]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Four" index:4]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Five" index:5]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Six" index:6]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  Menu Seven" index:7]];
        [_subContentView addSubview:[self addSubMenuLabelWithStr:@"  You can add any thing" index:8]];
    }
    return _subContentView;
}

- (UIPanGestureRecognizer *)panGesture
{
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panSlide:)];
    }
    return _panGesture;
}
#pragma mark - UIEvnet Method
- (void)show
{
    if (self.slideView.superview) {
        [self.slideView showView];
    }else{
        [self.view addSubview:self.slideView];
        [self.slideView.contentView addSubview:self.subContentView];
        [self.slideView showView];
    }
}
- (FiltrateSlideView *)slideView
{
    if (!_slideView) {
        _slideView = [[FiltrateSlideView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    }
    return _slideView;
}
- (void)hide
{
    NSLog(@"hide");
    [self.slideView hideView];
}
- (void)close
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)panSlide:(UIPanGestureRecognizer*)panGesture
{
    switch (panGesture.state) {
        case UIGestureRecognizerStateChanged:
            [self panProgress:panGesture];
            break;
        default:
            break;
    }
}
#pragma mark - Private Method
- (UILabel *)addSubMenuLabelWithStr:(NSString *)str index:(NSInteger)index
{
    UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(0,0 + 50*index, self.slideView.contentView.width, 50)];
    lb.text = str;
    lb.font = [UIFont systemFontOfSize:20];
    lb.text = str;
    lb.backgroundColor = RandomColor;
    NSLog(@"第一次fffggg");
    return lb;
}
- (void)panProgress:(UIPanGestureRecognizer*)pan
{
    NSLog(@"第二次");
     CGFloat speedX = [pan velocityInView:pan.view].x;
     BOOL towardRight = speedX > 0;
    if (!towardRight) {
        [self show];
    }
}
@end
