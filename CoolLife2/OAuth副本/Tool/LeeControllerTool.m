//
//  LeeControllerTool.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeControllerTool.h"
#import "LeeTabBarController.h"
#import "LeeNewfeatureViewController.h"

@implementation LeeControllerTool
+ (void)changeRootViewControll
{
    //判断切换的控制器
    NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:versionKey];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if ([lastVersion isEqualToString:currentVersion]) {
        LeeTabBarController *tabBar = [[LeeTabBarController alloc] init];
        window.rootViewController = tabBar;
    }else{
        LeeNewFeatureViewController *newFeature = [[LeeNewFeatureViewController alloc] init];
        window.rootViewController = newFeature;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:versionKey];
    }
}
@end
