//
//  ProductSection.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ProductSection : NSObject

// 头部标题
@property (nonatomic, copy) NSString *headerTitle;
// 尾部标题
@property (nonatomic, copy) NSString *footerTitle;

@property (nonatomic, weak) UIView *headerView;

@property (nonatomic, weak) UIView *footerView;

// 存放item的数组
@property (nonatomic, copy) NSMutableArray *items;

+ (instancetype)section;

@end
