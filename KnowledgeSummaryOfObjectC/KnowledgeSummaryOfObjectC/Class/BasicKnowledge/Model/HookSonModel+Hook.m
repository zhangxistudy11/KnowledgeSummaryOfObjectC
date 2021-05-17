//
//  HookSonModel+Hook.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/4/8.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "HookSonModel+Hook.h"
#import <objc/runtime.h>

@implementation HookSonModel (Hook)
+ (void)load {
    Method originalMethod = class_getInstanceMethod([HookSonModel class], @selector(printName));
    Method ownerMethod = class_getInstanceMethod([HookSonModel class], @selector(hook_printName));
    method_exchangeImplementations(originalMethod, ownerMethod);
}
-(void)hook_printName {
    NSLog(@"我是son hook 类");
}
@end
