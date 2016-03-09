//
//  NSHTTPCookieStorage+CookieStorage.m
//  tata
//
//  Created by CalvinLaw on 10/12/13.
//  Copyright (c) 2013 Maxicn. All rights reserved.
//

#import "NSHTTPCookieStorage+CookieStorage.h"

#define kSessionCookies @"sessionCookies"

@implementation NSHTTPCookieStorage (CookieStorage)
+ (void)saveCookies{
    
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: kSessionCookies];
    [defaults synchronize];
    
}

+ (void)loadCookies{
    
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: kSessionCookies]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in cookies){
        [cookieStorage setCookie: cookie];
    }
    
}

@end
