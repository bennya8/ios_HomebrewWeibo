//
//  AuthWeiboController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/13/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "AuthWeiboController.h"
#import "HttpHelper.h"
#import "Account.h"
#import "MBProgressHUD.h"

@interface AuthWeiboController () <UIWebViewDelegate>

@end

@implementation AuthWeiboController

- (void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addNavbar];
    [self addWebView];
}

#pragma mark - 控件初始化
- (void)addNavbar
{
    UINavigationBar *navigationBar = [[UINavigationBar alloc]init];
    navigationBar.frame = CGRectMake(0, 0, 320, 64);
    navigationBar.titleTextAttributes = @{
        NSFontAttributeName : [UIFont fontWithName:kAppFontBold size:20],
        UITextAttributeFont : [UIColor whiteColor],
        NSBackgroundColorAttributeName : [UIColor whiteColor]
    };
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"auth_navbar"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationItem *items = [[UINavigationItem alloc]initWithTitle:@"授权登陆"];
    [navigationBar pushNavigationItem:items animated:YES];

    UIBarButtonItem *itemLeft = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"auth_navitem_cancel"] style:UIBarButtonItemStyleDone target:self    action:@selector(touchCancelButton:)];
    itemLeft.tintColor = [UIColor whiteColor];
    items.leftBarButtonItem = itemLeft;
    
    [self.view addSubview:navigationBar];
}

- (void)addWebView
{
    CGSize size = self.view.bounds.size;
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = CGRectMake(0, 64, size.width, size.height - 64);
    webView.delegate = self;
    
    NSString *url = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",kWeiboSDKAppKey,kWeiboSDKRedirectURI];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
}

#pragma mark - 事件
- (void)touchCancelButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 代理
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    
    NSRange range = [url rangeOfString:@"code="];
    
    if (range.length != 0) {
        NSInteger index = range.location + range.length;
        NSString *code = [url substringFromIndex:index];
        
        [self fetchAccessTokenWithCode:code];
        
        return NO;
    }
    return YES;
}

#pragma mark - @private
- (void)fetchAccessTokenWithCode:(NSString *)code
{
    NSString *url = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *params = @{
        @"client_id" : kWeiboSDKAppKey,
        @"client_secret" : kWeiboSDKAppSecrect,
        @"grant_type" : @"authorization_code",
        @"code" : code,
        @"redirect_uri" : kWeiboSDKRedirectURI
    };
    [HttpHelper sendPostRequestWithUrl:url params:params complete:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            [_authWeibodelegate authWeiboDidSuccess:self data:data response:response];
        } else {
            [_authWeibodelegate authWeiboDidFail:self error:error response:response];
        }
    }];
}

@end
