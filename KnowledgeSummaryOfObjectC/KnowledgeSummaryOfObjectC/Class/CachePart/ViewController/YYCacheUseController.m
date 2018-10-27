//
//  YYCacheUseController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2018/10/22.
//  Copyright © 2018 张玺. All rights reserved.
//

#import "YYCacheUseController.h"
#import "YYCache.h"
#import "CacheTestModel.h"

static NSString *cacheName = @"ZXCache";

@interface YYCacheUseController ()

@end

@implementation YYCacheUseController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"YYCache使用";
    [self setUpView];
}

- (void)setUpView
{
    [self addBrnOne];
    [self addBrnTwo];
    [self addBrnThree];
    [self addBrnFour];
    [self addBrnThree];
    [self addBrnFour];
    [self addBrnFive];
    [self addBrnSix];
}
- (void)addBrnOne
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.tag = 1001;
    btn.frame = CGRectMake(15, 100,150, 40);
    [btn setTitle:@"缓存自定义对象" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(clickOne:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addBrnTwo
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.tag = 1002;
    btn.frame = CGRectMake(15, 200,150, 40);
    [btn setTitle:@"读取缓存自定义对象" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(clickOne:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addBrnThree
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.tag = 1003;
    btn.frame = CGRectMake(200, 100,150, 40);
    [btn setTitle:@"缓存自定义对象" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(clickOne:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addBrnFour
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.tag = 1004;
    btn.frame = CGRectMake(200, 200,150, 40);
    [btn setTitle:@"读取缓存自定义对象" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(clickOne:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addBrnFive
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.tag = 1005;
    btn.frame = CGRectMake(15, 300,150, 40);
    [btn setTitle:@"硬盘存自定义对象" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(clickOne:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addBrnSix
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.tag = 1006;
    btn.frame = CGRectMake(15, 400,150, 40);
    [btn setTitle:@"读取硬盘自定义对象" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(clickOne:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickOne:(UIButton *)sender
{
    NSInteger tag = sender.tag-1000;
    if (tag==1) {
        CacheTestModel *modelOne = [[CacheTestModel alloc]init];
        NSDictionary *dict = @{@"fathet":@"babab"};
        NSArray *array = @[@"one",@"two"];
        CacheOtherModel *otherModel = [[CacheOtherModel alloc]init];
        otherModel.otherName = @"alalla";
        otherModel.otherAge = 400;
        modelOne.name = @"Jesse";
        modelOne.isMan = YES;
        modelOne.age = 20;
        modelOne.dict = dict;
        modelOne.array = array;
        modelOne.otherModel = otherModel;
        YYCache *memoryCache = [[YYCache alloc]initWithName:cacheName];
        [memoryCache.memoryCache setObject:modelOne forKey:@"modelOne"];
    }else if (tag==2){
        YYCache *memoryCache = [[YYCache alloc]initWithName:cacheName];
        CacheTestModel *modelOne = (CacheTestModel *)[memoryCache objectForKey:@"modelOne"];
        NSLog(@"%@",modelOne.name);
    }else if (tag==3){
        NSDictionary *dict = @{@"fathet":@"babab"};
        NSArray *array = @[@"one",@"two"];
        YYCache *memoryCache = [[YYCache alloc]initWithName:cacheName];
        [memoryCache.memoryCache setObject:dict forKey:@"modelTwo"];
    }else if (tag==4){
        YYCache *memoryCache = [[YYCache alloc]initWithName:cacheName];
        NSDictionary * dict= (NSDictionary *)[memoryCache objectForKey:@"modelTwo"];
        NSLog(@"%@",dict);
    }else if (tag==5)
    {
        YYCache *cache = [[YYCache alloc]initWithName:cacheName];
        NSDictionary *dict = @{@"fathet":@"babab"};
        [cache.diskCache setObject:dict forKey:@"disk"];
        cache.diskCache.autoTrimInterval = 10;
        cache.diskCache.ageLimit = 0;
    }else if (tag==6)
    {
        YYCache *cache = [[YYCache alloc]initWithName:cacheName];
        NSDictionary * dict= (NSDictionary *)[cache.diskCache objectForKey:@"modelTwo"];
        NSLog(@"%@",dict);
        NSString *homePaht = NSHomeDirectory();
        NSLog(@"Parh--->%@",homePaht);
    }
}
@end
