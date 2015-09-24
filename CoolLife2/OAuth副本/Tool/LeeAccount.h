//
//  LeeAccount.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeeAccount : NSObject <NSCoding>
/** 用于调用access_token，接口获取授权后的access token */
@property (nonatomic,copy)NSString *access_token;
/** access_token的生命周期，单位是秒数 */
@property (nonatomic,copy)NSString *expires_in;
/** access_token的过期时间 */
@property (nonatomic,copy)NSDate *expires_time;
/** 当前授权用户的UID */
@property (nonatomic,copy)NSString *uid;
/** 当前授权用户的昵称 */
@property (nonatomic,copy)NSString *name;

+(instancetype)accountWithDict:(NSDictionary *)dict;
@end
