//
//  CacheTestModel.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/10/22.
//  Copyright © 2018 张玺. All rights reserved.
// 11

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CacheOtherModel : NSObject<NSCoding>
@property (nonatomic,copy) NSString *otherName;
@property (nonatomic,assign) NSInteger otherAge;
@end


@interface CacheTestModel : NSObject<NSCoding>


@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) BOOL isMan;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSDictionary *dict;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) CacheOtherModel *otherModel;
@end

NS_ASSUME_NONNULL_END
