//
//  LeeHttpTool.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeHttpTool.h"
#import "AFNetworking.h"
@implementation LeeHttpTool
+ (void)get:(NSString *)url params:(NSDictionary *)parmas success:(void(^)(id responeObj))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:url parameters:parmas success:^(AFHTTPRequestOperation *operation, id resultDict) {
        if (success) {
            success(resultDict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
+ (void)post:(NSString *)url params:(NSDictionary *)parmas success:(void(^)(id responeObj))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr POST:url parameters:parmas success:^(AFHTTPRequestOperation *operation, id resultDict) {
        if (success) {
            success(resultDict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)post:(NSString *)url params:(NSDictionary *)parmas constructingBodyWithBlock:(void(^)(id<AFMultipartFormData> formData))block success:(void(^)(id responeObj))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr POST:url parameters:parmas constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (block) {
            block(formData);
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

@end
