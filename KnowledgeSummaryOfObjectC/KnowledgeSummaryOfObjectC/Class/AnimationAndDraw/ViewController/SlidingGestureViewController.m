#import "SlidingGestureViewController.h"
#import <objc/runtime.h>

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
        // 禁用CollectionView的弹性效果，避免与右滑手势冲突
        _collectionView.alwaysBounceHorizontal = NO;
        _collectionView.alwaysBounceVertical = NO;
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

@interface SlidingGestureViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, assign) CGPoint initialTouchPoint;
@property (nonatomic, assign) CGFloat initialViewCenterX;
@property (nonatomic, assign) BOOL isInteractive;
@end

@implementation SlidingGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"滑动手势 + 右滑返回";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 禁用系统右滑返回，使用自定义的
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    // 设置背景视图（模拟上一个页面）
    [self setupBackgroundView];
    
    // 设置主内容视图
    [self setupMainContentView];
    
    // 设置右滑手势
    [self setupSwipeBackGesture];
}

- (void)setupBackgroundView {
    // 创建背景视图（模拟上一个页面）
    self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backgroundView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    
    // 添加背景内容
    UILabel *backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
    backgroundLabel.text = @"上一个页面";
    backgroundLabel.font = [UIFont systemFontOfSize:24];
    backgroundLabel.textColor = [UIColor darkGrayColor];
    [self.backgroundView addSubview:backgroundLabel];
    
    [self.view addSubview:self.backgroundView];
}

- (void)setupMainContentView {
    // 创建主内容容器
    UIView *mainContainer = [[UIView alloc] initWithFrame:self.view.bounds];
    mainContainer.backgroundColor = [UIColor whiteColor];
    mainContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    mainContainer.layer.shadowOffset = CGSizeMake(-2, 0);
    mainContainer.layer.shadowOpacity = 0;
    mainContainer.layer.shadowRadius = 8;
    [self.view addSubview:mainContainer];
    
    // 在容器中添加tableView
    self.tableView = [[UITableView alloc] initWithFrame:mainContainer.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    // 禁用tableView的左右滑动，只允许垂直滚动
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableView.alwaysBounceHorizontal = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    [self.tableView registerClass:[SlidingCell class] forCellReuseIdentifier:@"SlidingCell"];
    [mainContainer addSubview:self.tableView];
    
    // 保存主容器的引用，用于手势处理
    objc_setAssociatedObject(self, "mainContainer", mainContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setupSwipeBackGesture {
    // 创建自定义的右滑手势
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    self.panGesture.delegate = self;
    [self.view addGestureRecognizer:self.panGesture];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.panGesture) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint velocity = [pan velocityInView:self.view];
        CGPoint translation = [pan translationInView:self.view];
        
        // 只响应向右的滑动
        if (translation.x > 0 && fabs(velocity.x) > fabs(velocity.y)) {
            // 检查是否在屏幕左边缘开始滑动
            CGPoint location = [gestureRecognizer locationInView:self.view];
            if (location.x <= 50) { // 左边缘50像素范围内
                return YES;
            }
        }
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // 如果是我们的右滑手势，不允许与其他手势同时识别
    if (gestureRecognizer == self.panGesture) {
        return NO;
    }
    
    // 允许与滚动视图的手势同时识别（仅垂直滚动）
    if ([otherGestureRecognizer.view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)otherGestureRecognizer.view;
        
        // 如果滚动视图在顶部且向右滑动，优先处理返回手势
        if (scrollView.contentOffset.y <= 0) {
            UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
            CGPoint translation = [pan translationInView:self.view];
            if (translation.x > 0) {
                return NO; // 不允许多手势，优先处理返回手势
            }
        }
        
        // 如果滚动视图不在顶部，允许垂直滚动
        return YES;
    }
    return NO;
}

#pragma mark - Gesture Handling
- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
    UIView *mainContainer = objc_getAssociatedObject(self, "mainContainer");
    if (!mainContainer) return;
    
    CGPoint translation = [gesture translationInView:self.view];
    CGPoint velocity = [gesture velocityInView:self.view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.isInteractive = YES;
            self.initialTouchPoint = [gesture locationInView:self.view];
            self.initialViewCenterX = mainContainer.center.x;
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            if (!self.isInteractive) return;
            
            // 计算新的位置，限制在合理范围内
            CGFloat newCenterX = self.initialViewCenterX + translation.x;
            newCenterX = MAX(newCenterX, self.initialViewCenterX);
            
            // 添加一些阻力，让滑动感觉更自然
            CGFloat progress = translation.x / (self.view.bounds.size.width * 0.8);
            progress = MIN(progress, 1.0);
            
            mainContainer.center = CGPointMake(newCenterX, mainContainer.center.y);
            
            // 添加阴影效果
            mainContainer.layer.shadowOpacity = progress * 0.3;
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            if (!self.isInteractive) return;
            
            self.isInteractive = NO;
            
            // 判断是否应该完成返回操作
            BOOL shouldComplete = NO;
            if (translation.x > self.view.bounds.size.width * 0.3 || velocity.x > 500) {
                shouldComplete = YES;
            }
            
            if (shouldComplete) {
                [self completeTransition:mainContainer];
            } else {
                [self cancelTransition:mainContainer];
            }
            break;
        }
            
        default:
            break;
    }
}

- (void)completeTransition:(UIView *)mainContainer {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        mainContainer.center = CGPointMake(self.view.bounds.size.width * 1.5, mainContainer.center.y);
        mainContainer.layer.shadowOpacity = 0;
    } completion:^(BOOL finished) {
        // 执行返回操作
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:NO];
        }
    }];
}

- (void)cancelTransition:(UIView *)mainContainer {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        mainContainer.center = CGPointMake(self.initialViewCenterX, mainContainer.center.y);
        mainContainer.layer.shadowOpacity = 0;
    } completion:nil];
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
