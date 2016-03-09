//
//  StatusKit.h
//  KeysDemo
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 IM. All rights reserved.
//



/**********************************文件功能说明**************************/

/**
 本文件主要是定义app中的一些状态码以及状态码对应的text，目前主要是定义了网络的返回状态码以及状态码对应的text，后面建议在使用过程中将网络以及软件使用过程中的一些状态码逐渐根据具体需求情况补全.
 设计这个类的目的主要有两个，1、将软件中的一些状态码按照软件需求定义，便于修改、维护和拓展以及管理     2、提供方法，方便通过状态码获取状态说明数据
 **/

/*********************************************************************/

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NSNetStatus)
{
    NSNetStatusServerError = -1,            ///服务器内部异常
    NSNetStatusSuccess = 0,                 ///请求成功
    NSNetStatusUnknownError,                ///这个定义看服务器给的值的情况(个人建议放在这个枚举里最大的值后面，不给值，因为枚举是默认递增的，最大的值后面肯定就是未定义的)
};



@interface StatusKit : NSObject

+ (NSString *) errorTextWithNetStatus:(NSNetStatus) status;

@end
