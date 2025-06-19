#import "BaseViewController.h"

@interface SlidingGestureViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end 