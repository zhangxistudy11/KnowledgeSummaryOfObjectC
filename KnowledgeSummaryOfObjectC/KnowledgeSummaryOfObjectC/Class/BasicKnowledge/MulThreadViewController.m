//
//  MulThreadViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/3/15.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "MulThreadViewController.h"

@interface MulThreadViewController ()

@end

@implementation MulThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"多线程";
    NSLog(@"%@", [NSThread currentThread]);

    [self teset1];
    [self teset2];
    [self teset3];

}
- (void)teset1{
    dispatch_queue_t queue =  dispatch_queue_create("aa", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue,^{
      NSLog(@"queue");
        NSLog(@"%@", [NSThread currentThread]);

    });
}

- (void)teset2{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue,^{
      NSLog(@"MainQueue");
        NSLog(@"%@", [NSThread currentThread]);

    });
    NSLog(@"gg");
}
- (void)teset3{
    dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue,^{
      NSLog(@"dddqueue");
        NSLog(@"%@", [NSThread currentThread]);

    });
}
@end
