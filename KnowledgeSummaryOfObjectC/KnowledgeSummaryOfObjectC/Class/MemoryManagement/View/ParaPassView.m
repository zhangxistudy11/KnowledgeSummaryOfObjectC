//
//  ParaPassView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/10/20.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ParaPassView.h"

@implementation ParaPassView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s",__FUNCTION__);
        [self setUpView];
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.isStart) {
        NSLog(@"layoutSubviews-isStart-%d",self.isStart);
    }else{
        NSLog(@"layoutSubviews-isStart-%d",self.isStart);
    }
    NSLog(@"%s",__FUNCTION__);
}
- (void)setUpView{
    NSLog(@"%s",__FUNCTION__);
    if (self.isStart) {
        NSLog(@"init-isStart-%d",self.isStart);
    }else{
        NSLog(@"init-isStart-%d",self.isStart);
    }
}
@end
