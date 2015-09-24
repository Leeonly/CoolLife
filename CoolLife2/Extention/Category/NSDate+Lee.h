//
//  NSDate+Lee.h
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Lee)
+ (NSString *)compareCurrentTime:(NSDate*) compareDate;
- (NSDateComponents *)compare:(NSDate *)other;
@end
