//
//  TestClolorView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/3/18.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "TestClolorView.h"
@interface TestClolorView ()
@property (nonatomic, assign) ColorType colorType;
@end
@implementation TestClolorView

- (instancetype)initWithFrame:(CGRect)frame whitColorType:(ColorType)colorType {
    self = [super initWithFrame:frame];
    if (self) {
        self.colorType = colorType;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",[self realColor:self.colorType]);
    return   [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",[self realColor:self.colorType]);
    return  [super pointInside:point withEvent:event];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%s",__func__);
    NSLog(@"%@",[self realColor:self.colorType]);

}

- (NSString *)realColor:(ColorType)type {
    if (type == ColorTypeRed) {
        return @"红色";
    } else if (type == ColorTypeYellow) {
        return @"黄色";
    } else if (type == ColorTypeGreen) {
        return @"绿色";
    }
    return @"";
}
@end
