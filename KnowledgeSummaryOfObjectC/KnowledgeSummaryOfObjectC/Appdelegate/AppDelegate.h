//
//  AppDelegate.h
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2017/9/1.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

