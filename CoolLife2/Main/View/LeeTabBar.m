//
//  LeeTabBar.m
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeTabBar.h"
#import "UIImage+Lee.h"
#import "LeeTabBarButton.h"

@interface LeeTabBar()

@property (nonatomic, weak) UIButton *selectButton;
@property (nonatomic, strong) NSMutableArray *arrButton;

@end

@implementation LeeTabBar

- (NSMutableArray *)arrButtons
{
    if (_arrButton == nil) {
        _arrButton = [NSMutableArray array];
    }
    return _arrButton;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
    }
    return self;
}

- (void)addButtonWithItem:(UITabBarItem *)item
{
    // 创建按钮
    LeeTabBarButton *button = [[LeeTabBarButton alloc]init];
    [self addSubview:button];
    
    // 添加按钮到数组中
    [self.arrButton addObject:button];
    
    button.item = item;
    
    // 点击监听
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    
    if (self.arrButton.count == 1) {
        [self clickButton:button];
    }
}

- (void)clickButton:(UIButton *)button
{
    // 通知代理点击了哪个
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonfrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonfrom:self.selectButton.tag to:button.tag];
    }
    // 点击按钮状态改变
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
}

// 子视图布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    //NSLog(@"%@",self.subviews);
    
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    // 按钮的frame数据
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.arrButton.count; index++) {
        // 1.取出按钮
        LeeTabBarButton *button = self.arrButton[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}


@end
