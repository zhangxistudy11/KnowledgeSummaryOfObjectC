//
//  OrderDetailProtocol.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

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

NS_ASSUME_NONNULL_END
