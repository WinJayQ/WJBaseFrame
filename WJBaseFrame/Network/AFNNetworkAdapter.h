//
//  AFNNetworkAdapter.h
//  KeysDemo
//
//  Created by mac on 15/3/27.
//  Copyright (c) 2015年 IM. All rights reserved.
//

/**********************************文件功能说明**************************/

/**
 本文件是在AFNetworking2.5.2的基础上对其进行了封装，封装的参数等是按照一般的网络请求需求的形式来的，实际使用过程中要根据具体情况进行修改，另外像PUT、DELETE、HEAD、PATCH这些请求方式，不能确定使用方法正确，使用中最好验证并修改。另外，如果不用AFHTTPRequestOperationManager的话，个人建议可以封装一个单例，然后定义一个队列属性，保证在使用过程中只有一个网络队列，用法可参见ASINetworkAdapter。
 
 说明：
    1、AFN旧版本不支持断点续传，新版本还没具体研究暂不清楚，建议如果有这方面需求的在用此框架之前先技术验证
    2、AFN旧版本不支持下载进度，新版本还没具体研究暂不清楚，建议如果有这方面需求的在用此框架之前先技术验证
 **/

/*********************************************************************/


#import "AFNetworking.h"

typedef void(^AFNRequestSuccessBlock)(AFHTTPRequestOperation *operation, id response);
typedef void(^AFNRequestFailBlock)(AFHTTPRequestOperation *operation,NSError *error);


//请求类型
typedef NS_ENUM(NSInteger, AFNRequestMethod)
{
    AFNRequestMethodPost,
    AFNRequestMethodGet,
    AFNRequestMethodPut,
    AFNRequestMethodDelete,
    AFNRequestMethodHead,
    AFNRequestMethodPatch
};


@interface AFNNetworkAdapter : NSObject

///使用了AFHTTPRequestOperationManager的方式来请求数据，具体参数等可以根据服务器的需求来做修改
+(AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                   params:(NSMutableDictionary *)params
                                   method:(AFNRequestMethod)method
                                  success:(AFNRequestSuccessBlock)success
                                     fail:(AFNRequestFailBlock)fail;

///没有使用AFHTTPRequestOperationManager类，而是直接用AFHTTPRequestOperation来请求服务器数据，也是根据具体情况来修改参数等数据。
+(AFHTTPRequestOperation *)requestWithPath:(NSString *)path
                                   headers:(NSDictionary *)headers
                                    params:(NSDictionary *)params
                                    method:(AFNRequestMethod)method
                                   success:(AFNRequestSuccessBlock)success
                                      fail:(AFNRequestFailBlock)fail;

//获取xml数据
+ (void)requestXMLDataWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                      success:(AFNRequestSuccessBlock)success
                         fail:(AFNRequestFailBlock)fail;

//下载文件
+ (void)downloadFileWithUrl:(NSString *)urlStr
                    success:(void (^)(NSURL *fileURL))success
                       fail:(void (^)())fail;

//文件上传(包括图片等应该都可以)
+ (void)uploadFileWithUrl:(NSString *)url
                  fileUrl:(NSURL *)fileURL
                 fileName:(NSString *)fileName
                 fileType:(NSString *)fileTye
                  success:(void (^)(id responseObject))success
                     fail:(void (^)())fail;



@end
