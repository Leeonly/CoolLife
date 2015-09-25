//
//  LeeNewsViewController.m
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeNewsViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "REMenu.h"

@interface LeeNewsViewController ()<UIWebViewDelegate>
@property (nonatomic, weak) UIWebView *webView;
@property (nonatomic, strong) REMenu *menu;
@property (nonatomic, weak) UIActivityIndicatorView* indicator;
@end

#define baiduNewUrl @"http://news.baidu.com" //@"http://m.baidu.com/news?fr=mohone"
#define fengNewUrl @"http://i.ifeng.com"
#define sinaNewUrl @"http://news.sina.cn"
#define tencenNewUrl @"http://info.3g.qq.com"
#define wangyiNewUrl @"http://news.163.com"
#define sohuNewUrl @"http://m.sohu.com"
#define huanqiuNewUrl @"http://m.huanqiu.com"

@implementation LeeNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(Canccel) image:@"navigationbar_back" highImage:nil];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(selectMoreNews) image:@"navigationbar_more" highImage:nil];
    
    // 设置menuview
    [self setupMenuView];
    
    // 设置menuview
    [self setupMenuView];
    
    // 添加webview
    [self setupWebview];
    
    // 添加UIActivityIndicatorView
    [self setupActivityIndicator];
    
    // 加载网页
    [self loadWebViewUrl:self.url];
    
}

#pragma mark setupViews

- (void)setupMenuView
{
    // 消除block强引用
    __typeof (self) __weak weakSelf = self;
    REMenuItem *baiduItem = [[REMenuItem alloc] initWithTitle:@"百度新闻"
                                                     subtitle:@"全球最大的中文新闻平台"
                                                        image:nil
                                             highlightedImage:nil
                                                       action:^(REMenuItem *item) {
                                                           [weakSelf loadWebViewUrl:baiduNewUrl];
                                                       }];
    REMenuItem *fengItem = [[REMenuItem alloc] initWithTitle:@"凤凰新闻"
                                                    subtitle:@"24小时提供最及时，最权威，最客观的新闻资讯"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf loadWebViewUrl:fengNewUrl];
                                                      }];
    REMenuItem *sinaItem = [[REMenuItem alloc] initWithTitle:@"新浪新闻"
                                                    subtitle:@"最新，最快头条新闻一网打尽"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf loadWebViewUrl:sinaNewUrl];
                                                      }];
    REMenuItem *tencenItem = [[REMenuItem alloc] initWithTitle:@"腾讯新闻"
                                                      subtitle:@"中国浏览最大的中文门户网站"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf loadWebViewUrl:tencenNewUrl];
                                                        }];
    REMenuItem *wangyiItem = [[REMenuItem alloc] initWithTitle:@"网易新闻"
                                                      subtitle:@"因新闻最快速，评论最犀利而备受推崇"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf loadWebViewUrl:wangyiNewUrl];
                                                        }];
    
    REMenuItem *sohuItem = [[REMenuItem alloc] initWithTitle:@"搜狐新闻"
                                                      subtitle:@"中文互联网成立最早,最权威的视频新闻门户"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf loadWebViewUrl:sohuNewUrl];
                                                        }];
    REMenuItem *huanqiuItem = [[REMenuItem alloc] initWithTitle:@"环球新闻"
                                                    subtitle:@"网罗环球要闻"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf loadWebViewUrl:huanqiuNewUrl];
                                                      }];

    
    self.menu = [[REMenu alloc] initWithItems:@[fengItem, baiduItem, sinaItem, tencenItem, wangyiItem,sohuItem,huanqiuItem]];
    self.menu.liveBlur = YES;
    self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    self.menu.textColor = [UIColor whiteColor];
    self.menu.subtitleTextColor = [UIColor whiteColor];
}

// 添加webview
- (void)setupWebview
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
}


- (void)setupActivityIndicator
{
    //初始化:
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    //设置显示位置
    [indicator setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    
    //设置背景色
    indicator.backgroundColor = [UIColor grayColor];
    
    //设置背景透明
    indicator.alpha = 0.5;
    
    //设置背景为圆角矩形
    indicator.layer.cornerRadius = 6;
    indicator.layer.masksToBounds = YES;
    
    [self.view addSubview:indicator];
    self.indicator = indicator;
    self.indicator.hidden = YES;
}

// 加载网页
- (void)loadWebViewUrl:(NSString *)strUrl
{
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

#pragma mark navItem action
// 后退
- (void)Canccel
{
    //    if ([self.webView canGoBack]) {
    //        [self.webView goBack];
    //    } else {
    //        self.navigationItem.leftBarButtonItem.enabled = NO;
    //    }
    [self.navigationController popViewControllerAnimated:YES];
}

// 选择news
- (void)selectMoreNews
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showFromNavigationController:self.navigationController];
}

#pragma mark UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicator startAnimating];
    self.indicator.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    
}

- (void)dealloc
{
    // 释放webview内存
    [self.webView loadHTMLString:@"" baseURL:nil];
    [self.webView stopLoading];
    self.webView.delegate = nil;
    [self.webView removeFromSuperview];
    self.webView = nil;
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    LeeLog(@"LeeNewsViewController dealloc");
}


@end
