//
//  AppDelegate.m
//  test
//
//  Created by hongbaodai on 2017/7/28.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self confitUdesk];
    // Custom code

    return YES;
}

- (void)confitUdesk
{
    //初始化公司（appKey、appID、domain都是必传字段）
    UdeskOrganization *organization = [[UdeskOrganization alloc] initWithDomain:@"hongbaodai.udesk.cn" appKey:@"4b03a91a5a3ba9220b791b7c2e4ceae8" appId:@"1a81ad417da619a9"];
    
    //注意sdktoken 是客户的唯一标识，用来识别身份,是你们生成传入给我们的。
    //sdk_token: 传入的字符请使用 字母 / 数字 等常见字符集 。就如同身份证一样，不允许出现一个身份证号对应多个人，或者一个人有多个身份证号;其次如果给顾客设置了邮箱和手机号码，也要保证不同顾客对应的手机号和邮箱不一样，如出现相同的，则不会创建新顾客。
    UdeskCustomer *customer = [UdeskCustomer new];
//    customer.sdkToken = @"df";
//    customer.nickName = @"我是udesk测试(可以随时把我关闭)";
    
    customer.sdkToken = @"153";
    customer.nickName = @"我是udesk测试(可以随时把我关闭)";
    customer.email = @"test@udesk.cn";
    customer.cellphone = @"18888888888";
    customer.customerDescription = @"我是测试";
    //初始化sdk
    [UdeskManager initWithOrganization:organization customer:customer];
    
    [UdeskManager requestRandomAgent:^(UdeskAgent *agent, NSError *error) {
        NSLog(@"=====%@",agent);
        //返回客服信息
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    __block UIBackgroundTaskIdentifier background_task;
    //注册一个后台任务，告诉系统我们需要向系统借一些事件
    background_task = [application beginBackgroundTaskWithExpirationHandler:^ {
        
        //不管有没有完成，结束background_task任务
        [application endBackgroundTask: background_task];
        background_task = UIBackgroundTaskInvalid;
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //根据需求 开启／关闭 通知
        [UdeskManager startUdeskPush];
    });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    //上线操作，拉取离线消息
    [UdeskManager setupCustomerOnline];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [UdeskManager registerDeviceToken:deviceToken];
}

@end
