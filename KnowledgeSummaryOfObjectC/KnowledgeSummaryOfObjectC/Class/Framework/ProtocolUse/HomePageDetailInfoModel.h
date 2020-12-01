//
//  HomePageDetailInfoModel.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageDetailInfoModel : NSObject

@property (nonatomic,copy) NSString *cityName;

@property (nonatomic,copy) NSString *cityID;

@property (nonatomic, assign) BOOL officeID;

@property (nonatomic, assign) BOOL hasPay;
//订单号
@property (nonatomic,assign) NSInteger homeOrderID;
//支付金额
@property (nonatomic, assign) NSInteger payMoney;
@end

NS_ASSUME_NONNULL_END
