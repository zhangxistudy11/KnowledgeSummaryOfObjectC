//
//  OrderDetailView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailView : BaseView


/// 订单展示模块
/// @param data 订单展示需要的一些信息
- (void)updateOrderDetailCardWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
