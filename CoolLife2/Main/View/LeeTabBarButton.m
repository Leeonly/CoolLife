//
//  LeeTabBarButton.m
//  微博
//
//  Created by Leon on 15/9/14.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

// 图标的比例
#define LeeTabBarButtonImageRatio 0.6
// 按钮的默认文字颜色
#define  LeeTabBarButtonTitleColor ( [UIColor whiteColor])
// 按钮的选中文字颜色
#define  LeeTabBarButtonTitleSelectedColor LeeColor(248, 139, 0)

#import "LeeTabBarButton.h"
#import "LeeBadgeButton.h"

@interface LeeTabBarButton()
/**
 *  提醒数字
 */
@property (nonatomic, weak) LeeBadgeButton *badgeButton;
@end

@implementation LeeTabBarButton

- (id)initWithFrame:(CGRect)frame
{

self = [super initWithFrame:frame];
if (self) {
    
    // 图标居中
    self.imageView.contentMode = UIViewContentModeCenter;
    // 文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    // 文字颜色
    [self setTitleColor:LeeTabBarButtonTitleColor forState:UIControlStateNormal];
    [self setTitleColor:LeeTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
    
    // 添加一个提醒数字按钮
    LeeBadgeButton *badgeButton = [[LeeBadgeButton alloc] init];
    badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self addSubview:badgeButton];
    
}
return self;
}

// 重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {}

// 内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * LeeTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

// 内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * LeeTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

// 设置item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置提醒数字
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}

@end
