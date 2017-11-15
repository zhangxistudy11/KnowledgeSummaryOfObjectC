//
//  SlideSubView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/15.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "BaseView.h"
#import "BaseTableView.h"
typedef NS_ENUM(NSInteger,TableViewType) {
    Left_type =0,
    Middle_type,
    Right_Type
};
#define SubCellHeight 48
#define SubCellCount  20
@interface SlideSubView : BaseView
- (instancetype)initWithFrame:(CGRect)frame andTableViewType:(TableViewType)tableType;
@end
