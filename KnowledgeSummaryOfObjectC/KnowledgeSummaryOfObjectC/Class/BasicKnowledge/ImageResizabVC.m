//
//  ImageResizabVC.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/5/11.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ImageResizabVC.h"

@interface ImageResizabVC ()
@property (nonatomic, strong) UIImageView *backIV;
@property (nonatomic, strong) UILabel *titleLB;
@end

@implementation ImageResizabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"图片拉伸测试";
    
    self.backIV = [[UIImageView alloc]init];
    [self.view addSubview:self.backIV];
    [self.backIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view).offset(50);
//        make.width.mas_equalTo(35);
        make.height.mas_equalTo(14);
    }];
    UIImage *backImage = [UIImage imageNamed:@"back_resizab"];
    self.backIV.image = [backImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 8, 0, 5) resizingMode:UIImageResizingModeStretch];
    
    self.titleLB = [[UILabel alloc]init];
    [self.backIV addSubview:self.titleLB];
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backIV.mas_left).offset(8);
        make.right.equalTo(self.backIV.mas_right).offset(-5);
        make.centerY.equalTo(self.backIV.mas_centerY);
        make.height.mas_equalTo(14);
    }];
    self.titleLB.textColor = [UIColor whiteColor];
    self.titleLB.textAlignment = NSTextAlignmentRight;
    self.titleLB.font = [UIFont systemFontOfSize:10];
    self.titleLB.text = @"省999999999999";
//    self.titleLB.backgroundColor = [UIColor cyanColor];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
