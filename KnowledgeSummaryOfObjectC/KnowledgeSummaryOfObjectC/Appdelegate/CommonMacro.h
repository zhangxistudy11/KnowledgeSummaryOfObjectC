//
//  CommonMacro.h
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/11/14.
//  Copyright © 2017年 张玺. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

#define RandomColor [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1]

#define IS_IPHONEX (screen_width == 375.f && screen_height == 812.f ? YES : NO)

#define NavigationHeight        (IS_IPHONEX ? 88.f : 64.f)
#define tab_height   (IS_IPHONEX ? (49.f+34.f) : 49.f)
#define top_height   (IS_IPHONEX ? 44.f : 0.f)

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#ifdef DEBUG
#define ZXLog(format, ...) NSLog((@"%s@%d: " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define ZXLog(format, ...)
#endif

#endif /* CommonMacro_h */

//weak strong self for retain cycle
#define WEAK_SELF __weak typeof(self)weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf)self = weakSelf
