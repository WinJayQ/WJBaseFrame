//
//  NSString+MD5.m
//  tata
//
//  Created by Jhnavi on 13-10-15.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import "NSString+MD5.h"
#import "NSDate-Utilities.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)


- (NSString *)MD5Digest
{
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}
@end
