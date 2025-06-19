#import "BaseViewController.h"

@interface SlidingGestureViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView *tableView;

@end 