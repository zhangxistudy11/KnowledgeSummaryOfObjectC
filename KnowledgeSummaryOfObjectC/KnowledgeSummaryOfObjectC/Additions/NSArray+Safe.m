//
//  NSArray+Safe.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/6/10.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "NSArray+Safe.h"
#import <objc/runtime.h>
@implementation NSArray (Safe)
+ (void)load {
  
#ifdef DEBUG // debug模式下让它崩溃
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL safeSel=@selector(safeObjectAtIndex:);
        SEL unsafeSel=@selector(objectAtIndex:);
        
        Class myClass = NSClassFromString(@"__NSArrayI");
        Method safeMethod=class_getInstanceMethod (myClass, safeSel);
        Method unsafeMethod=class_getInstanceMethod (myClass, unsafeSel);
        
        method_exchangeImplementations(unsafeMethod, safeMethod);
    });
#else
   
#endif
}
-(id)safeObjectAtIndex:(NSUInteger)index{
    
    if (index>(self.count-1)) {
        NSLog(@"NSArray->ArrayIndexOutOfBoundsException");
        return nil;
    }
    else{
        return [self safeObjectAtIndex:index];
    }
}
@end
