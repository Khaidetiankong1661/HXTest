
//
//  MewViewController.m
//  test
//
//  Created by hongbaodai on 2017/8/2.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "MewViewController.h"
#import <SVProgressHUD.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <WebKit/WebKit.h>
#import "CYTeachRankingSwitchVC.h"

#import "HXProgressTool.h"

//#define SV_APP_EXTENSIONS
#define SV_APP_EXTENSIONS self.tableView

@interface MewViewController ()<WKUIDelegate,WKScriptMessageHandler,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wkWebView;
/** 排行选项控制器 */

@end

@implementation MewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // wkwebview
//    [self wkWebviews];
    
    
    
    UIBarButtonItem *rightCunstomButtonView = [[UIBarButtonItem alloc] initWithTitle:@"哈哈" style:UIBarButtonItemStyleDone target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightCunstomButtonView;
    
}


- (void)right
{
    [HXProgressTool progressToolDismiss];
    
}



- (void)pushInvestVc
{
    
}

- (IBAction)dosome:(id)sender
{
//    CYTeachRankingSwitchVC *vc = [[CYTeachRankingSwitchVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    [HXProgressTool progressShowInView:self.view];
}

- (IBAction)dismissAction:(id)sender
{
    [HXProgressTool progressToolDismiss];
}


- (void)wkWebviews
{
    
    
    //自定义脚本等
    //    WKUserContentController *controller = [[WKUserContentController alloc] init];
    //    //添加js全局变量
    //    WKUserScript *script = [[WKUserScript alloc] initWithSource:@"var interesting = 123;" injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    //    //页面加载完成立刻回调，获取页面上的所有Cookie
    //    WKUserScript *cookieScript = [[WKUserScript alloc] initWithSource:@"                window.webkit.messageHandlers.currentCookies.postMessage(document.cookie);" injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];
    //    //alert Cookie
    //    //    WKUserScript *alertCookieScript = [[WKUserScript alloc] initWithSource:@"alert(document.cookie);" injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];
    //    //添加自定义的cookie
    //    WKUserScript *newCookieScript = [[WKUserScript alloc] initWithSource:@"                document.cookie = 'DarkAngelCookie=DarkAngel;'" injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    //
    //    //添加脚本
    //    [controller addUserScript:script];
    //    [controller addUserScript:cookieScript];
    //    //    [controller addUserScript:alertCookieScript];
    //    [controller addUserScript:newCookieScript];
    //    //注册回调
    //    [controller addScriptMessageHandler:self name:@"share"];
    //    [controller addScriptMessageHandler:self name:@"currentCookies"];
    //    [controller addScriptMessageHandler:self name:@"shareNew"];
    
    
    CGRect rect = self.view.bounds;
    rect.origin.y += 80;
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.preferences.minimumFontSize = 18;
    //
    WKUserContentController *controller = config.userContentController;
    [controller addScriptMessageHandler:self name:@"share"];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:rect configuration:config];
    //    [webView loadRequest:request];
    self.wkWebView = webView;
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
//    [self.view addSubview:webView];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    
    NSURL *baseURL = [[NSBundle mainBundle] bundleURL];
    [self.wkWebView loadHTMLString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil] baseURL:baseURL];
    
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    //    message.body  --  Allowed types are NSNumber, NSString, NSDate, NSArray,NSDictionary, and NSNull.
    if ([message.name isEqualToString:@"share"]) {
        [self pushInvestVc];
    }
}

- (void)dealloc
{
    [HXProgressTool progressToolDismiss];
}
@end
