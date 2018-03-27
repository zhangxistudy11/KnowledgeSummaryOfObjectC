//
//  JSProtocolObj.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/3/19.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol JSExportTest<JSExport>

//用宏转换下，将JS函数名字指定为add；
//

@property (nonatomic, copy) NSDictionary *data;
- (NSString *)whatYouName;
//JSExportAs(add, - (NSInteger)add:(NSInteger)a b:(NSInteger)b);
@end

@interface JSProtocolObj : NSObject<JSExportTest>
@property (nonatomic, copy)NSString *name;
- (NSString *)whatYouName;

//@property (nonatomic,assign)NSInteger sumCount;


@end
