//
//  NSString+Size.h
//  Ticket
//
//  Created by 慕少锋 on 2018/6/8.
//  Copyright © 2018年 Arron Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZTSize)

@property(nonatomic,strong) NSNumber * num;
/**
 根据字体大小以及宽度计算文本高度

 @param font 字体
 @param width 宽度
 @return 返回高度
 */
- (CGFloat)getTheTextHeightWithFont:(UIFont *)font width:(CGFloat)width;

/**
 根据字体大小以及高度计算文本宽度
 */
- (CGFloat)getTheTextWidthWithFont:(UIFont *)font height:(CGFloat)height;

/**
 获取文字的长度

 @return 返回宽度
 */
- (CGFloat)getTheTextTotalWidthWithFont:(UIFont *)font;

@end
