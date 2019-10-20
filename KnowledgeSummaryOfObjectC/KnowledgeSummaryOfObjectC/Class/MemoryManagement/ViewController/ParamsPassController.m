//
//  ParamsPassController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/10/20.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ParamsPassController.h"
#import "ParaPassView.h"
@interface ParamsPassController ()
@property (nonatomic,strong) ParaPassView *paraView;

@end

@implementation ParamsPassController
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s",__FUNCTION__);
        if (self.isStart) {
               NSLog(@"initVC-isStart-%d",self.isStart);
           }else{
               NSLog(@"initVC-isStart-%d",self.isStart);
           }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"参数传递";
    NSLog(@"%s",__FUNCTION__);
    self.paraView = [[ParaPassView alloc]init];
    [self.view addSubview:self.paraView];
    [self.paraView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(100);
    }];
    if (self.isStart) {
        NSLog(@"viewDidLoad-isStart-%d",self.isStart);
    }else{
        NSLog(@"viewDidLoad-isStart-%d",self.isStart);
    }
    self.paraView.isStart =self.isStart;
    
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__FUNCTION__);

    if (self.isStart) {
        NSLog(@"viewDidDisappear-isStart-%d",self.isStart);
    }else{
        NSLog(@"viewDidDisappear-isStart-%d",self.isStart);
    }
}
- (void)setIsStart:(BOOL)isStart{
    NSLog(@"%s",__FUNCTION__);
    _isStart = isStart;
}

- (void)testLog
{
    NSLog(@"gogogo");
}
- (void)dealloc
{
    NSLog(@"内存释放");
}

@end
