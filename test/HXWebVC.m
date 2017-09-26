//
//  HXWebVC.m
//  test
//
//  Created by hongbaodai on 2017/9/22.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HXWebVC.h"
#import <WebKit/WebKit.h>

@interface HXWebVC ()<WKUIDelegate,WKScriptMessageHandler,WKNavigationDelegate>

@property (nonatomic, strong)WKWebView *wkWebView;
@end

@implementation HXWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addWebview];
}

- (void)addWebview
{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.preferences.minimumFontSize = 18;

    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
    //    [webView loadRequest:request];
    self.wkWebView = webView;
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    //    [self.view addSubview:webView];
    if (self.urlStr.length > 0) {
        NSURL *baseURL = [NSURL URLWithString:self.urlStr];
        [self.wkWebView loadRequest:[NSURLRequest requestWithURL:baseURL]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
