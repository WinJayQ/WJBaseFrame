//
//  NSFileManager+FileManager.h
//  tata
//
//  Created by Jhnavi on 13-7-30.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FileManager)
/*
 项目目录/Library/caches
 */
+ (NSString *)cachesPath;

/*
 项目目录/Documents
 */
+ (NSString *)documentsPath;

/*
 项目目录/tmp
 */
+ (NSString *)tmpPath;

+ (BOOL)fileExist:(NSString *)localPath;
@end
