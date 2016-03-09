//
//  NSUserDefaults+Utilities.h
//  KeysDemo
//
//  Created by mac on 15/3/26.
//  Copyright (c) 2015年 IM. All rights reserved.
//

/**********************************文件功能说明**************************/
/**
    为了方便对NSUserDefaults方式保存的本地数据进行管理，对这种保存的方式保存的数据，指定了几种保存的名称（Default、User、App）作为保存的封装的字典的key，再来保存数据。
**/


/*********************************************************************/

#import <Foundation/Foundation.h>



@interface NSUserDefaults (Utilities)

//默认保存或者读取、删除（用来保存平常的一些除User和APP相关的其他信息）
+ (void)setSharedObject:(id)obj forKey:(NSString *)key;
+ (id)sharedObjectForKey:(NSString *)key;
+ (void)removeSharedObjectForKey:(NSString *)key;

//User保存或者读取、删除（用来保存和用户相关的一些信息）
+ (void)setSharedUserObject:(id)obj forKey:(NSString *)key;
+ (id)sharedUserObjectForKey:(NSString *)key;
+ (void)removeSharedUserObjectForKey:(NSString *)key;

//User保存或者读取、删除（用来保存和App相关的一些信息，比如程序设置等）
+ (void)setSharedAppObject:(id)obj forKey:(NSString *)key;
+ (id)sharedAppObjectForKey:(NSString *)key;
+ (void)removeSharedAppObjectForKey:(NSString *)key;

@end
