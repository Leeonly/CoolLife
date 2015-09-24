//
//  UIImage+Lee.m
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "UIImage+Lee.h"

@implementation UIImage (Lee)
+ (UIImage *)imageWithName:(NSString *)name
{
    return [UIImage imageNamed:name];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

@end
