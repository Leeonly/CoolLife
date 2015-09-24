//
//  LeeAccountTool.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//
#define LeeAccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"account.account"]

#import "LeeAccountTool.h"
#import "LeeAccount.h"

@implementation LeeAccountTool
+(void)save:(LeeAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:LeeAccountFilePath];
}
+(LeeAccount *)readAccount
{
    LeeAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:LeeAccountFilePath];
    NSDate *now = [NSDate date];
    if ([now compare:account.expires_time] != NSOrderedAscending) {
        return nil;
    }
    return account;
}
@end
