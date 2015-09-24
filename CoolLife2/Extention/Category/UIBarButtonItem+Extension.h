//
//  UIBarButtonItem+Extension.h
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
