//
//  NSObject+Utilities.m
//  KeysDemo
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "NSObject+Utilities.h"

@implementation NSObject (Utilities)

- (BOOL)exists {
    return (self && self != [NSNull null] );
}

- (void)assert:(id)obj {
    NSAssert([obj exists], @"~~~~~~param nil~~~~~~");
}

@end
