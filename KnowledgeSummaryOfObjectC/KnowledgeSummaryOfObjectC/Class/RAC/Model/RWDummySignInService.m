//
//  RWDummySignInService.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/15.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "RWDummySignInService.h"

@implementation RWDummySignInService

- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(RWSignInResponse)completeBlock{
    if (username.length>4&&password.length>4) {
        if (completeBlock) {
            completeBlock(YES);
        }
    }
}

@end

