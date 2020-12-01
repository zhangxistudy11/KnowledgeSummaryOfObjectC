//
//  HomePageDetailInfoModel.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "HomePageDetailInfoModel.h"

@implementation HomePageDetailInfoModel
- (NSString *)orderNum{
    return [NSString stringWithFormat:@"%ld",self.homeOrderID];
}
- (float)price{
    return self.payMoney;
}
- (BOOL)isVipTypeOrder {
    return YES;
}
@end
