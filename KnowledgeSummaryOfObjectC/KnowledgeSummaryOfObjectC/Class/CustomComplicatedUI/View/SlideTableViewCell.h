//
//  SlideTableViewCell.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/15.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "RACSubject.h"
@interface SlideTableViewCell : BaseTableViewCell

@property (nonatomic,strong)UIScrollView *scrollView;

@property (nonatomic, strong) RACSubject *didScrollSubject;
@end
