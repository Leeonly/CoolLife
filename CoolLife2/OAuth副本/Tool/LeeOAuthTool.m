//
//  LeeOAuthTool.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeOAuthTool.h"
#import "LeeHttpTool.h"
#import "MJExtension.h"

@implementation LeeOAuthTool
+ (void)OAuthWithParam:(LeeOAuthParam *)param success:(void(^)(LeeAccount *account))success failure:(void(^)(NSError *error))failure
{
    [LeeHttpTool post:@"https://api.weibo.com/oauth2/access_token" params:param.keyValues success:^(id responeObj) {
        if (success) {
            //字典转模型
            LeeAccount *accounts = [LeeAccount accountWithDict:responeObj];
            success(accounts);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
