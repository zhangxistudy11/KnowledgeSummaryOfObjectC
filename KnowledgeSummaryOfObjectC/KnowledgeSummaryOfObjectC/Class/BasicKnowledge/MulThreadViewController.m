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
//    NSLog(@"%@", [NSThread currentThread]);

//    [self teset1];
//    [self teset2];
//    [self teset3];
//    [self teset4];
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
//GCD 实现线程池
- (void)teset4 {
    dispatch_queue_t workConcurrentQueue = dispatch_queue_create("cccccccc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue = dispatch_queue_create("sssssssss",DISPATCH_QUEUE_SERIAL);
    //保证一开始会有3个任务进入
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(3);
    for (NSInteger i = 0; i < 10; i++) {
    dispatch_async(serialQueue, ^{
        //串行队列开始（保证每次走三个）,放个wait，等待大于0 才能往后走
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_async(workConcurrentQueue, ^{
        //里面的任务是可以并发的
        NSLog(@"thread-info:%@开始执行任务%d",[NSThread currentThread],(int)i);
        sleep(1);
        NSLog(@"thread-info:%@结束执行任务%d",[NSThread currentThread],(int)i);
        //执行完一个，信号值加1
        dispatch_semaphore_signal(semaphore);});
    });
    }
    NSLog(@"主线程...!");
}
//如果为YES，则会阻塞当前线程直到指定的方法执行完成才返回。
//如果为NO, 则会立即返回。


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) { // do
        NSLog(@"A-在主队列");
    } else {
        NSLog(@"A-非主队列");
    }
    
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        NSLog(@"子线程工作");
        if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) { // do
            NSLog(@"B-在主队列");

        } else {
            NSLog(@"B-非主队列");

        }

        [[NSRunLoop currentRunLoop] run];
        
    }];
    [thread start];
    [self performSelector:@selector(testM) onThread:thread withObject:self waitUntilDone:NO];

}
- (void)testM {
    NSLog(@"测试方法");
}
@end
