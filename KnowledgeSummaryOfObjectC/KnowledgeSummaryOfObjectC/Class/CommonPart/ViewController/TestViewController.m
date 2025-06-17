//
//  TestViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/4/17.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "TestViewController.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "SonModel.h"
#import "People.h"
#import "NSBundle+YJInfo.h"
#import "TestUIViewController.h"
#import "ZXNetWorkManager.h"
#import "SecondViewController.h"

// 定义不同类型的 cell
typedef NS_ENUM(NSInteger, CollectionViewCellType) {
    CollectionViewCellTypeImage,
    CollectionViewCellTypeText,
    CollectionViewCellTypeVideo
};

#define RENDER_LOG(fmt, ...) NSLog((@"[RenderMonitor] " fmt), ##__VA_ARGS__)

@interface TestViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataSource;
    NSInteger _currentPage;
    NSTimer *_renderCheckTimer;
    NSInteger _renderCount;
    NSMutableSet *_visibleCells;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Complex List";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _visibleCells = [NSMutableSet set];
    
    // 添加右上角按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" 
                                                                   style:UIBarButtonItemStylePlain 
                                                                  target:self 
                                                                  action:@selector(rightButtonClicked)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self setupCollectionView];
    [self setupRefreshControl];
    [self setupRenderCheckTimer];
    
    // 延迟5秒后开始加载数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadInitialData];
    });
}

- (void)setupRenderCheckTimer {
    _renderCount = 0;
    _renderCheckTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 
                                                       target:self 
                                                     selector:@selector(checkRenderStatus) 
                                                     userInfo:nil 
                                                      repeats:YES];
}

- (void)checkRenderStatus {
    RENDER_LOG(@"=== Render Status Check ===");
    RENDER_LOG(@"Total Renders: %ld", (long)_renderCount);
    RENDER_LOG(@"Data Source Count: %ld", (long)_dataSource.count);
    
    // 检查当前可见的 cells
    NSArray *visibleCells = [_collectionView visibleCells];
    RENDER_LOG(@"Visible Cells Count: %ld", (long)visibleCells.count);
    
    // 检查是否有新的 cell 变为可见
    for (UICollectionViewCell *cell in visibleCells) {
        if (![_visibleCells containsObject:cell]) {
            RENDER_LOG(@"New cell became visible");
            [_visibleCells addObject:cell];
        }
    }
    
    // 检查是否有 cell 变为不可见
    NSMutableSet *currentVisibleCells = [NSMutableSet setWithArray:visibleCells];
    NSMutableSet *disappearedCells = [_visibleCells mutableCopy];
    [disappearedCells minusSet:currentVisibleCells];
    
    if (disappearedCells.count > 0) {
        RENDER_LOG(@"Cells became invisible: %ld", (long)disappearedCells.count);
        [_visibleCells minusSet:disappearedCells];
    }
    
    RENDER_LOG(@"========================");
}

- (void)rightButtonClicked {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    RENDER_LOG(@"View Will Appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    RENDER_LOG(@"View Will Disappear");
}

- (void)dealloc {
    [_renderCheckTimer invalidate];
    _renderCheckTimer = nil;
}

- (void)setupCollectionView {
    // 创建瀑布流布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // 创建 CollectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    // 注册不同类型的 cell
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ImageCell"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TextCell"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"VideoCell"];
    
    [self.view addSubview:_collectionView];
}

- (void)setupRefreshControl {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    _collectionView.refreshControl = refreshControl;
}

- (void)loadMoreData {
    RENDER_LOG(@"Starting to load more data...");
    
    // 模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger startIndex = (_currentPage - 1) * 20;
        for (NSInteger i = 0; i < 20; i++) {
            NSInteger type = arc4random_uniform(3);
            [_dataSource addObject:@(type)];
        }
        
        _currentPage++;
        [_collectionView reloadData];
        [_collectionView.refreshControl endRefreshing];
        RENDER_LOG(@"Finished loading more data. Total items: %ld", (long)_dataSource.count);
    });
}

- (void)loadInitialData {
    _dataSource = [NSMutableArray array];
    _currentPage = 1;
    [self loadMoreData];
}

- (void)handleRefresh:(UIRefreshControl *)refreshControl {
    _currentPage = 1;
    [_dataSource removeAllObjects];
    [self loadMoreData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    _renderCount++;
    RENDER_LOG(@"Rendering cell at index: %ld (Total renders: %ld)", (long)indexPath.item, (long)_renderCount);
    
    CollectionViewCellType cellType = [_dataSource[indexPath.item] integerValue];
    NSString *identifier;
    
    switch (cellType) {
        case CollectionViewCellTypeImage:
            identifier = @"ImageCell";
            break;
        case CollectionViewCellTypeText:
            identifier = @"TextCell";
            break;
        case CollectionViewCellTypeVideo:
            identifier = @"VideoCell";
            break;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // 配置不同类型的 cell
    switch (cellType) {
        case CollectionViewCellTypeImage: {
            cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                                  green:arc4random_uniform(255)/255.0
                                                   blue:arc4random_uniform(255)/255.0
                                                  alpha:1.0];
            break;
        }
        case CollectionViewCellTypeText: {
            cell.backgroundColor = [UIColor lightGrayColor];
            break;
        }
        case CollectionViewCellTypeVideo: {
            cell.backgroundColor = [UIColor darkGrayColor];
            break;
        }
    }
    
    // 添加动画效果
    cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.3 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCellType cellType = [_dataSource[indexPath.item] integerValue];
    CGFloat width = (collectionView.bounds.size.width - 30) / 2;
    
    switch (cellType) {
        case CollectionViewCellTypeImage:
            return CGSizeMake(width, width);
        case CollectionViewCellTypeText:
            return CGSizeMake(width, width * 0.5);
        case CollectionViewCellTypeVideo:
            return CGSizeMake(width, width * 1.2);
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height;
    CGFloat screenHeight = scrollView.bounds.size.height;
    
    if (offsetY > contentHeight - screenHeight * 1.5) {
        [self loadMoreData];
    }
}

@end
