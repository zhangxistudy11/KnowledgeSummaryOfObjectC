//
//  ZHXTabSingleItemView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHXTabSingleItemView : UIControl
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIView  *line;
@property (nonatomic,strong) UIButton  *badge;
@end

NS_ASSUME_NONNULL_END
