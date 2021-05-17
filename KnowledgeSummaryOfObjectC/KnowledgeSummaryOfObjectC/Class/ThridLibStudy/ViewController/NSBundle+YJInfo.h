//
//  NSBundle+YJInfo.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/4/7.
//  Copyright © 2021 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (YJInfo)
/**
 获取当前工程下自己创建的所有类

 @return 数组
 */
+ (NSArray <Class> *)yj_bundleOwnClassesInfo;

/**
 获取当前工程下所有类（含系统类、cocoPods类）
 
 @return 数组
 */
+ (NSArray <NSString *> *)yj_bundleAllClassesInfo;

@end

NS_ASSUME_NONNULL_END
