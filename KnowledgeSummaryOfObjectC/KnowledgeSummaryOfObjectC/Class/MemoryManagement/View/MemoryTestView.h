//
//  MemoryTestView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/10/20.
//  Copyright © 2018 张玺. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^ClickBlock) (void);
@interface MemoryTestView : BaseView

@property (nonatomic,copy) ClickBlock clickBlock;

@end

NS_ASSUME_NONNULL_END
