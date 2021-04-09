//
//  HookKnowledgeViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/4/8.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "HookKnowledgeViewController.h"
#import "HookSonModel.h"
@interface HookKnowledgeViewController ()

@end

@implementation HookKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    HookSonModel *son = [[HookSonModel alloc]init];
    [son printName];
}



@end
