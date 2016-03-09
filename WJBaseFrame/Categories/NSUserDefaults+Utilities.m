//
//  NSUserDefaults+Utilities.m
//  KeysDemo
//
//  Created by mac on 15/3/26.
//  Copyright (c) 2015年 IM. All rights reserved.
//


#import "NSUserDefaults+Utilities.h"

///保存或者获取的数据对象所属的类型
typedef NS_ENUM(NSInteger, NSUserDefaultsType)
{
    NSUserDefaultsTypeDefault,///默认类型
    NSUserDefaultsTypeUser,///user的信息
    NSUserDefaultsTypeApp///app的信息
};


#define kWJDefaultPreferenceKey                 @"WJDefaultPreferenceKey"
#define kWJDefaultUserPreferenceKey             @"WJDefaultUserPreferenceKey"
#define kWJDefaultAppPreferenceKey              @"WJDefaultdAppPreferenceKey"

@implementation NSUserDefaults (Utilities)


/*-------------------------------------------------------------------------------*/

/**
 * 将某个对象保存到默认大字典（由type决定）中的小字典对应的key中，并保存在数据列表
 * @name    setSharedObject:forKey:forType:
 * @param  	obj             需要设置的数据对象
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)setSharedObject:(id)obj forKey:(NSString *)key
{
    if (!obj) {
        return;
    }
    
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    
    [NSUserDefaults setObject:obj forKey:key forType:NSUserDefaultsTypeDefault];
    
}

/**
 * 获取默认大字典（由type决定）中的小字典对应的key的value，并返回该对象数据
 * @name    sharedObjectForKey:forType:type
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	id              获取到的对象
 * @note
 */
+ (id)sharedObjectForKey:(NSString *)key
{
    if (!key || [key isEqualToString:@""]) {
        return nil;
    }
    
    return [NSUserDefaults objectForKey:key forType:NSUserDefaultsTypeDefault];
}


/**
 * 删除保存的默认大字典（由type决定）数据中的小字典对应的key的value，并保存删除后的对象数据
 * @name    removeSharedObjectForKey:forType:
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)removeSharedObjectForKey:(NSString *)key
{
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    [NSUserDefaults removeSharedObjectForKey:key forType:NSUserDefaultsTypeDefault];
}





/*------------------------------------------------------------------------------*/

/**
 * 将某个对象保存到user大字典（由type决定）中的小字典对应的key中，并保存在数据列表
 * @name    setSharedUserObject:forKey:forType:
 * @param  	obj             需要设置的数据对象
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)setSharedUserObject:(id)obj forKey:(NSString *)key
{
    if (!obj) {
        return;
    }
    
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    
    [NSUserDefaults setObject:obj forKey:key forType:NSUserDefaultsTypeUser];
}


/**
 * 获取user大字典（由type决定）中的小字典对应的key的value，并返回该对象数据
 * @name    sharedUserObjectForKey:forType:type
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	id              获取到的对象
 * @note
 */
+ (id)sharedUserObjectForKey:(NSString *)key
{
    if (!key || [key isEqualToString:@""]) {
        return nil;
    }
    
    return [NSUserDefaults objectForKey:key forType:NSUserDefaultsTypeUser];
}

/**
 * 删除保存的user大字典（由type决定）数据中的小字典对应的key的value，并保存删除后的对象数据
 * @name    removeSharedUserObjectForKey:forType:
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)removeSharedUserObjectForKey:(NSString *)key
{
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    [NSUserDefaults removeSharedObjectForKey:key forType:NSUserDefaultsTypeUser];
}



/*------------------------------------------------------------------------------*/

/**
 * 将某个对象保存到app大字典（由type决定）中的小字典对应的key中，并保存在数据列表
 * @name    setAppObject:forKey:forType:
 * @param  	obj             需要设置的数据对象
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)setSharedAppObject:(id)obj forKey:(NSString *)key
{
    if (!obj) {
        return;
    }
    
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    
    [NSUserDefaults setObject:obj forKey:key forType:NSUserDefaultsTypeApp];
}


/**
 * 获取app大字典（由type决定）中的小字典对应的key的value，并返回该对象数据
 * @name    sharedAppObjectForKey:forType:type
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	id              获取到的对象
 * @note
 */
+ (id)sharedAppObjectForKey:(NSString *)key
{
    if (!key || [key isEqualToString:@""]) {
        return nil;
    }
    
    return [NSUserDefaults objectForKey:key forType:NSUserDefaultsTypeApp];
}


/**
 * 删除保存的app大字典（由type决定）数据中的小字典对应的key的value，并保存删除后的对象数据
 * @name    removeSharedAppObjectForKey:forType:
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)removeSharedAppObjectForKey:(NSString *)key
{
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    [NSUserDefaults removeSharedObjectForKey:key forType:NSUserDefaultsTypeApp];
}




/**
 * 将某个对象保存到指定大字典（由type决定）中的小字典对应的key中，并保存在数据列表
 * @name    setObject:forKey:forType:
 * @param  	obj             需要设置的数据对象
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)setObject:(id)obj forKey:(NSString *)key forType:(NSUserDefaultsType) type
{
    if (!obj) {
        return;
    }
    
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    
    NSString *typeKey;
    if (type == NSUserDefaultsTypeDefault) {
        typeKey = kWJDefaultPreferenceKey;
    }
    else if (type == NSUserDefaultsTypeUser)
    {
        typeKey = kWJDefaultUserPreferenceKey;
    }
    else if (type == NSUserDefaultsTypeApp)
    {
        typeKey = kWJDefaultAppPreferenceKey;
    }
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[userDefaults objectForKey:typeKey]];
    [dict setObject:obj forKey:key];
    [userDefaults setObject:dict forKey:typeKey];
    [userDefaults synchronize];
    
}

/**
 * 获取指定大字典（由type决定）中的小字典对应的key的value，并返回该对象数据
 * @name    objectForKey:forType:type
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	id              获取到的对象
 * @note
 */
+ (id)objectForKey:(NSString *)key forType:(NSUserDefaultsType) type
{
    NSString *typeKey;
    if (type == NSUserDefaultsTypeDefault) {
        typeKey = kWJDefaultPreferenceKey;
    }
    else if (type == NSUserDefaultsTypeUser)
    {
        typeKey = kWJDefaultUserPreferenceKey;
    }
    else if (type == NSUserDefaultsTypeApp)
    {
        typeKey = kWJDefaultAppPreferenceKey;
    }
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults objectForKey:typeKey];
    
    return [dict objectForKey:key];
}


/**
 * 删除大字典（由type决定）中的小字典对应的key的value，并保存删除后的对象数据
 * @name    removeSharedObjectForKey:forType:
 * @param  	key             指定大字典的小字典中的key
 * @param  	type            表示保存的数据对象所属类型
 * @return 	void
 * @note
 */
+ (void)removeSharedObjectForKey:(NSString *)key forType:(NSUserDefaultsType)type
{
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    
    NSString *typeKey;
    if (type == NSUserDefaultsTypeDefault) {
        typeKey = kWJDefaultPreferenceKey;
    }
    else if (type == NSUserDefaultsTypeUser)
    {
        typeKey = kWJDefaultUserPreferenceKey;
    }
    else if (type == NSUserDefaultsTypeApp)
    {
        typeKey = kWJDefaultAppPreferenceKey;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dict = [defaults objectForKey:typeKey];
    [dict removeObjectForKey:key];
    [defaults setObject:dict forKey:typeKey];
    [defaults synchronize];
}

@end
