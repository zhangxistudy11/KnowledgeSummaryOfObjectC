//
//  CustomProgressView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/7/1.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomProgressView : BaseView
- (void)startLoad;
- (void)completeLoad;
- (void)resetLoad;
@end

NS_ASSUME_NONNULL_END
