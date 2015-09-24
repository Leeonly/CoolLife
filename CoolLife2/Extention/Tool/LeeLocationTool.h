//
//  LeeLocationCity.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Singleton.h"

// 城市位置类
@interface LeeLocationCity : NSObject
@property (nonatomic, copy) NSString *city;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

// 通知名
#define LocationCityNote @"location_City_Note"
@interface LeeLocationTool : NSObject
singleton_interface(LeeLocationTool)

// 定位城市
@property (nonatomic, strong) LeeLocationCity *locationCity;

@end