//
//  UIImage+Lee.h
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Lee)
/**
 *  加载图片
 *
 *  @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

@end
