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
//    [self teset2];
//    [self teset3];
//    [self teset4];
//    [self teset5];
//    [self test6];
//    [self test7];
//    [self test8];

//    [self teset2];
//    [self teset3];
}
- (void)teset1{
    dispatch_queue_t queue =  dispatch_queue_create("aa", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue,^{
     
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
//多个异步任务执行后，执行下个任务
- (void)teset4 {
    // 创建队列组
       dispatch_group_t group =  dispatch_group_create();
       // 创建并发队列
       dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
       // 开子线程，任务1
       dispatch_group_async(group, queue, ^{
           sleep(2.0);

           NSLog(@"任务1 完成，线程：%@", [NSThread currentThread]);
       });
    
       // 开子线程，任务2
       dispatch_group_async(group, queue, ^{
           sleep(2.0);

           NSLog(@"任务2 完成，线程：%@", [NSThread currentThread]);
       });
    
    dispatch_group_notify(group, queue, ^{
         dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"全部完成，线程：%@", [NSThread currentThread]);
         });
     });

    
 }
- (void)teset5 {
    NSURLSession *session = [NSURLSession sharedSession];
     
        // 创建队列组
        dispatch_group_t group =  dispatch_group_create();
        // 创建并发队列
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
     
        // 任务1
        dispatch_group_async(group, queue, ^{
            NSURLSessionDataTask *task1 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/hero/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSLog(@"任务1 完成，线程：%@", [NSThread currentThread]);
            }];
            [task1 resume];
        });
     
        // 任务2
        dispatch_group_async(group, queue, ^{
            NSURLSessionDataTask *task2 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/thumbnails/erin-sarofsky/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSLog(@"任务2 完成，线程：%@", [NSThread currentThread]);
            }];
            [task2 resume];
        });
     
        // 全部完成
        dispatch_group_notify(group, queue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"全部完成，线程：%@", [NSThread currentThread]);
            });
        });

}
- (void)test6 {
    NSURLSession *session = [NSURLSession sharedSession];
     
        // 创建队列组
        dispatch_group_t group = dispatch_group_create();
     
        // 任务1
        dispatch_group_enter(group);
        NSURLSessionDataTask *task1 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/hero/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"任务1 完成，线程：%@", [NSThread currentThread]);
            dispatch_group_leave(group);
        }];
        [task1 resume];
     
        // 任务2
        dispatch_group_enter(group);
        NSURLSessionDataTask *task2 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/thumbnails/erin-sarofsky/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"任务2 完成，线程：%@", [NSThread currentThread]);
            dispatch_group_leave(group);
        }];
        [task2 resume];
     
        // 全部完成
        dispatch_group_notify(group, dispatch_get_main_queue(), ^(){
            NSLog(@"全部完成，线程：%@", [NSThread currentThread]);
        });


}
- (void)test7 {
    // 初始化信号量
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
     
        NSURLSession *session = [NSURLSession sharedSession];
     
        // 创建队列组
        dispatch_group_t group =  dispatch_group_create();
        // 创建并发队列
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
     
        // 任务1
        dispatch_group_async(group, queue, ^{
            NSURLSessionDataTask *task1 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/hero/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                sleep(3);

                NSLog(@"任务1 完成，线程：%@", [NSThread currentThread]);
                // 发送信号，使信号量+1
                dispatch_semaphore_signal(semaphore);
            }];
            [task1 resume];
        });
       
     
        // 任务2
        dispatch_group_async(group, queue, ^{
            NSURLSessionDataTask *task2 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/thumbnails/erin-sarofsky/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSLog(@"任务2 完成，线程：%@", [NSThread currentThread]);
                dispatch_semaphore_signal(semaphore);
            }];
            [task2 resume];
        });
    // 任务3
    dispatch_group_async(group, queue, ^{
        NSURLSessionDataTask *task2 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/105/media/us/imac-pro/2018/d0b63f9b_f0de_4dea_a993_62b4cb35ca96/thumbnails/erin-sarofsky/large.mp4"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"任务3 完成，线程：%@", [NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        }];
        [task2 resume];
    });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    // 信号量等于0时会一直等待，大于0时正常执行，并让信号量-1
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

        // 全部完成
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"全部完成，线程：%@", [NSThread currentThread]);
        });

 
}
- (void)test8 {
    // 创建队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     
        // 任务1
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img-blog.csdn.net/20180421152137506"]];
            NSLog(@"任务1 完成，线程：%@", [NSThread currentThread]);
        }];
     
        // 任务2
        NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
            [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img-blog.csdn.net/20170112145924755?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvaGVyb193cWI=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center"]];
            NSLog(@"任务2 完成，线程：%@", [NSThread currentThread]);
        }];
    // 任务3
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img-blog.csdn.net/20170112145924755?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvaGVyb193cWI=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center"]];
        NSLog(@"任务3 完成，线程：%@", [NSThread currentThread]);
    }];
        // 添加操作依赖，注意不能循环依赖
        [op1 addDependency:op2];
    [op1 addDependency:op3];

        op1.completionBlock = ^{
            NSLog(@"全部完成，线程：%@", [NSThread currentThread]);
        };
     
        // 添加操作到队列
        [queue addOperation:op1];
        [queue addOperation:op2];
    [queue addOperation:op3];

  
}
@end
