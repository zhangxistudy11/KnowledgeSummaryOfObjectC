//
//  HomePageDetailInfoModel.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderDetailView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageDetailInfoModel : NSObject<OrderDetailProtocol>

@property (nonatomic,copy) NSString *cityName;

@property (nonatomic,copy) NSString *cityID;

@property (nonatomic, assign) BOOL officeID;

@property (nonatomic, assign) BOOL hasPay;
//订单号
@property (nonatomic,assign) NSInteger homeOrderID;
//支付金额
@property (nonatomic, assign) NSInteger payMoney;
/*OrderDetailProtocol协议部分*/
//订单号
@property (nonatomic, copy)   NSString * orderNum;
//订单金额
@property (nonatomic, assign) float price;

//是否是高级客户的订单
- (BOOL)isVipTypeOrder;
@end

NS_ASSUME_NONNULL_END
