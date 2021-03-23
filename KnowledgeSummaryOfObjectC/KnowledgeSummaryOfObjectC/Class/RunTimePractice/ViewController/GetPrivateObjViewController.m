//
//  GetPrivateObjViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/11/25.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "GetPrivateObjViewController.h"
#import "GetPrivateObjOne.h"
#import "GetPrivateObjTwo.h"

#import <objc/runtime.h>

@interface GetPrivateObjViewController ()

@end

//void setDefaultValueForCacheBeanObject(id obj, NSString *memberName, NSString *classType, Ivar ivar) {
//    if (obj == NULL || memberName == NULL || classType == NULL) {
//        return;
//    }
//
//    if ([classType hasPrefix:@"@\""] && classType.length > 3) {
//        NSString *className = [classType substringWithRange:NSMakeRange(2, classType.length-3)];
//        Class objClass = NSClassFromString(className);
//
//        GetPrivateObjTwo * dd = object_getIvar(objClass, ivar);
//
//        if (objClass != NULL) {
//            id objDefaultValue = [[objClass alloc] init];
//
//            if (objDefaultValue != NULL) {
//                [obj setValue:objDefaultValue forKey:memberName];
//            }
//        }
//    }
//}

@implementation GetPrivateObjViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
    
//    [self testTwo];
}

- (void)setUpView
{
    GetPrivateObjOne * objOne = [[GetPrivateObjOne alloc]init];
    
    unsigned int count = 0;
       Ivar *members = class_copyIvarList([GetPrivateObjOne class], &count);
       for (int i = 0 ; i < count; i++) {
           Ivar ivar = members[i];
           const char *keyStr = ivar_getName(ivar);
           NSString *key = [NSString stringWithUTF8String:keyStr];//取得这个变量的名称
           
           const char *type = ivar_getTypeEncoding(ivar); //取得这个变量的类型

           NSString *typeStr = [NSString stringWithUTF8String:type];
           

           
           if ([typeStr isEqualToString:@"*"]) {
               continue;
           }
           [self testClass:self memberName:key classType:typeStr ivar:ivar];

       }
    
}

- (void)testClass:(id)obj memberName:(NSString *)memberName  classType:(NSString *)classType ivar:(Ivar)ivar
{
    if (obj == NULL || memberName == NULL || classType == NULL) {
        return;
    }
    
    if ([classType hasPrefix:@"@\""] && classType.length > 3) {
        NSString *className = [classType substringWithRange:NSMakeRange(2, classType.length-3)];
        Class objClass = NSClassFromString(className);
    
        [objClass performSelector:@selector(eat) ];
        
       
    }
}

- (void)testTwo  {
    GetPrivateObjOne * objOne = [[GetPrivateObjOne alloc]init];
 
    Ivar ivar = class_getInstanceVariable([objOne class], @"_twoObj");
    id vname = object_getIvar(objOne, ivar);
    GetPrivateObjTwo *test = [[GetPrivateObjTwo alloc]init];
    test = vname;
    [test eat];
    
}

/*
unsigned int count = 0;
   Ivar *members = class_copyIvarList([GetPrivateObjOne class], &count);
   for (int i = 0 ; i < count; i++) {
       Ivar var = members[i];
       const char *memberName = ivar_getName(var);
       const char *memberType = ivar_getTypeEncoding(var);
     
//           NSClassFromString(memberType) *test =
//           NSLog(@"%@",var);
       NSLog(@"%s----%s", memberName, memberType);
   }
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
