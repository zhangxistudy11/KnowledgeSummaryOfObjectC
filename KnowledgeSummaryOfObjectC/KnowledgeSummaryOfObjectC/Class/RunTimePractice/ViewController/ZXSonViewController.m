//
//  ZXSonViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/12/5.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "ZXSonViewController.h"
#import <objc/runtime.h>
struct ZXSonLocation {
    double x;
    double y;
};
@interface ZXSonViewController ()

@end

@implementation ZXSonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**当修改私有变量时枚举时，由以下五步*/
    
    //1、通过KVC获取父类父类成员变量，赋值给NSValue
    NSValue* result = [self valueForKey:@"location"];
    
    //2、将NSValue转化为结构一样，但名字不一样的新结构体
    struct ZXSonLocation sonLocation;
    [result getValue:&sonLocation];
    
    //3、修改目标字段
    sonLocation.x = 999.0;
    
    //4、将新的结构体再转为NSValue
    NSValue* newValue = [NSValue valueWithBytes:&sonLocation objCType:@encode(struct ZXSonLocation)];

    //5、通过KVC赋值给父类
    [self setValue:newValue forKey:@"location"];

}

@end

