//
//  TestModel.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/3/17.
//  Copyright © 2021 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObj.h"
NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject
@property(nonatomic,strong) NSArray *array;
@property(nonatomic,strong) TestObj *obj;

- (void)printName;
@end

NS_ASSUME_NONNULL_END
