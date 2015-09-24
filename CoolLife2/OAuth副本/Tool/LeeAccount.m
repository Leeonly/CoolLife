//
//  LeeAccount.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeAccount.h"

@implementation LeeAccount
+(instancetype)accountWithDict:(NSDictionary *)dict
{
    LeeAccount *account = [[LeeAccount alloc] init];
    account.access_token = dict[@"access_token"];
    account.expires_in = dict[@"expires_in"];
    account.uid = dict[@"uid"];
    //确定授权的过期时间，当前时间+有效时间
    NSDate *now = [NSDate date];
    account.expires_time = [now dateByAddingTimeInterval:account.expires_in.doubleValue];
    return account;
}

-(id)initWithCoder:(NSCoder *)deCoder
{
    if (self = [super init]) {
        self.access_token = [deCoder decodeObjectForKey:@"access_token"];
        self.expires_in = [deCoder decodeObjectForKey:@"expires_in"];
        self.uid = [deCoder decodeObjectForKey:@"uid"];
        self.expires_time = [deCoder decodeObjectForKey:@"expires_time"];
        self.name = [deCoder decodeObjectForKey:@"name"];
        
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeObject:self.access_token forKey:@"access_token"];
    [enCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [enCoder encodeObject:self.uid forKey:@"uid"];
    [enCoder encodeObject:self.expires_time forKey:@"expires_time"];
    [enCoder encodeObject:self.name forKey:@"name"];
    
}

@end
