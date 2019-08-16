//
//  NSString+Size.m
//  Ticket
//
//  Created by 慕少锋 on 2018/6/8.
//  Copyright © 2018年 Arron Zhang. All rights reserved.
//

#import "NSString+ZTSize.h"

@implementation NSString (ZTSize)

- (CGFloat)getTheTextHeightWithFont:(UIFont *)font width:(CGFloat)width {
    if (font) {
        NSDictionary *dict = @{NSFontAttributeName:font};
        CGSize textSize = CGSizeMake(width, 0.0f);
        textSize = [self boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dict context:nil].size;
        return ceilf(textSize.height);
    }
    return 0.0f;
}

- (CGFloat)getTheTextWidthWithFont:(UIFont *)font height:(CGFloat)height {
    if (font) {
        NSDictionary *dict = @{NSFontAttributeName:font};
        CGSize textSize = CGSizeMake(0.0f, height);
        textSize = [self boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dict context:nil].size;
        return ceilf(textSize.width);
    }
    return 0.0f;
}

- (CGFloat)getTheTextTotalWidthWithFont:(UIFont *)font {
    if (font) {
        return [self sizeWithAttributes:@{NSFontAttributeName:font}].width;
    }
    return 0.0f;
}

@end
