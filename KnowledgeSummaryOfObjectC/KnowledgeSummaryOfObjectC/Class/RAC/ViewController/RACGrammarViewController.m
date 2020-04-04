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
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //    cell.textLabel.textColor = RandomColor;
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
            cell.textLabel.text = @"8-concat(组合)";
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
        case 14:
            cell.textLabel.text = @"14-filter";
            return cell;
            break;
        case 15:
            cell.textLabel.text = @"15-ignore";
            return cell;
            break;
        case 16:
            cell.textLabel.text = @"16-distinctUntilChanged";
            return cell;
            break;
        case 17:
            cell.textLabel.text = @"17-take";
            return cell;
            break;
        case 18:
            cell.textLabel.text = @"18-takeLast";
            return cell;
            break;
        case 19:
            cell.textLabel.text = @"19-takeUntil";
            return cell;
            break;
        case 20:
            cell.textLabel.text = @"20-switchToLatest";
            return cell;
            break;
        case 21:
            cell.textLabel.text = @"21-skip";
            return cell;
            break;
        case 22:
            cell.textLabel.text = @"22-interval(定时操作)";
            return cell;
            break;
        case 23:
            cell.textLabel.text = @"23-delay";
            return cell;
            break;
        case 24:
            cell.textLabel.text = @"24-timeout";
            return cell;
            break;
        case 25:
            cell.textLabel.text = @"25-retry(重复)";
            return cell;
            break;
        case 26:
            cell.textLabel.text = @"26-replay";
            return cell;
            break;
        case 27:
            cell.textLabel.text = @"27-throttle";
            return cell;
            break;
            case 28:
                       cell.textLabel.text = @"28-catch";
                       return cell;
                       break;
            case 29:
                                  cell.textLabel.text = @"29-catchTo";
                                  return cell;
                                  break;
        default:
            cell.textLabel.text = @"待使用";
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
        case 14:
        {
            [self test14];
        }
            break;
        case 15:
        {
            [self test15];
        }
            break;
        case 16:
        {
            [self test16];
        }
            break;
        case 17:
        {
            [self test17];
        }
            break;
        case 18:
        {
            [self test18];
        }
            break;
        case 19:
        {
            [self test19];
        }
            break;
        case 20:
        {
            [self test20];
        }
            break;
        case 21:
        {
            [self test21];
        }
            break;
        case 22:
        {
            [self test22];
        }
            break;
        case 23:
        {
            [self test23];
        }
            break;
        case 24:
        {
            [self test24];
        }
            break;
        case 25:
        {
            [self test25];
        }
            break;
        case 26:
        {
            [self test26];
        }
            break;
        case 27:
        {
            [self test27];
        }
            break;
            case 28:
                   {
                       [self test28];
                   }
                       break;
            case 29:
                              {
                                  [self test29];
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
- (void)test14{
    /*
     //filter
     //截取等于11位的字符
     [[_accountText.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
     //类似手机号的输入, 只有等于11位的时候才返回true
     return value.length == 11;
     }]subscribeNext:^(NSString * _Nullable x) {
     //这里只会返回等于11位的字符
     NSLog(@"filter = %@", x);
     }];
     
     */
}
- (void)test15{
    //创建信号
    
    RACSubject*signal = [RACSubject subject];
    
    //ignore是忽略一些值
    
    //ignoreVlaues忽略所有的值
    
    RACSignal*ignoreSignal = [signal ignore:@"luobo"];
    
    //    RACSignal *ignoreSignal = [signal ignoreValues];
    
    //订阅信号
    //
    //    [ignoreSignal subscribeNext:^(idx) {
    //
    //    NSLog(@"%@",x);
    //
    //    }];
    [ignoreSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    //发送信号
    
    [signal sendNext:@"luobo"];
    
    [signal sendNext:@"crazy"];
    
}
- (void)test16{
    /*
     当上一次的值和当前的值有明显的变化就会发出信号，否则会被忽略掉。
     在开发中，刷新UI经常使用，只有两次数据不一样才需要刷新
     */
    //创建信号
    RACSubject *subject = [RACSubject subject];
    
    //订阅
    [[subject distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
        ZXLog(@"distinctUntilChanged = %@", x);
    }];
    
    [subject sendNext:@12];
    [subject sendNext:@12];
    [subject sendNext:@23];
    
    
}
- (void)test17{
    /*
     从开始一共取N次的信号, 当遇到sendCompleted语句执行时, 会提前停止发送信号
     */
    //take
    RACSubject *subject1 = [RACSubject subject];
    [[subject1 take:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    //如果上面发送信号的代码调整为
    [subject1 sendNext:@1];
    [subject1 sendCompleted];
    [subject1 sendNext:@2];
    [subject1 sendNext:@3];
    
    
}
- (void)test18{
    /*
     取调用sendCompleted之前的N次信号,前提条件，订阅者必须调用sendCompleted，否则不会执行任何操作
     */
    //takeLast
    RACSubject *subject1 = [RACSubject subject];
    [[subject1 takeLast:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    [subject1 sendNext:@1];
    [subject1 sendNext:@2];
    [subject1 sendNext:@3];
    [subject1 sendCompleted];
    
    
}
- (void)test19{
    /*
     只要传入的信号发送完成或者subject2开始发送信号的时候,就不会再接收信号的内容
     */
    //takeUntil
    RACSubject *subject1 = [RACSubject subject];
    RACSubject *subject2 = [RACSubject subject];
    
    [[subject1 takeUntil:subject2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    [subject1 sendNext:@11];
    [subject1 sendNext:@12];
    //    [subject1 sendCompleted];
    [subject1 sendNext:@13];
    [subject2 sendNext:@"21"];
    [subject2 sendNext:@"22"];
    [subject1 sendNext:@14];
    
    //这样会输出: 11, 12, 13
    //当sendCompleted取消注释的时候, 只会输出: 11, 12
    
}
- (void)test20{
    /*
     主要用于信号的信号, 有时候也会发出信号, 会在信号的信号中获取其发送的最新的信号
     */
    //信号的信号
    RACSubject *subject1 = [RACSubject subject];
    RACSubject *subject2 = [RACSubject subject];
    
    //获取信号中信号最近发出信号，订阅最近发出的信号
    [[subject1 switchToLatest] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    //发送信号
    [subject1 sendNext:subject2];
    [subject2 sendNext:@"信号中信号"];
    
    //最终结果输出: "信号中信号"
    
}
- (void)test21{
    /*
     跳过N个信号后, 再开始订阅信号
     */
    
    //创建信号
    RACSubject *subject = [RACSubject subject];
    
    //订阅信号
    //要求跳过2个信号
    [[subject skip:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    //发送信号
    [subject sendNext:@1];
    [subject sendNext:@2];
    [subject sendNext:@3];
    [subject sendNext:@4];
    
    //因为上面跳过了两个信号, 所以这里只会输出: 3, 4
    
}
- (void)test22{
    //RAC定时器, 每隔一段时间执行一次
    //其中RACScheduler是RAC中管理线程的类
    
    [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"定时器ffffaaaaag");
    }];
    
}
- (void)test23{
    /*
     延迟一段时间都发送信号
     */
    //delay: 延迟执行
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"delay"];
        return nil;
    }] delay:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
}
- (void)test24{
    /*
     超时, 可以让一个信号在一定时间后自动报错
     */
    RACSignal *single = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"先成功"];
        return nil;
    }] timeout:2 onScheduler:[RACScheduler currentScheduler]];
    
    [single subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    } error:^(NSError * _Nullable error) {
        //2秒后自动调用
        NSLog(@"%@", error);
    }];
    
}
- (void)test25{
    /*
     重试 ：只要失败，就会重新执行创建信号中的block,直到成功.
     */
    //retry
    __block int i = 0;
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        if (i == 5) {
            [subscriber sendNext:@12];
        } else {
            NSLog(@"发生错误");
            [subscriber sendError:nil];
        }
        i++;
        
        return nil;
    }] retry] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
}
- (void)test26{
    //重放：当一个信号被多次订阅,反复播放内容
    
    RACSignal *single = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@23];
        [subscriber sendNext:@34];
        
        return nil;
    }] replay];
    
    [single subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一次订阅-%@", x);
    }];
    
    [single subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二次订阅-%@", x);
    }];
    
    
}
- (void)test27{
    /*
     节流:当某个信号发送比较频繁时，可以使用节流, 在一定时间（1秒）内，不接收任何信号内容，过了这个时间（1秒）获取最后发送的信号内容发出。
     */
    RACSubject *subject = [RACSubject subject];
    
    [[subject throttle:0.001] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    [subject sendNext:@10];
    [subject sendNext:@11];
    [subject sendNext:@12];
    [subject sendNext:@13];
    [subject sendNext:@14];
    [subject sendNext:@15];
    [subject sendNext:@16];
    [subject sendNext:@17];
    [subject sendNext:@18];
    
    
}
- (void)test28{
    /*
     catch:方法的核心就在于对error信号的处理，参照上面的代码可以看到，catch:方法在原信号流sendError的时候，将对应的NSError通过catchBlock转换成了一个新的信号流并让原订阅者继续订阅。
     */
    // 原始信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendError:nil];
        return nil;
    }];

    // 经过catch:方法将sendError:nil替换为sendNext:@2
    RACSignal *catchedSignal = [signal catch:^RACSignal * _Nonnull(NSError * _Nonnull error) {
        return [RACSignal return:@2];
    }];

    // 输出日志
    [catchedSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"sendNext: %@", x);
    } error:^(NSError * _Nullable error) {
        NSLog(@"sendError");
    } completed:^{
        NSLog(@"sendCompleted");
    }];
    //最终输出结果如下，其中的错误信号被替换了
}
- (void)test29{
    /*
     可以看到逻辑很简单，就是预先传入了一个signal，无论收到的sendError传了什么类型的NSError，都直接返回这个signal。
     */
    // 原始信号
       RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
           [subscriber sendNext:@1];
           [subscriber sendError:nil];
           return nil;
       }];

       // 经过catch:方法将sendError:nil替换为sendNext:@2
       RACSignal *catchedSignal = [signal catchTo:[RACSignal return:@(2)]];

       // 输出日志
       [catchedSignal subscribeNext:^(id  _Nullable x) {
           NSLog(@"sendNext: %@", x);
       } error:^(NSError * _Nullable error) {
           NSLog(@"sendError");
       } completed:^{
           NSLog(@"sendCompleted");
       }];
}
@end
