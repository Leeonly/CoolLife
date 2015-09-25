//
//  LeeTabBarController.m
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeTabBarController.h"
#import "UIImage+Lee.h"
#import "LeeTabBar.h"
#import "LeeNavigationController.h"
#import "LeeMoreViewController.h"
#import "LeeNewsMenuController.h"
#import "ProductController.h"
#import "LeeGroupBuyController.h"
#import "TestViewController.h"

#import "CSStickyHeaderFlowLayout.h"
@interface LeeTabBarController () <LeeTabBarDelegate>

@property (nonatomic, weak) ProductController *life;
@property (nonatomic, weak) LeeMoreViewController *more;
//// 自定义的tabbar
@property (nonatomic, weak) LeeTabBar *customTabBar;
@end

@implementation LeeTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBar];
    
    [self setupAllChildViewControllers];
    
    
//    // 2.更换系统自带的tabbar
//    //    self.tabBar = [[LeeTabBar alloc]init];
//    LeeTabBar *atabBar = [[LeeTabBar alloc]init];
//    atabBar.delegate = self;
//    [self setValue:atabBar forKeyPath:@"tabBar"];

}

- (void)setupTabBar
{
    LeeTabBar *customTabBar = [[LeeTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    //    LeeLog(@"setupTabBar");
}
// tabbar代理方法 点击了哪个
- (void)tabBar:(LeeTabBar *)tabBar didSelectedButtonfrom:(int)from to:(int)to
{
    self.selectedIndex = to;
    if (to == 3) { // 点击更多
        //[self.home refreshData];
        // 传递数据
//        self.more.weatherInfo = self.life.weatherInfo;
    }
}



- (void)setupAllChildViewControllers
{
    // 首页控制器
    // 创建布局
    CSStickyHeaderFlowLayout *layout = [[CSStickyHeaderFlowLayout alloc]init];
    // 设置cell尺寸
    layout.itemSize = CGSizeMake(80, 80);
    // 设置水平间距
    layout.minimumInteritemSpacing = 0;
    // 设置垂直间距
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 170);
    layout.headerReferenceSize = CGSizeMake(200, 50);
    
    ProductController *life = [[ProductController alloc] initWithCollectionViewLayout:layout];
//    ProductCollectionController *life = [[ProductCollectionController alloc]initWithCollectionViewLayout:layout];
    [self addChildVc:life title:@"生活" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    self.life = life;
    
    // 新闻控制器

    LeeNewsMenuController*news = [[LeeNewsMenuController alloc]init];
    //msg.tabBarItem.badgeValue = @"30";
    [self addChildVc:news title:@"新闻" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    // 团购控制器
//    LeeGroupBuyController *discover = [[LeeGroupBuyController alloc] init];

    TestViewController *discover = [[TestViewController alloc] init];
    [self addChildVc:discover title:@"团购" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    // 更多控制器
    LeeMoreViewController *more = [[LeeMoreViewController alloc] init];
    [self addChildVc:more title:@"更多" image:@"tabbar_more" selectedImage:@"tabbar_more_selected"];
    self.more = more;
    
    
    // 2.更换系统自带的tabbar
//        LeeTabBar *tabBar = [[LeeTabBar alloc] init];
//        tabBar.delegate = self;
//        [self setValue:tabBar forKeyPath:@"tabBar"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImageName
{
    // 设置子控制器文字和图片
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 设置选中的图标
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
  
    // 2.包装一个导航控制器
    LeeNavigationController *nav = [[LeeNavigationController alloc]initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addButtonWithItem:childVc.tabBarItem];
    
}


#pragma mark - LeeTabBarDelegate代理方法
//- (void)tabBarDidClickPlusButton:(LeeTabBar *)tabBar
//{
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
//    [self presentViewController:vc animated:YES completion:nil];
//}

@end
