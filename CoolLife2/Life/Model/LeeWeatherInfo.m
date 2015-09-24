//
//  LeeWeatherInfo.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeWeatherInfo.h"

@implementation LeeWeatherInfo
- (NSDictionary *)objectClassInArray
{
    return @{@"index": [LeeIndexDetail class], @"weather_data": [LeeWeatherData class]};
}
@end



@implementation LeeIndexDetail

@end


@implementation LeeWeatherData

@end