//
//  NSString+DES.h
//  DES
//
//  Created by Saleh AlDhobaie on 12/6/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (DES)

+ (NSString *)encryptWithText:(NSString *)sText;//加密
+ (NSString *)decryptWithText:(NSString *)sText;//解密
@end
