//
//  SuspendTabTableViewCell.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/7/20.
//  Copyright © 2020 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ClickTabItemBlock)(NSInteger index);

@interface SuspendTabTableViewCell : UITableViewCell
@property (nonatomic,copy) ClickTabItemBlock clickTabBlock;
@end

NS_ASSUME_NONNULL_END
