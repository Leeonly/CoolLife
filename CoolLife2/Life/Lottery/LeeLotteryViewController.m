//
//  LeeLotteryViewController.m
//  CoolLife2
//
//  Created by Leon on 15/9/21.
//  Copyright (c) 2015年 Leon. All rights reserved.
//

#import "LeeLotteryViewController.h"

@interface LeeLotteryViewController () <UIWebViewDelegate>


@end

@implementation LeeLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
   
    [self.view addSubview:webView];
    webView.scalesPageToFit = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://caipiao.163.com/t/"];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    LeeLog(@"-----------------------------------%@",url);
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 利用webView执行js代码，操作网页中的节点
    NSString *js1 = @"var ul = document.getElementsByTagName('ul')[0];";
    NSString *js2 = @"ul.parentNode.removeChild(ul);";
    
    [webView stringByEvaluatingJavaScriptFromString:js1];
    [webView stringByEvaluatingJavaScriptFromString:js2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
