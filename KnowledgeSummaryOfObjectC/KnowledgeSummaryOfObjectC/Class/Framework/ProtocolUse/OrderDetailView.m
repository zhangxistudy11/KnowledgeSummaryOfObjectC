//
//  OrderDetailView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/12/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "OrderDetailView.h"

@implementation OrderDetailView

- (void)updateOrderDetailCardWithData:(id<OrderDetailProtocol>) data;
{
    if (![data conformsToProtocol:@protocol(OrderDetailProtocol)]) {
        return;
    }
    //根据外部传参，给view的组件赋值
    //...
}

@end
