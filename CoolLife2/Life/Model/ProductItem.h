//
//  ProductItem.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ProductItem : NSObject
// 标题
@property (nonatomic, copy) NSString *title;
// 图标
@property (nonatomic, copy) NSString *icon;
// 点击cell 运行的控制器
@property (nonatomic, assign) Class destVcClass;
// 点击cell 运行block
@property (nonatomic, copy) void (^selectionHandler)();

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVcClass:(Class) destVcClass;

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon selectionHandler:(void (^)(id item))selectionHandler;

@end
