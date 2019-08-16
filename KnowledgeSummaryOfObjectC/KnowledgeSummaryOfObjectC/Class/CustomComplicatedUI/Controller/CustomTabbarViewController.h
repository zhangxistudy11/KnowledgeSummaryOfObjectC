//
//  CustomTabbarViewController.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^IndexChangeBlock)(NSInteger index);

@interface CustomTabbarViewController : BaseViewController
@property (nonatomic,copy) IndexChangeBlock indexChangeBlock;
@end

NS_ASSUME_NONNULL_END
