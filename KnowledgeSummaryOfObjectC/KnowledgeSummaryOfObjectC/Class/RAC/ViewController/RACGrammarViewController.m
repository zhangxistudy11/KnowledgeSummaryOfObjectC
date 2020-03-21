//
//  RACGrammarViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/3/20.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "RACGrammarViewController.h"

@interface RACGrammarViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}


@end

@implementation RACGrammarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ReactiveCocoa语法学习";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self  setUpView];
}
- (void)setUpView
{
    _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, self.view.width
                                                               , self.view.height + 100) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view  addSubview:_tableView];
    
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"0-创建&订阅信号";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"1-信号提供者-RACSubject";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"2-RACSubject代替代理";
            return cell;
            break;
        case 3:
            cell.textLabel.text = @"3-ReactiveCocoa核心方法bind";
            return cell;
            break;
        case 4:
            cell.textLabel.text = @"4-flattenMap的使用方法(映射)";
            return cell;
            break;
        case 5:
            cell.textLabel.text = @"5-map(映射)";
            return cell;
            break;
        case 6:
            cell.textLabel.text = @"6-FlatternMap 和 Map的区别";
            return cell;
            break;
        case 7:
            cell.textLabel.text = @"7-RAC 和 RACObserve的区别";
            return cell;
            break;
        case 8:
            cell.textLabel.text = @"8-concat";
            return cell;
            break;
        case 9:
            cell.textLabel.text = @"9-then";
            return cell;
            break;
        case 10:
            cell.textLabel.text = @"10-merge";
            return cell;
            break;
        case 11:
            cell.textLabel.text = @"11-zipWith";
            return cell;
            break;
        case 12:
            cell.textLabel.text = @"12-combineLatest";
            return cell;
            break;
        case 13:
            cell.textLabel.text = @"13-reduce";
            return cell;
            break;
        default:
            return cell;
            
    }
    
    cell.textLabel.text = @"待使用";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            [self test0];
        }
            break;
        case 1:
        {
            [self test1];
        }
            break;
        case 2:
        {
            [self test2];
        }
            break;
        case 3:
        {
            [self test3];
        }
            break;
        case 4:
        {
            [self test4];
        }
            break;
        case 5:
        {
            [self test5];
        }
            break;
        case 6:
        {
            [self test6];
        }
            break;
        case 7:
        {
            [self test7];
        }
            break;
        case 8:
        {
            [self test8];
        }
            break;
        case 9:
        {
            [self test9];
        }
            break;
        case 10:
        {
            [self test10];
        }
            break;
        case 11:
        {
            [self test11];
        }
            break;
        case 12:
        {
            [self test12];
        }
            break;
        case 13:
        {
            [self test13];
        }
            break;
        default:
            break;
    }
}
- (void)test0{
    //创建信号
    RACSignal *single = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        //发送消息
        [subscriber sendNext:@"a"];
        [subscriber sendNext:@"b"];
        //发送完成
        [subscriber sendCompleted];
        
        //清空数据
        return [RACDisposable disposableWithBlock:^{
            //当订阅者被消耗的时候就会执行
            //当订阅者发送完成,或者error的时候也会执行
            ZXLog(@"RACDisposable的block");
        }];
    }];
    
    //订阅信号
    RACDisposable *disposable = [single subscribeNext:^(id  _Nullable x) {
        ZXLog(@"value = %@", x);
    } error:^(NSError * _Nullable error) {
        ZXLog(@"error: %@", error);
    } completed:^{
        ZXLog(@"completed");
    }];
    
    //释放
    [disposable dispose];
}
- (void)test1{
    //先订阅, 在发送信号
    //1. 创建信号
    RACSubject *subject = [RACSubject subject];
    
    //2. 订阅
    //内部创建RACSubscriber
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者--%@", x);
    }];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二个订阅者---%@", x);
    }];
    
    //3. 发送信号
    //遍历所有的订阅者, 执行nextBlock
    [subject sendNext:@2];
}
- (void)test2{
    /*
     #import <UIKit/UIKit.h>
     #import <ReactiveObjC.h>
     
     @interface SubjectView : UIView
     
     @property (nonatomic, strong) RACSubject *subject;
     
     @end
     在自定义SubjectView.m文件中
     
     #import "SubjectView.h"
     
     @implementation SubjectView
     
     - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     //发送信号
     [_subject sendNext:self];
     }
     
     @end
     下面看一下在vc中的操作
     
     - (void)setupSubjectView {
     SubjectView *subV = [[SubjectView alloc]init];
     subV.backgroundColor = [UIColor redColor];
     subV.frame = CGRectMake(100, 100, 100, 100);
     RACSubject *subject = [RACSubject subject];
     [subject subscribeNext:^(id  _Nullable x) {
     NSLog(@"完成代理, 点击了view");
     
     UIColor *color = [UIColor colorWithRed:(arc4random() % 255) / 255.0 green:(arc4random() % 255) / 255.0 blue:(arc4random() % 255) / 255.0 alpha:1.0];
     self.view.backgroundColor = color;
     }];
     subV.subject = subject;
     [self.view addSubview:subV];
     }
     */
}
- (void)test3{
    /* ReactiveCocoa操作的核心方法是bind（绑定）,而且RAC中核心开发方式，也是绑定，之前的开发方式是赋值，而用RAC开发，应该把重心放在绑定，也就是可以在创建一个对象的时候，就绑定好以后想要做的事情，而不是等赋值之后在去做事情。
     在开发中很少使用bind方法，bind属于RAC中的底层方法，RAC已经封装了很多好用的其他方法，底层都是调用bind，用法比bind简单
     */
    /*
     [[_textField.rac_textSignal bind:^RACSignalBindBlock _Nonnull{
     return ^RACSignal *(id value, BOOL *stop){
     return [RACReturnSignal return:[NSString stringWithFormat:@"输出: %@", value]];
     };
     }] subscribeNext:^(id  _Nullable x) {
     NSLog(@"%@", x);
     }];
     
     */
}
- (void)test4{
    // https://www.jianshu.com/p/eafe55e5a00e
    /*
     所以订阅flattenMap的流程是，订阅源信号，获取源信号的sendNext值value，自己新创建一个信号(创建可能依赖value)，自动订阅自己创建的信号(如果信号非空)，将自己创建的信号的新value直接吐出来。
     
     所以订阅flattenMap的作用是，利用前一个信号的输出，再创建一个信号(可能使用上个输出)做一些操作，再将操作结果输出。
     
     */
    /*
     在臧成威的博客中提到接口串联可以使用flattenMap来实现，根据上面的分析和结论可以知道，下一个信号需要等待上一个信号执行完成，传递出value后才能继续。
     
     
     // 接口串联
     @weakify(self)
     RACSignal *finalSignal = [[self fetchData4]
     flattenMap:^RACSignal *(NSString *data4Result) {
     @strongify(self)
     return [self fetchData5:data4Result];
     }];
     
     */
    /*
     RACSignal * signal = [FlightHttpClient rac_forSeveralRequestsBind:@"NearbyAirportRecommend" params:@{@"data":params} responseClass:@"ZTFlightNearbyAirportRecommendResponseModel"];
     WEAK_SELF;
     return [signal flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
     STRONG_SELF;
     RACSignal * roundSignal = [self requestRoundRecommend];
     if (roundSignal) {
     return [RACSignal zip:@[[RACSignal return:value],roundSignal]];
     }
     else {
     return [RACSignal return:value];
     }
     }];
     */
    /*
     @weakify(self)
     [[_textField.rac_textSignal flattenMap:^__kindof RACSignal * _Nullable(NSString * _Nullable value) {
     //源信号发出的时候，就会调用这个block。
     // 返回值：绑定信号的内容.
     return [RACReturnSignal return:[NSString stringWithFormat:@"flat输出: %@", value]];
     }] subscribeNext:^(id  _Nullable x) {
     @strongify(self)
     //订阅绑定信号, 每当原信号发送内容, 处理后, 就会调用这个black
     self.showLabel.text = x;
     NSLog(@"%@", x);
     }];
     
     */
}
- (void)test5{
    //Map作用:把源信号的值映射成一个新的值
    /*
     [[_textField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
     return [NSString stringWithFormat:@"map输出: %@", value];
     }] subscribeNext:^(id  _Nullable x) {
     @strongify(self)
     self.showLabel.text = x;
     NSLog(@"%@", x);
     }];
     
     */
}
- (void)test6{
    /*
     FlatternMap中的Block返回信号。
     Map中的Block返回对象。
     开发中，如果信号发出的值不是信号，映射一般使用Map
     开发中，如果信号发出的值是信号，映射一般使用FlatternMap
     信号中信号
     
     当一个信号需要返回另一个信号中的值的时候
     让我们来看看下面这个例子
     #pragma 信号中信号
     - (void)singleAndSingle {
     //创建信号中信号
     RACSubject *sonSingle = [RACSubject subject];
     RACSubject *single = [RACSubject subject];
     
     [[sonSingle flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
     //sonSingle发送信号时, 才会调用
     return value;
     }] subscribeNext:^(id  _Nullable x) {
     //只有sonSingle的子信号, 大宋消息时, 才会调用
     NSLog(@"输出: %@", x);
     }];
     
     //信号中信号发送子信号
     [sonSingle sendNext:single];
     //子信号发送内容
     [single sendNext:@123];
     }
     */
}
- (void)test7{
    //rac 是给赋值的  //RACObserve监听值变化的
    /*
     RAC(self.usernameTextField,backgroundColor) = [validUsernameSignal map:^id(NSNumber * value) {
     return [value boolValue] ? [UIColor redColor]:[UIColor cyanColor];
     }];
     [RACObserve(self.usernameTextField, backgroundColor) subscribeNext:^(id x) {
     ZXLog(@"---%@",x);
     }];
     */
}
- (void)test8{
    //按照某一固定顺序拼接信号，当多个信号发出的时候，有顺序的接收信号
    //当需要按顺序执行的时候: 先执行A, 在执行B
    RACSubject *subjectA = [RACSubject subject];
    RACSubject *subjectB = [RACReplaySubject subject];
    
    NSMutableArray *array = [NSMutableArray array];
    
    //订阅信号
    [subjectA subscribeNext:^(id  _Nullable x) {
        [array addObject:x];
    }];
    [subjectB subscribeNext:^(id  _Nullable x) {
        [array addObject:x];
    }];
    
    //发送信号
    [subjectB sendNext:@"B"];
    [subjectA sendNext:@"A"];
    [subjectA sendCompleted];
    
    //输出: [B, A]
    ZXLog(@"%@", array);
    
    //当需要按顺序执行的时候: 先执行A, 在执行B
    RACSubject *subC = [RACSubject subject];
    RACSubject *subD = [RACReplaySubject subject];
    
    NSMutableArray *array2 = [NSMutableArray array];
    
    //订阅信号
    [[subC concat:subD] subscribeNext:^(id  _Nullable x) {
        [array2 addObject:x];
    }];
    
    //发送信号
    [subD sendNext:@"D"];
    [subC sendNext:@"C"];
    [subC sendCompleted];
    
    //输出: [C, D]
    ZXLog(@"%@", array2);
    
}
- (void)test9{
    //用于连接两个信号，当第一个信号完成，才会连接then返回的信号
    //注意: 使用then之前的信号的值会被忽略掉.
    RACSubject *subjectA = [RACReplaySubject subject];
    RACSubject *subjectB = [RACReplaySubject subject];
    
    //发送信号
    [subjectA sendNext:@"A"];
    [subjectA sendCompleted];
    [subjectB sendNext:@"B"];
    
    //订阅信号
    [[subjectA then:^RACSignal * _Nonnull{
        return subjectB;
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}
- (void)test10{
    //把多个信号合并为一个信号，任何一个信号有新值的时候就会调用
    
    // 只要想无序的整合信号数据
    RACSubject *subjectA = [RACSubject subject];
    RACSubject *subjectB = [RACSubject subject];
    RACSubject *subjectC = [RACSubject subject];
    
    //合并信号
    RACSignal *single = [[subjectA merge:subjectB] merge:subjectC];
    
    //订阅信号
    [single subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    //发出消息
    [subjectB sendNext:@"B"];
    
    [subjectA sendNext:@"A"];
    [subjectC sendNext:@"C"];
    
    
}
- (void)test11{
    /*
     把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元组，才会触发压缩流的next事件
     */
    // 只要想无序的整合信号数据
    RACSubject *subjectA = [RACSubject subject];
    RACSubject *subjectB = [RACSubject subject];
    
    //合并信号
    RACSignal *single = [subjectA zipWith:subjectB];
    
    //订阅信号
    [single subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    //发出消息
    [subjectA sendNext:@"A"];
    [subjectB sendNext:@"B"];
    
}
- (void)test12{
    /*
     将多个信号合并起来，并且拿到各个信号的最新的值
     必须每个合并的信号至少都有过一次sendNext，才会触发合并的信号
     */
    /*
     与zipWith区别
     1.当组合信号被订阅，内部会自动订阅两个信号,必须两个信号都发出内容，才会被触发。(而zip, 是两个信号同事发出内容, 才会触发)
     */
    /*
     RACSignal *single = [_accountText.rac_textSignal combineLatestWith:_passwordText.rac_textSignal];
     
     [single subscribeNext:^(id  _Nullable x) {
     RACTupleUnpack(NSString *account, NSString *password) = x;
     
     _loginButton.enabled = account.length > 0 && password.length > 0;
     }];
     
     */
}
- (void)test13{
    //聚合:用于信号发出是元组的内容，把信号发出元组的值聚合成一个值
    /*
     // reduce:把多个信号的值,聚合为一个值
     RACSignal *single = [RACSignal combineLatest:@[_accountText.rac_textSignal, _passwordText.rac_textSignal] reduce:^id (NSString *account, NSString *password){
     return @(account.length > 0 && password.length > 0);
     }];
     
     [single subscribeNext:^(id  _Nullable x) {
     _loginButton.enabled = [x boolValue];
     }];
     
     */
    
}
@end
