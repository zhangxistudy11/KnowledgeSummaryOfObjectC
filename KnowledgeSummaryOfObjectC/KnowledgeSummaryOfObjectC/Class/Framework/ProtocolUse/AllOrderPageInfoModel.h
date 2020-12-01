//
//  AllOrderPageInfoModel.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AllOrderPageInfoModel : NSObject
@property (nonatomic,copy) NSString *orderType;


@property (nonatomic, assign) NSInteger orderCount;

//订单金额
@property (nonatomic,assign) NSInteger orderPrice;
//订单号
@property (nonatomic, assign) NSInteger orderDesId;
@end

NS_ASSUME_NONNULL_END
