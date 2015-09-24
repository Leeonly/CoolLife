//
//  LeeHttpTool.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeHttpTool.h"
#import "AFNetworking.h"

#define baidukey @"80903232f248e060a48050c902b1c8ec"

@implementation LeeHttpTool

+ (void)getRequest:(NSString *)HttpUrl withHttpArg: (NSString*)HttpArg success:(void(^)(NSData *data))success failure:(void(^)(NSError *error))failure
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", HttpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:baidukey  forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
//                                   error(failure);
                               } else {
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HttpResponseCode:%ld", responseCode);
                                   NSLog(@"HttpResponseBody %@",responseString);
                                   success(data);
                               }
                           }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    // AFNetWorking
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 发生请求
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}

+ (void)postXmlWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    // AFNetWorking
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //NSDictionary *params = @{@"format": @"xml"};
    // 发生请求
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // AFNetWorking
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 发送请求
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> allFormData) {
        for (WBFormData *formData in formDataArray) {
            [allFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // AFNetWorking
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 发生请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
@end

/**
 *  用来封装文件数据的模型
 */
@implementation WBFormData

@end
