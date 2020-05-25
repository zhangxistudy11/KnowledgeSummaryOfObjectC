//
//  BlockUseViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/5/25.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "BlockUseViewController.h"

typedef void (^CommonBlock)(void);

@interface BlockUseViewController ()
@property (nonatomic,copy) CommonBlock copyBlock;
@property (nonatomic, strong) CommonBlock strongBlock;
@end

@implementation BlockUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationItem.title = @"block探究";
    [self testOne];
}

- (void)testOne {
    //ARC下Block的修饰符
    int x = 0;
    self.copyBlock = ^(void) {
        NSLog(@"aaa");
        NSLog(@"%d", x);
    };
    NSLog(@"copyBlock: %@", self.copyBlock);

    // 打印 retainBlock 所在的内存地址
    self.strongBlock = ^(void) {
        NSLog(@"bbbb");

        NSLog(@"%d", x);
    };
    NSLog(@"strongBlock: %@", self.strongBlock);

}

@end
