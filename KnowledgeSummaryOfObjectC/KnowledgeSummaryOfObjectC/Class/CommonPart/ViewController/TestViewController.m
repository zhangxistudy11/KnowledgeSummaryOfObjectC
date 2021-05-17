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
#import "TestModel.h"
#import "TestModel+A.h"
#import "TestModel+B.h"
#import "YYCache.h"


typedef void (^TestBlock)(void);
@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView  * _tableView;
}
@property(nonatomic,copy) TestBlock tBlock;
@property(nonatomic,copy) NSMutableArray * mulArr;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"TestVC";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    testaa(4);
    
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
    
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
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
    cell.textLabel.text = [NSString stringWithFormat:@"test-index-%ld",indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            [self testZeroZero];
        }
            break;
        case 1:
        {
            // 1.编译时编译器认为testObject是一个NSString对象，这里赋给它一个NSData对象编译器给出黄色类型错误警告，但运行时却指向一个NSData对象
//            instancetype testObject = [[NSData alloc]init];
//               // 2.编译器认为testObject是NSString对象，所以允许其调用NSString的方法，这里编译通过无警告和错误
//               [testObject stringByAppendingString:@"string"];
//               // 3.但不允许其调用NSData的方法，下面这里编译不通过给出红色报错
//               [testObject base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];

            [self testOne];
        

        }
            break;
            case 3:
                   {
                       NSObject * obj = [[NSObject alloc]init];
                       int a = 10;
                       NSLog(@"%p %p %p",&obj,obj,a);
                       NSLog(@"aaa");
                       NSLog(@"cccc");
                       NSLog(@"bbggggb");
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
- (void)testZeroZero {
    YYCache *aa = [[YYCache alloc]initWithName:@"ddddd"];
    [aa containsObjectForKey:@"111"];
    NSLog(@"我是老哥老哥老哥");
    NSLog(@"%s",__FUNCTION__);
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
- (void)testZero
{
  __block  int a = 10;
    
    self.tBlock = ^{
        a = 30;
    };
    self.tBlock();
    NSLog(@"%ld",a);
}
#pragma mark - Target Methods
- (void)rightclick:(UIBarButtonItem *)sender
{
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    [arr addObject:@"11"];
    NSMutableArray * arr2 = [[NSMutableArray alloc]initWithArray:arr copyItems:YES];
//    NSLog(@"%@",self.mulArr);
//    TestModel *t1 = [[TestModel alloc]init];
//    [t1 printName];
//    TestModel *t2 = [[SonModel alloc]init];
//    [t2 printStr];
//
//    SonModel *s1 = [[TestModel alloc]init];
//    [s1 printStr];
//
//    SonModel *s2 = [[SonModel alloc]init];
//    [s2 printStr];


}
- (void)testOne {
    
    TestModel * tModel = [[TestModel alloc]init];
    
   
    
    [tModel printName];
    
    NSMutableDictionary * aa = [[NSMutableDictionary alloc]init];
    [aa setValue:@"aaa" forKey:@"aaa"];

    
    NSCache * cache = [[NSCache alloc]init];
    [cache setObject:tModel forKey:tModel];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float current = scrollView.contentOffset.y + scrollView.frame.size.height;
    float total = scrollView.contentSize.height;
    float ratio = current / total;
    
    NSLog(@"scrollView.contentOffset.y--%f",scrollView.contentOffset.y );
    NSLog(@"total--%f",scrollView.contentSize.height );
    NSLog(@"ratio--%f",ratio );
    
    if (ratio > 0.7) {
        NSLog(@"走一次新的");
    }

}
@end
