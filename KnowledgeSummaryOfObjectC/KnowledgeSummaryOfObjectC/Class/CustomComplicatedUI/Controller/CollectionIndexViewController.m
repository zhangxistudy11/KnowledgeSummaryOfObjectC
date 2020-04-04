//
//  CollectionIndexViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/4/2.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "CollectionIndexViewController.h"
#import "DDIndexView.h"
#import "CollectionIndexCell.h"
@interface CollectionIndexViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,DDIndexViewDelegate>
@property (nonatomic, strong) UICollectionView *calendarView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong)  DDIndexView *indexView;
@property (nonatomic, assign) CGPoint startContentOffset;
@end

@implementation CollectionIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"collectionView的indexview";
    
    [self setUpView];
}
- (void)setUpView{
    [self.view addSubview:self.calendarView];
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSMutableArray *allArray = [[NSMutableArray alloc]init];
    for (int i=0; i<30; i++) {
        [allArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.dataSource = allArray;
    
    _indexView = [[DDIndexView alloc] init];
       
       _indexView.delegate = self;
       [self.view addSubview:_indexView];
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _startContentOffset = self.calendarView.contentOffset;
}

- (UICollectionView *)calendarView {
    if (!_calendarView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(screen_width, 60);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 8;
//        layout.headerReferenceSize = CGSizeMake(self.minimumLineSpacing, self.itemHeight);
//        layout.footerReferenceSize = CGSizeMake(self.minimumLineSpacing, self.itemHeight);
        
        _calendarView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _calendarView.dataSource = self;
        _calendarView.delegate = self;
        _calendarView.scrollsToTop = NO;
        _calendarView.showsVerticalScrollIndicator = NO;
        _calendarView.showsHorizontalScrollIndicator = NO;
        // 注册header
        [_calendarView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CalendarCollectionViewHeader"];
        
        // 注册cell
        [_calendarView registerClass:[CollectionIndexCell class] forCellWithReuseIdentifier:@"CalendarCollectionViewCell"];
        
        // 注册footer
        [_calendarView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CalendarCollectionViewFooter"];
        
        _calendarView.backgroundColor = [UIColor clearColor];
    }
    return _calendarView;
}

#pragma mark ---DDIndexViewDelegate
- (NSArray <NSString *>*)titlesForIndexView:(DDIndexView *)indexView {
    return self.dataSource;
}

- (void)indexView:(DDIndexView *)indexView didSelectedIndex:(NSInteger)index complete:(void (^)(NSInteger finalSelectedIndex))complete {
    if (index >=0 && index < _calendarView.numberOfSections) {
//        [_calendarView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [_calendarView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:(UICollectionViewScrollPosition)UITableViewScrollPositionTop animated:NO];
    }
    CGPoint p = CGPointMake(0, _calendarView.contentOffset.y - _startContentOffset.y);
    NSIndexPath *indexPath = [_calendarView indexPathForItemAtPoint:p];
    complete(indexPath.section);
}
#pragma mark ---UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint p = CGPointMake(0, scrollView.contentOffset.y - _startContentOffset.y);
    NSIndexPath *indexPath = [self.calendarView indexPathForItemAtPoint:p];
    [_indexView updateSelectedIndex:indexPath.section];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    NSArray *items = self.dataSource[@"items"];
//    return (items.count > 0 ? 1 : 0);
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}
//- (UIView *)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    ZTIntlFlightCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCollectionViewCell" forIndexPath:indexPath];
//
//    NSDictionary *currentData = self.dataSource[@"items"][indexPath.item];
//    if ([currentData isKindOfClass:[NSDictionary class]]) {
//        cell.dateStr = currentData[@"dateStr"];
//        cell.price = currentData[@"price"];
//        cell.selected = (self.currentSelectedIndex && (indexPath.section == self.currentSelectedIndex.section && indexPath.item == self.currentSelectedIndex.item));
//    }
    /*
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCollectionViewCell" forIndexPath:indexPath];
    NSString *data = [self.dataSource objectAtIndex:indexPath.section];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screen_width, 40)];
    lb.text = [NSString stringWithFormat:@"%@哈哈哈哈",data];
    [cell.contentView  addSubview:lb];
    cell.backgroundColor = [UIColor whiteColor];
    */
    CollectionIndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCollectionViewCell" forIndexPath:indexPath];
    NSString *data = [self.dataSource objectAtIndex:indexPath.section];
    [cell updateStr:data];
    return cell;
}
@end
