//
//  User.m
//  KeysDemo
//
//  Created by mac on 15/3/27.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "User.h"
#import "NSUserDefaults+Utilities.h"

///表示存储的用户相关的用户信息对应的key
#define kDefaultUser_UserInfo                @"defaultUser_UserInfo"


@implementation User

@synthesize uid = _uid;
@synthesize name = _name;

static User *defaultUser = nil;

//创建app的默认用户的单例
+ (User *)defaultUser
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        //defaultUser = [[User alloc] init];
        defaultUser = [NSUserDefaults sharedUserObjectForKey:kDefaultUser_UserInfo];
    });
    
    return defaultUser;
}

- (void)setDefaultUser:(User *)user
{
    if (!user) {
        user = [[User alloc] init];
    }
    
    [NSUserDefaults setSharedUserObject:user forKey:kDefaultUser_UserInfo];
    defaultUser = user;
}

- (NSNumber *)uid
{
    if (!_uid) {
        return @(0);
    }
    return _uid;
}

- (void)setUid:(NSNumber *)uid
{
    _uid = uid;
}

- (NSString *)name
{
    if (!_name) {
        return @"";
    }
    return _name;
}

-(void)setName:(NSString *)name
{
    _name = name;
}



@end
