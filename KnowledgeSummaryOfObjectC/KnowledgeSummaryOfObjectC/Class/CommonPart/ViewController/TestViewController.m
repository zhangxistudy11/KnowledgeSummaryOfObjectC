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

typedef void (^TestBlock)(void);
@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}
@property(nonatomic,copy) TestBlock tBlock;

@property (nonatomic, strong) UIView *redView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"TestVC";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    testaa(4);
    [self  setUpView];
}

- (void)setUpView
{
    _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, self.view.width
                                                               , self.view.height + 100) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view  addSubview:_tableView];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"testALG" style:UIBarButtonItemStylePlain target:self action:@selector(rightclick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.redView = [[UIView alloc]init];
    [self.view addSubview:self.redView];
    self.redView.backgroundColor = [UIColor redColor];
//    self.redView.add
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor greenColor]];
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
  
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"test-index-%ld",indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            [self testZero:@"王二"];
        }
            break;
        case 1:
        {
            [self testZero:@"刘能"];
        }
            break;
        case 2:
        {
            [self testZero:@"李四"];
        }
            break;
            case 3:
                   {
                       NSObject * obj = [[NSObject alloc]init];
                       int a = 10;
                       NSLog(@"%p %p %p",&obj,obj,a);
                       NSLog(@"aaa");
                       NSLog(@"cccgggggg放假啊可怜；fffggggc");
                       NSLog(@"bbgggggggb");
                       ZXNetWorkManager * aa = [[ZXNetWorkManager alloc]init];

                   }
                       break;
            case 4:
                          {
                              NSLog(@"333");
                              NSLog(@"fccbbbc4h555hhh");

                          }
                              break;
            
        default:
            break;
    }
}
#pragma mark - Test Method

void testaa(int a) {
    printf("%d",a);
}
void test() {
    int a = 10;
    int b = 20;
    NSLog(@"%d",a+b);
}



- (void)testOne:(NSString *)text {
    People * p1 = [[People alloc]init];
    p1.name = text;
    
    [self checkDataWithPeople:p1];
}


- (void)testZero:(NSString *)str
{
    People * p0 = [[People alloc]init];
    p0.name = str;
    NSLog(@"试一下试一下试一下");
    NSLog(@"实际名字：%@",p0.name);
//    [self checkDataWithPeople:p0];
    

}


- (void)checkDataWithPeople:(People *)people {
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    lb.numberOfLines = 3;
    [self.view addSubview:lb];
    
    SonModel *modle = [[SonModel alloc]init];
//    people.sonModle = modle;
    [people setSonModle:modle];
    NSLog(@"Debug Here,people.name:%@",people.name);
    NSLog(@"debug end");
}







#pragma mark - Target Methods
- (void)rightclick:(UIBarButtonItem *)sender
{
 
    NSArray * arr1 = [NSBundle yj_bundleOwnClassesInfo];
    NSLog(@"%@",arr1);
    
    NSArray * arr2 = [NSBundle yj_bundleAllClassesInfo];
    NSLog(@"%@",arr2);
    TestUIViewController *vc = [[TestUIViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
   

}

@end
