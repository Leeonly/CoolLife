//
//  LeeOAuthTool.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeeAccount.h"
#import "LeeOAuthParam.h"
//@class LeeOAuthParam;

@interface LeeOAuthTool : NSObject
+ (void)OAuthWithParam:(LeeOAuthParam *)param success:(void(^)(LeeAccount *account))success failure:(void(^)(NSError *error))failure;
@end
