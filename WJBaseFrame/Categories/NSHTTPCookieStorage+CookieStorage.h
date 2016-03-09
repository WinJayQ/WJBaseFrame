//
//  NSHTTPCookieStorage+CookieStorage.h
//  tata
//
//  Created by CalvinLaw on 10/12/13.
//  Copyright (c) 2013 Maxicn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPCookieStorage (CookieStorage)
+ (void)saveCookies;
+ (void)loadCookies;
@end
