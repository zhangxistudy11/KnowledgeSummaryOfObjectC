//
//  FloatSlideCell.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/5/11.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "BaseTableViewCell.h"

@protocol FloatSlideCellMoveTopDelegate<NSObject>
- (void)didMoveTop;
@end
@interface FloatSlideCell : BaseTableViewCell

@property (nonatomic,weak) id<FloatSlideCellMoveTopDelegate>delegate;

@property (nonatomic, assign) BOOL cellCanScroll;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(float)height;

- (void)innerCanScroll:(BOOL)canScroll;
@end
