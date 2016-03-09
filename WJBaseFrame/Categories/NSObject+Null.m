//
//  NSObject+Null.m
//  tata
//
//  Created by Jhnavi on 13-7-29.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import "NSObject+Null.h"
@implementation NSObject(null)

- (BOOL)exists {
    return (self && self != [NSNull null] );
}

@end

@implementation NSObject(Assertion)

- (void)assert:(id)obj {
        NSAssert([obj exists], @"param nil~~~~~~~~~~~!");
}

@end