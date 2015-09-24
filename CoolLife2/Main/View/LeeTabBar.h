//
//  LeeTabBar.h
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeeTabBar;
@protocol LeeTabBarDelegate <NSObject>
@optional
- (void)tabBar:(LeeTabBar *)tabBar didSelectedButtonfrom:(int)from to:(int)to;
@end

@interface LeeTabBar : UIView
- (void)addButtonWithItem:(UITabBarItem *)item;
@property (nonatomic, weak) id<LeeTabBarDelegate> delegate;
//- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@end
