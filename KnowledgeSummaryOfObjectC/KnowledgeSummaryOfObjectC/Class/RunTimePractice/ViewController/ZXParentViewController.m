//
//  ZXParentViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/12/5.
//  Copyright © 2021 张玺. All rights reserved.
//
struct ZXLocation {
    double x;
    double y;
};

#import "ZXParentViewController.h"
@interface ZXParentViewController ()
{
    struct ZXLocation _location;
}
@end

@implementation ZXParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _location.x = 200.0;
    _location.y = 300.0;
    NSLog(@"初始化位置x:%f",_location.x);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"被子类修改后位置x:%f",_location.x);
}
@end

/*
 @interface DogClass : NSObject
 @property(nonatomic,copy) NSString * color;
 @end
 @implementation DogClass
 @end
 */
