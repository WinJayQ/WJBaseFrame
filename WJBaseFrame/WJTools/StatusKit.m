//
//  StatusKit.m
//  KeysDemo
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "StatusKit.h"


#define kNetStatusTextServerError                       @"服务器内部异常"
#define kNetStatusTextSuccess                           @""
#define kNetStatusTextUnknownError                      @"未知错误"


@implementation StatusKit

+ (NSString *) errorTextWithNetStatus:(NSNetStatus) status
{
    switch (status) {
        case NSNetStatusServerError:
            return kNetStatusTextServerError;
        case NSNetStatusSuccess:
            return kNetStatusTextSuccess;
        case NSNetStatusUnknownError:
            return kNetStatusTextUnknownError;
        default:
            return @"未知错误";
    }
}

@end
