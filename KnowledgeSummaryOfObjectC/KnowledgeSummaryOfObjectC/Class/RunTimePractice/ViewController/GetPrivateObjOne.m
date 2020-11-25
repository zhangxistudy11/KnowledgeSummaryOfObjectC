//
//  GetPrivateObjOne.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/11/25.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "GetPrivateObjOne.h"
#import "GetPrivateObjTwo.h"
@interface GetPrivateObjOne ()
@property (nonatomic, strong) GetPrivateObjTwo *twoObj;

@end

@implementation GetPrivateObjOne

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.twoObj = [[GetPrivateObjTwo alloc]init];
        
        [self.twoObj drink];
    }
    return self;
}

@end
