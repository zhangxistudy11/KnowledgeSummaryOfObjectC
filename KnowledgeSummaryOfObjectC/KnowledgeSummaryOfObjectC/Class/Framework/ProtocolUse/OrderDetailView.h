//
//  OrderDetailView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN


@protocol OrderDetailProtocol <NSObject>

@required
//订单号
@property (nonatomic, copy)   NSString * orderNum;
//订单金额
@property (nonatomic, assign) float price;

//是否是高级客户的订单
- (BOOL)isVipTypeOrder;

@end

@interface OrderDetailView : BaseView


/// 订单展示模块
/// @param data 订单展示需要的一些信息
- (void)updateOrderDetailCardWithData:(id<OrderDetailProtocol>) data;

@end

NS_ASSUME_NONNULL_END
