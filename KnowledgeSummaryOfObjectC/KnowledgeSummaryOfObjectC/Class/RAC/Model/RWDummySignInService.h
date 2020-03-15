//
//  RWDummySignInService.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/15.
//  Copyright © 2020 张玺. All rights reserved.
//

typedef void (^RWSignInResponse)(BOOL success);

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWDummySignInService : NSObject
- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(RWSignInResponse)completeBlock;
@end

NS_ASSUME_NONNULL_END
