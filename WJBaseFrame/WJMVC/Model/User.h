//
//  User.h
//  KeysDemo
//
//  Created by mac on 15/3/27.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import <Foundation/Foundation.h>

//账号类型
typedef NS_ENUM(NSInteger, UserType)
{
    UserTypeRegister = 1,        //注册用户
    UserTypeTemp,                //临时
    UserTypeThird                //第三方登录
    
};

//第三方账号的类型
typedef NS_ENUM(NSInteger, ThirdUserType)
{
    ThirdUserTypeQQ = 1,         //QQ
    ThirdUserTypeWechat,         //微信
    ThirdUserTypeWeibo           //新浪微博
};


@interface User : NSObject

@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *name;

//@property(nonatomic, assign) AccountType accountType;//用户类型
//@property(nonatomic, assign) ThirdAccountType thirdAcountType;//第三方用户类型

+ (User *)defaultUser;

- (void)setDefaultUser:(User *)user;

@end
