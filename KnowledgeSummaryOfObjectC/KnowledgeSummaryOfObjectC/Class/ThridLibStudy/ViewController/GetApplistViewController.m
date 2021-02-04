//
//  GetApplistViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2021/2/4.
//  Copyright © 2021 张玺. All rights reserved.
//

#import "GetApplistViewController.h"
#import <objc/runtime.h>
@interface GetApplistViewController ()

@end

@implementation GetApplistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"获取已安装的三方app";
//    [self setUpView];
    [self test3];
}
- (void)setUpView{
//    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
//
//    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
//
//    NSLog(@"apps: %@", [workspace performSelector:@selector(allApplications)]);
    
    
    Class lsawsc = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [lsawsc performSelector:NSSelectorFromString(@"defaultWorkspace")];
    NSArray *plugins = [workspace performSelector:NSSelectorFromString(@"installedPlugins")]; //列出所有plugins
    [plugins enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *pluginID = [obj performSelector:(@selector(pluginIdentifier))];
        NSLog(@"%@",pluginID);
    }];
}
- (void)test2 {
    id space = [NSClassFromString(@"LSApplicationWorkspace") performSelector:@selector(defaultWorkspace)];
        NSArray *plugins = [space performSelector:@selector(installedPlugins)];
        NSMutableSet *list = [[NSMutableSet alloc] init];
        for (id plugin in plugins) {
            id bundle = [plugin performSelector:@selector(containingBundle)];
            if (bundle)
                [list addObject:bundle];
        }
        int a = 1;
        for (id plugin in list) {
            NSLog(@"🐒 %d--",a);
            a++;
            NSLog(@"bundleIdentifier =%@", [plugin performSelector:@selector(bundleIdentifier)]);//bundleID
            
            NSLog(@"applicationDSID =%@", [plugin performSelector:@selector(applicationDSID)]);
            NSLog(@"applicationIdentifier =%@", [plugin performSelector:@selector(applicationIdentifier)]);
            NSLog(@"applicationType =%@", [plugin performSelector:@selector(applicationType)]);
            NSLog(@"dynamicDiskUsage =%@", [plugin performSelector:@selector(dynamicDiskUsage)]);

            NSLog(@"itemID =%@", [plugin performSelector:@selector(itemID)]);
            NSLog(@"itemName =%@", [plugin performSelector:@selector(itemName)]);
            NSLog(@"minimumSystemVersion =%@", [plugin performSelector:@selector(minimumSystemVersion)]);
            
            NSLog(@"requiredDeviceCapabilities =%@", [plugin performSelector:@selector(requiredDeviceCapabilities)]);
            NSLog(@"sdkVersion =%@", [plugin performSelector:@selector(sdkVersion)]);
            NSLog(@"shortVersionString =%@", [plugin performSelector:@selector(shortVersionString)]);
            
            NSLog(@"sourceAppIdentifier =%@", [plugin performSelector:@selector(sourceAppIdentifier)]);
            NSLog(@"staticDiskUsage =%@", [plugin performSelector:@selector(staticDiskUsage)]);
            NSLog(@"teamID =%@", [plugin performSelector:@selector(teamID)]);
            NSLog(@"vendorName =%@", [plugin performSelector:@selector(vendorName)]);
        }
    
}
- (void)test3 {
    id space = [NSClassFromString(@"LSApplicationWorkspace") performSelector:@selector(defaultWorkspace)];
        NSArray *plugins = [space performSelector:@selector(installedPlugins)];
        NSMutableSet *list = [[NSMutableSet alloc] init];
        for (id plugin in plugins) {
            id bundle = [plugin performSelector:@selector(containingBundle)];
            if (bundle)
                [list addObject:bundle];
        }
        int a = 1;
        for (id plugin in list) {
            a++;
            NSString *name = [plugin performSelector:@selector(itemName)];
            NSLog(@"bundleIdentifier =%@", [plugin performSelector:@selector(bundleIdentifier)]);//bundleID

            if (name && name.length > 0) {
                
             
                NSLog(@"itemName =%@", [plugin performSelector:@selector(itemName)]);
            }
           
           
        }
    
}
- (void)test4 {
    NSMethodSignature *methodSignature = [NSClassFromString(@"LSApplicationWorkspace") methodSignatureForSelector:NSSelectorFromString(@"defaultWorkspace")];
    NSInvocation *invoke = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invoke setSelector:NSSelectorFromString(@"defaultWorkspace")];
    [invoke setTarget:NSClassFromString(@"LSApplicationWorkspace")];

    [invoke invoke];
    NSObject * objc;
    [invoke getReturnValue:&objc];


    NSMethodSignature *installedPluginsmethodSignature = [NSClassFromString(@"LSApplicationWorkspace") instanceMethodSignatureForSelector:NSSelectorFromString(@"installedPlugins")];
    NSInvocation *installed = [NSInvocation invocationWithMethodSignature:installedPluginsmethodSignature];
    [installed setSelector:NSSelectorFromString(@"installedPlugins")];
    [installed setTarget:objc];

    [installed invoke];
    NSObject * arr;
    [installed getReturnValue:&arr];


    for (NSObject *objc in arr) {

        NSMethodSignature *installedPluginsmethodSignature = [NSClassFromString(@"LSPlugInKitProxy") instanceMethodSignatureForSelector:NSSelectorFromString(@"containingBundle")];
        NSInvocation *installed = [NSInvocation invocationWithMethodSignature:installedPluginsmethodSignature];
        [installed setSelector:NSSelectorFromString(@"containingBundle")];
        [installed setTarget:objc];

        [installed invoke];
        NSObject * app;
        [installed getReturnValue:&app];
        NSLog(@"%@",app);
    }
}
@end
