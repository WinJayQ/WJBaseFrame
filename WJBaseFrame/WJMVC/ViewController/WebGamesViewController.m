//
//  WebGamesViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/9.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "WebGamesViewController.h"

#define kIndexURL  @"http://7xp987.com1.z0.glb.clouddn.com/index.html"

@interface WebGamesViewController ()<UIWebViewDelegate>
@property (nonatomic,assign) BOOL isIndexHtm;
@end

@implementation WebGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"微信小游戏";
    self.myWebView.scalesPageToFit =YES;
    self.myWebView.delegate =self;
    self.myWebView.scrollView.showsHorizontalScrollIndicator = NO;
    self.myWebView.scrollView.showsVerticalScrollIndicator = NO;
    
    [self createCache];
    
    [self loadWebPageWithString:kIndexURL WithWeb:self.myWebView];
}

- (void)createCache {
    int cacheSizeMemory = 8*1024*1024;
    int cacheSizeDisk = 64*1024*1024; 
    NSURLCache *sharedCache = [[NSURLCache alloc]initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"nsurlcache"];
    [NSURLCache setSharedURLCache:sharedCache];
}

- (void)loadWebPageWithString:(NSString*)urlString WithWeb:(UIWebView *)webView;
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (void)leftBtnClicked {
    if (self.isIndexHtm) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self loadWebPageWithString:kIndexURL WithWeb:self.myWebView];
    }
}

#pragma UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    
    
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"%@",currentURL);
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError:%@", error);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *url = [request.URL absoluteString];
    NSLog(@"%@",url);
    if ( [url isEqualToString:kIndexURL]) {
        self.isIndexHtm = YES;
    }else if([url isEqualToString:@"http://7xp987.com1.z0.glb.clouddn.com/game/jianren/index.html"]){//该游戏出错了
        self.isIndexHtm = YES;
        return NO;
    }else {
      self.isIndexHtm = NO;
    }
    return YES;
}

@end
