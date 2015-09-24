//
//  LeeOAuthController.m
//  CoolLife2
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeOAuthController.h"
#import "MBProgressHUD+MJ.h"
#import "LeeTabBarController.h"
#import "LeeNewfeatureViewController.h"
#import "LeeControllerTool.h"
#import "LeeAccountTool.h"
#import "LeeAccount.h"
#import "LeeOAuthTool.h"
#import "LeeOAuthParam.h"

@interface LeeOAuthController ()<UIWebViewDelegate>

@end

@implementation LeeOAuthController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.window.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",LeeAppKey,LeeRedirectURI];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载。。。"];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *str = request.URL.absoluteString;
    NSString *string = [NSString stringWithFormat:@"%@/?code=",LeeRedirectURI];
    NSRange range = [str rangeOfString:string];
    if (range.location != NSNotFound) {
        NSUInteger from = range.location + range.length;
        
        NSString *code = [str substringFromIndex:from];
        [self accessTokenWithCode:code];
        return NO;
    }
    
    return YES;
}
- (void)accessTokenWithCode:(NSString *)code
{
    LeeOAuthParam *param = [[LeeOAuthParam alloc] init];
    param.client_id = LeeAppKey;
    param.client_secret = LeeAppSecret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = LeeRedirectURI;
    
    [LeeOAuthTool OAuthWithParam:param success:^(LeeAccount *account) {
        //隐藏HUD
        [MBProgressHUD hideHUD];
        //存储授权信息
        [LeeAccountTool save:account];
        
        //判断选择的控制器
        [LeeControllerTool changeRootViewControll];
    } failure:^(NSError *error) {
        LeeLog(@"%@",error);
    }];
}

@end
