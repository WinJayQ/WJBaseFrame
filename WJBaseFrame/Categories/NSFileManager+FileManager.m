//
//  NSFileManager+FileManager.m
//  tata
//
//  Created by Jhnavi on 13-7-30.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import "NSFileManager+FileManager.h"

@implementation NSFileManager (FileManager)




#pragma mark - path
+ (NSString *)cachesPath
{
    return [NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()];
}

+ (NSString *)documentsPath
{
    return [NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()];
}


+ (NSString *)tmpPath
{
    return [NSString stringWithFormat:@"%@/tmp",NSHomeDirectory()];
}



+ (BOOL)fileExist:(NSString *)localPath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:localPath];
}


+(void)deleteFile:(NSString *)filepath
{
    if([self fileExist:filepath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
    }
}

@end
