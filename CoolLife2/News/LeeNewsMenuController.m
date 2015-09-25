//
//  LeeNewsMenuController.m
//  CoolLife2
//
//  Created by Leon on 15/9/25.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeNewsMenuController.h"
#import "REMenu.h"
#import "LeeNewsViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface LeeNewsMenuController ()
@property (nonatomic, strong) REMenu *menu;
@end

#define baiduNewUrl @"http://news.baidu.com" //@"http://m.baidu.com/news?fr=mohone"
#define fengNewUrl @"http://3g.ifeng.com"
#define sinaNewUrl @"http://news.sina.cn"
#define tencenNewUrl @"http://info.3g.qq.com"
#define wangyiNewUrl @"http://3g.163.com"
#define sohuNewUrl @"http://m.sohu.com"
#define huanqiuNewUrl @"http://m.huanqiu.com"
@implementation LeeNewsMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 添加右导航按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(selectMoreNews) image:@"navigationbar_more" highImage:nil];
    
    // 设置背景
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"audionews_play_bg_morning.jpg"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    // 设置menuview
    [self setupMenuView];
}

// 视图将出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}

// 视图将消失
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if ([self.menu isOpen]) {
        [self.menu close];
    }
}

// 显示菜单
- (void)selectMoreNews
{
    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}

#pragma mark 设置menuview
- (void)setupMenuView
{
    // 消除block强引用
    __typeof (self) __weak weakSelf = self;
    REMenuItem *baiduItem = [[REMenuItem alloc] initWithTitle:@"百度新闻" subtitle:@"全球最大的中文新闻平台" image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:baiduNewUrl];
    }];
    REMenuItem *fengItem = [[REMenuItem alloc] initWithTitle:@"凤凰新闻" subtitle:@"24小时提供最及时，最权威，最客观的新闻资讯" image:nil highlightedImage:nil
 action:^(REMenuItem *item) {
     [weakSelf pushViewControllerWithUrl:fengNewUrl];
    }];
    REMenuItem *sinaItem = [[REMenuItem alloc] initWithTitle:@"新浪新闻" subtitle:@"最新，最快头条新闻一网打尽" image:nil highlightedImage:nil action:^(REMenuItem *item)
    {
        [weakSelf pushViewControllerWithUrl:sinaNewUrl];
    }];
    REMenuItem *tencenItem = [[REMenuItem alloc] initWithTitle:@"腾讯新闻" subtitle:@"中国浏览最大的中文门户网站"image:nil highlightedImage:nil action:^(REMenuItem *item   ) {
        [weakSelf pushViewControllerWithUrl:tencenNewUrl];
    }];
    
    REMenuItem *wangyiItem = [[REMenuItem alloc] initWithTitle:@"网易新闻" subtitle:@"因新闻最快速，评论最犀利而备受推崇" image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:wangyiNewUrl];
    }];
    
    REMenuItem *sohuItem = [[REMenuItem alloc] initWithTitle:@"搜狐新闻"
                                                    subtitle:@"中文互联网成立最早,最权威的视频新闻门户"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf pushViewControllerWithUrl:sohuNewUrl];
                                                      }];
    REMenuItem *huanqiuItem = [[REMenuItem alloc] initWithTitle:@"环球新闻"
                                                       subtitle:@"网罗环球要闻"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             [weakSelf pushViewControllerWithUrl:huanqiuNewUrl];
                                                         }];
    
    self.menu = [[REMenu alloc] initWithItems:@[fengItem, baiduItem, sinaItem, tencenItem, wangyiItem,sohuItem,huanqiuItem]];
    self.menu.liveBlur = YES;
    self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    self.menu.textColor = [UIColor whiteColor];
    self.menu.subtitleTextColor = [UIColor whiteColor];
    
    [self.menu showInView:self.view];
}

- (void)pushViewControllerWithUrl:(NSString *)url
{
    LeeLog(@"-------------push-----------");
    LeeNewsViewController *newCtrl = [[LeeNewsViewController alloc]init];
    newCtrl.url = url;
    [self.navigationController pushViewController:newCtrl animated:YES];
}

@end
