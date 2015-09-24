//
//  LeeHttpTool.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface LeeHttpTool : NSObject
+ (void)get:(NSString *)url params:(NSDictionary *)parmas success:(void(^)(id responeObj))success failure:(void(^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)parmas success:(void(^)(id responeObj))success failure:(void(^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)parmas constructingBodyWithBlock:(void(^)(id<AFMultipartFormData> formData))block success:(void(^)(id responeObj))success failure:(void(^)(NSError *error))failure;
@end
