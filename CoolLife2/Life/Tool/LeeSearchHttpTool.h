//
//  LeeSearchHttpTool.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeeSearchHttpTool : NSObject

// 获得天气数据
+ (void)getWeatherDataWithCity:(NSString *)city success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
// 获得身份证数据
+ (void)getIDCardData:(NSString *)IDcard success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure;
//+ (void)getRequest: (NSString *)httpUrl withHttpArg: (NSString *)HttpArg params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
// 获得手机号数据
+ (void)getPhoneData:(NSString *)phone success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure;

// 获得货币汇率数据 from 兑换货币  to 换入货币
+ (void)getCurrencyDataWithFrom:(NSString *)from to:(NSString *)to amount:(NSString *)amount success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure;


// 获得IP地址数据
+ (void)getIPDataWithIP:(NSString *)IP success:(void (^)(NSData *data))success failure:(void (^)(NSError *))failure;

@end
