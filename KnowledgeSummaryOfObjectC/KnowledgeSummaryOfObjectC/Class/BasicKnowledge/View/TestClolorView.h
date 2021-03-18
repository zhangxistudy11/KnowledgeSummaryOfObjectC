//
//  TestClolorView.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/3/18.
//  Copyright © 2021 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ColorTypeRed = 0,
    ColorTypeYellow,
    ColorTypeGreen,
} ColorType;

@interface TestClolorView : UIView

- (instancetype)initWithFrame:(CGRect)frame whitColorType:(ColorType)colorType;

@end

NS_ASSUME_NONNULL_END
