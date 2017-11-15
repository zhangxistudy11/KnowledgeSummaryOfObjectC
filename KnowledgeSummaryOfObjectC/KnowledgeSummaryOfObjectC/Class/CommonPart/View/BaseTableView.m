//
//  BaseTableView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/14.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self settingContentInsetAdjustmentNever];
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self settingContentInsetAdjustmentNever];
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self settingContentInsetAdjustmentNever];
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
    return self;

}
- (void)settingContentInsetAdjustmentNever
{
    if (!SYSTEM_VERSION_LESS_THAN(@"11.0")) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
}
@end
