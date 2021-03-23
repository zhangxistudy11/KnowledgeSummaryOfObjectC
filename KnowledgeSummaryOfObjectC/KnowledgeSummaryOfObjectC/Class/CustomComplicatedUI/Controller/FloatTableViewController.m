//
//  FloatTableViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zx on 2018/5/11.
//  Copyright © 2018年 张玺. All rights reserved.
//

#import "FloatTableViewController.h"


#define ScrollDefaultY  400
#define TopMargin   350


@interface FloatTableViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>



@property (nonatomic,strong) UITableView *innerCollectionView;

@property (nonatomic,strong) UIPanGestureRecognizer *pan;

@end

@implementation FloatTableViewController

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self.navigationController setNavigationBarHidden:NO animated:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"table联动";
    
    [self addSubView];
}
- (void)addSubView
{

    
    
    self.innerCollectionView = [[UITableView alloc]initWithFrame:CGRectMake(0, ScrollDefaultY, screen_width, 800)];
    [self.view addSubview:self.innerCollectionView];
    self.innerCollectionView.delegate = self;
    self.innerCollectionView.dataSource = self;
    self.innerCollectionView.scrollEnabled = NO;
    self.innerCollectionView.bounces = NO;
    
    

     self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self.innerCollectionView addGestureRecognizer:self.pan];
    

 
    
}

#pragma mark - UITableViewDelegte
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = RandomColor;
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell位置:%ld",(long)indexPath.row];
    return cell;
}
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    //获取拖拽手势在self.view 的拖拽姿态
    CGPoint translation = [panGestureRecognizer translationInView:self.view];
    CGFloat offetY = translation.y;
    NSLog(@"outerPan:%f",offetY);
    

    if(translation.y <= -(ScrollDefaultY-TopMargin)){
        self.innerCollectionView.scrollEnabled = YES;
      self.innerCollectionView.transform = CGAffineTransformMakeTranslation(0, -(ScrollDefaultY-TopMargin));
        panGestureRecognizer.enabled = NO;
        NSLog(@"外部停");
    }else if (translation.y >=0.001)
    {
        NSLog(@"下滑");
        self.innerCollectionView.transform = CGAffineTransformIdentity;
        
    }else{
        NSLog(@"保持");
        self.innerCollectionView.transform = CGAffineTransformMakeTranslation(0,translation.y);
    }
}
#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"tableviewOffsetY:%f",offsetY);
    if(offsetY>=800){
        self.pan.enabled = YES;
        self.innerCollectionView.scrollEnabled = NO;
    }
}
- (void)outerCanMove:(BOOL)isOuter
{
    if (isOuter) {
        self.pan.enabled = YES;
        self.innerCollectionView.scrollEnabled = NO;
    }else{
        self.pan.enabled = NO;
        self.innerCollectionView.scrollEnabled = YES;
    }
}
@end
