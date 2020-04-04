//
//  TTSliderController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/9.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "TTSliderController.h"
#import "TTRangeSlider.h"
@interface TTSliderController ()

@end

@implementation TTSliderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"slide学习";
    [self setUpView];
}
- (void)setUpView{
    TTRangeSlider *slider = [[TTRangeSlider alloc]init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(100);
        make.top.equalTo(self.view).offset(200);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(100);
    }];
    slider.tintColor = [UIColor cyanColor];
    slider.maxValue = 24.f;
    slider.minValue = 3;
    slider.selectedMinimum = 3;
    slider.selectedMaximum = 24;
    
    slider.handleImage = [UIImage imageNamed:@"flight_intl_filter_slide_diameter"];
       slider.selectedHandleDiameterMultiplier = 1.0;
       slider.handleDiameter = 32.f;
}


@end
