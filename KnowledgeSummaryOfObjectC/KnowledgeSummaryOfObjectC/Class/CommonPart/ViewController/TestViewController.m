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
    
    self.redView = [[UIView alloc]init];
    [self.view addSubview:self.redView];
    self.redView.backgroundColor = [UIColor redColor];
//    self.redView.add
    
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
            [self testZero];
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
 
    NSArray * arr1 = [NSBundle yj_bundleOwnClassesInfo];
    NSLog(@"%@",arr1);
    
    NSArray * arr2 = [NSBundle yj_bundleAllClassesInfo];
    NSLog(@"%@",arr2);
    TestUIViewController *vc = [[TestUIViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
   

}
- (void)testOne {
    
    TestModel * tModel = [[TestModel alloc]init];
    
  
    
}
@end
