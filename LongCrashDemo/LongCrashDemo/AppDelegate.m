//
//  AppDelegate.m
//  LongCrashDemo
//
//  Created by zilong.li on 2017/11/24.
//  Copyright © 2017年 zilong.li. All rights reserved.
//

#import "AppDelegate.h"

#import "LongCrashManager.h"

@interface AppDelegate () <LongCrashDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //LongCrash 初始化
    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970] * 1000;
    [[LongCrashManager sharedInstancel] addDelegate:self delegateQueue:nil];
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970] * 1000;
    NSLog(@"%f",endTime - startTime);
    
    //测试unrecognized
    [[NSString class] performSelector:@selector(icjiocdj:fkofkoefkoe:) withObject:@""];
    [[NSString new] performSelector:@selector(icjiocdj:fkofkoefkoe:) withObject:@""];
    [[NSString new] performSelector:@selector(lastObject)];
    
    //测试数组
    id temp = nil;
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
    id value = [array objectAtIndex:4];
    [array insertObject:@"aaa" atIndex:3];
    [array addObject:temp];

    //测试字典
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"key2":@"123",@"123":@"456"}];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"123" forKey:temp];
    [dic setObject:temp forKey:@"key"];
    [dic removeObjectForKey:value];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - LongCrashDelegate

- (void)didCrashWithInfo:(NSString *)aInfo
{
    NSLog(@"%@",aInfo);
}


@end
