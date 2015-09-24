//
//  LeeAccountTool.h
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LeeAccount;
@interface LeeAccountTool : NSObject
+ (void)save:(LeeAccount *)account;
+ (LeeAccount *)readAccount;
@end
