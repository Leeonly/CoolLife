//
//  ProductSection.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "ProductSection.h"

@implementation ProductSection

+ (instancetype)section
{
    return [[self alloc]init];
}

- (id)init
{
    if (self = [super init]) {
        _items = [NSMutableArray array];
    }
    return self;
}
@end
