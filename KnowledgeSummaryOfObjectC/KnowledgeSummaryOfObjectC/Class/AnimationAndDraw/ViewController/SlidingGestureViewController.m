#import "SlidingGestureViewController.h"

@interface SlidingCell : UITableViewCell
@property (nonatomic, strong) UIView *contentContainerView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isEvenRow;
@end

@implementation SlidingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 设置cell背景透明
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 创建内容容器view，有10的外边距
        _contentContainerView = [[UIView alloc] init];
        _contentContainerView.layer.cornerRadius = 8;
        _contentContainerView.clipsToBounds = YES;
        [self.contentView addSubview:_contentContainerView];
        
        // 创建collectionView（用于偶数行）
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        // 增加左右边距，确保头尾有足够的边距
//        layout.sectionInset = UIEdgeInsetsMake(0, 30, 0, 30);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        // 设置contentInset确保边距正确
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HorizontalCell"];
        [_contentContainerView addSubview:_collectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 内容容器view左右撑满，上下有10的边距
    _contentContainerView.frame = CGRectMake(10, 5, self.contentView.bounds.size.width - 20, self.contentView.bounds.size.height - 10);
    
    // collectionView填充整个容器
    _collectionView.frame = _contentContainerView.bounds;
    
    // 确保contentInset正确设置
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)setIsEvenRow:(BOOL)isEvenRow {
    _isEvenRow = isEvenRow;
    _collectionView.hidden = !isEvenRow;
}

@end

@implementation SlidingGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"滑动手势";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 禁止右滑返回
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[SlidingCell class] forCellReuseIdentifier:@"SlidingCell"];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SlidingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SlidingCell" forIndexPath:indexPath];
    
    BOOL isEvenRow = (indexPath.row % 2 == 1); // 奇数行（从0开始算）是偶数行
    cell.isEvenRow = isEvenRow;
    
    // 设置随机背景色
    cell.contentContainerView.backgroundColor = [self randomColor];
    
    if (isEvenRow) {
        // 偶数行使用collectionView
        cell.collectionView.dataSource = self;
        cell.collectionView.delegate = self;
        [cell.collectionView reloadData];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 偶数行（奇数索引）高度为220，奇数行（偶数索引）高度为120
    return (indexPath.row % 2 == 1) ? 220 : 120;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HorizontalCell" forIndexPath:indexPath];
    cell.backgroundColor = [self randomColor];
    cell.layer.cornerRadius = 6;
    cell.clipsToBounds = YES;
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 充分利用可用高度，减去上下边距
    return CGSizeMake(100, collectionView.bounds.size.height - 10);
}

#pragma mark - Helper
- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end 
