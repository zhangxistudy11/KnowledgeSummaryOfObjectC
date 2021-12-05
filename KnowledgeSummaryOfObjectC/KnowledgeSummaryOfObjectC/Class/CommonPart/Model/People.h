//
//  People.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/4/7.
//  Copyright © 2021 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SonModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface People : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,strong) SonModel *sonModle;
@end

NS_ASSUME_NONNULL_END
