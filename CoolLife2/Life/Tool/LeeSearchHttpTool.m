//
//  LeeSearchHttpTool.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeSearchHttpTool.h"
#import "LeeHttpTool.h"

#define baidukey @"Q0qFFiynCewS75iBPQ9TkChH"

@implementation LeeSearchHttpTool

+ (void)getWeatherDataWithCity:(NSString *)city success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"location"] = city;
    params[@"ak"] = baidukey;
    params[@"output"] = @"json";
    
    // 发送请求
    [LeeHttpTool getWithURL:@"http://api.map.baidu.com/telematics/v3/weather?" params:params success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"%@",error);
        }
    }];
}

+ (void)getIDCardData:(NSString *)IDcard success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure
{
    // 请求参数
    NSString *id = [[NSString alloc]initWithFormat:@"id=%@",IDcard];
    NSString *url = @"http://apis.baidu.com/apistore/idservice/id";
    // 发送请求
    [LeeHttpTool getRequest:url withHttpArg:id success:^(NSData *data) {
        if (success) {
            success(data);
            LeeLog(@"sucess!!!!!!!!!!!");
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            LeeLog(@"%@",error);
        }
    }];
}

+ (void)getPhoneData:(NSString *)phone success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure
{
    // 请求参数
    
    NSString *id = [[NSString alloc]initWithFormat:@"phone=%@",phone];
    NSString *url = @"http://apis.baidu.com/apistore/mobilenumber/mobilenumber";
    // 发送请求
    [LeeHttpTool getRequest:url withHttpArg:id success:^(NSData *data) {
        success(data);
        LeeLog(@"sucess!!!!!!!!!!!");
    } failure:^(NSError *error) {
        failure(error);
        LeeLog(@"%@",error);
    }];
}

+ (void)getCurrencyDataWithFrom:(NSString *)from to:(NSString *)to amount:(NSString *)amount success:(void (^)(NSData *data))success failure:(void (^)(NSError *error))failure
{
    
    NSString *id = [[NSString alloc]initWithFormat:@"fromCurrency=%@&toCurrency=%@&amount=%@",from,to,amount];
    NSString *url = @"http://apis.baidu.com/apistore/currencyservice/currency";
    
    // 发送请求
    [LeeHttpTool getRequest:url withHttpArg:id success:^(NSData *data) {
        if (success) {
            success(data);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}


+ (void)getIPDataWithIP:(NSString *)IP success:(void (^)(NSData *data))success failure:(void (^)(NSError *))failure
{
    // 请求参数
    //    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //    params[@"ip"] = IP;
    //    params[@"f"] = @"json";
    NSString *id = [[NSString alloc]initWithFormat:@"ip=%@",IP];
    NSString *url = @"http://apis.baidu.com/apistore/iplookupservice/iplookup";
    
    // 发送请求
    [LeeHttpTool getRequest:url withHttpArg:id success:^(NSData *data) {
        if (success) {
            success(data);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"%@",error);
        }
    }];
}

@end
