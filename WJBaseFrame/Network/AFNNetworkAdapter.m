//
//  AFNNetworkAdapter.m
//  KeysDemo
//
//  Created by mac on 15/3/27.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "AFNNetworkAdapter.h"
#import "JSONModel.h"
#import "JSONKit.h"

/* XCode-开发中消除警告语句
 #pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wdeprecated-declarations"
 <#这里包含住出现警告的代码#>
 #pragma clang diagnostic pop
 */
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

///请求超时时间
#define kAFNRequestOutTime          60

@implementation AFNNetworkAdapter

//static dispatch_queue_t queue;（其实这里是想封装一个网络请求队列的单例，但是因为时间原因和还没想好到底用不用封装单例、能不能封装单例、封装单例在这里到底合不合适等，所以暂时没实现单例，后面可以根据具体情况来看是不是需要单例）


+(AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                   params:(NSMutableDictionary *)params
                                   method:(AFNRequestMethod)method
                                  success:(AFNRequestSuccessBlock)success
                                     fail:(AFNRequestFailBlock)fail

{
    //创建request请求管理对象
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation * operation = nil;
    
   // manager.responseSerializer = [AFJSONResponseSerializer serializer];
   // manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //设置返回数据的解析方式JSON方式
    operation.responseSerializer =[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    
    /*
     这里特别说明，下面的method判断语句里面一些参数设置，需要根据具体情况调整，可能会有错误的地方
     */
    
    
    if (method == AFNRequestMethodPost) {
        
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if (success) {
                success(operation,responseObject);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           
            NSLog(@"%@", error);
            if (fail) {
                fail(operation,error);
            }
        }];
        
    }
    else if(method == AFNRequestMethodGet){
        
        [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if (success) {
                success(operation,responseObject);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@", error);
            if (fail) {
                fail(operation,error);
            }  
        }];
    }
    else if(method == AFNRequestMethodPut){
        
        [manager PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if (success) {
                success(operation,responseObject);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@", error);
            if (fail) {
                fail(operation,error);
            }
        }];
    }
    else if(method == AFNRequestMethodDelete){
        
        [manager DELETE:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if (success) {
                success(operation,responseObject);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@", error);
            if (fail) {
                fail(operation,error);
            }
        }];
    }
    else if(method == AFNRequestMethodHead){
        
        [manager HEAD:url parameters:params success:^(AFHTTPRequestOperation *operation) {
            
            if (success) {
                success(operation,[NSNull null]);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@", error);
            if (fail) {
                fail(operation,error);
            }
            
        }];
    }
    else if(method == AFNRequestMethodPatch){
        [manager PATCH:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if (success) {
                success(operation,[NSNull null]);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@", error);
            if (fail) {
                fail(operation,error);
            }
        }];
    }
    
    return operation;
    
}

+(AFHTTPRequestOperation *)requestWithPath:(NSString *)path
                                   headers:(NSDictionary *)headers
                                   params:(NSDictionary *)params
                                   method:(AFNRequestMethod)method
                                  success:(AFNRequestSuccessBlock)success
                                     fail:(AFNRequestFailBlock)fail

{
    
    NSMutableURLRequest *request = nil;
    NSString *url = nil;
    NSData *body = nil;
    //添加请求头
    if (!headers && headers.count > 0) {
        for (NSString *key in headers.allKeys) {
            [request addValue:headers[key] forHTTPHeaderField:key];
        }
    }
    
    
    /*
     这里特别说明，下面的method判断语句里面一些参数设置，需要根据具体情况调整，可能会有错误的地方
     */
    //设置请求methed和url
    if (method == AFNRequestMethodPost) {
        
        request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
        body = [[[params JSONString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
        
        [request setHTTPMethod:@"POST"];
    }
    else if(method == AFNRequestMethodGet){
        
        url = [NSString stringWithFormat:@"%@%@",path,[params JSONString]];
        request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        [request setHTTPMethod:@"GET"];
    }
    else if(method == AFNRequestMethodPut){
        
        request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
        body = [[[params JSONString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
        
        [request setHTTPMethod:@"PUT"];
    }
    else if(method == AFNRequestMethodDelete){
        
        url = [NSString stringWithFormat:@"%@%@",path,[params JSONString]];
        request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        [request setHTTPMethod:@"DELETE"];
    }
    else if(method == AFNRequestMethodHead){
        
        url = [NSString stringWithFormat:@"%@%@",path,[params JSONString]];
        request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        [request setHTTPMethod:@"HEAD"];
    }
    else if(method == AFNRequestMethodPatch){
        request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
        
        [request setHTTPMethod:@"PATCH"];
    }
    
    [request setTimeoutInterval:kAFNRequestOutTime];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];

    
    //发送请求
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    
    //设置返回数据的解析方式(这里暂时只设置了json解析)
    requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success != nil) {
            success(operation,responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", [error localizedDescription]);
        
        if (fail != nil) {
            fail(operation,error);
        }
    }];
    
    [requestOperation start];
    
    return requestOperation;//这个返回值，已经放在执行完毕后的block中了，建议去掉，在这里已经没意义了，除非有这样的需求
}



//获取xml数据
+ (void)requestXMLDataWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                      success:(AFNRequestSuccessBlock)success
                         fail:(AFNRequestFailBlock)fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 返回的数据格式是XML,所以设置XML数据解析方式
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(operation,responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        if (fail) {
            fail(operation,error);
        }
    }];
}


//下载文件
+ (void)downloadFileWithUrl:(NSString *)urlStr
                    success:(void (^)(NSURL *fileURL))success
                       fail:(void (^)())fail
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSString *urlString = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        // 指定下载文件保存的路径
        //        NSLog(@"%@ %@", targetPath, response.suggestedFilename);
        // 将下载文件保存在缓存路径中
        NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [cacheDir stringByAppendingPathComponent:response.suggestedFilename];
        
        //URLWithString返回的是网络的URL,如果使用本地URL,需要注意
        //NSURL *fileURL1 = [NSURL URLWithString:path];
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        
        //NSLog(@"== %@ |||| %@", fileURL1, fileURL);
        if (success) {
            success(fileURL);
        }
        
        return fileURL;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@ %@", filePath, error);
        if (fail) {
            fail();
        }
    }];
    
    [task resume];
}


//文件上传(包括图片等应该都可以)
+ (void)uploadFileWithUrl:(NSString *)url
                  fileUrl:(NSURL *)fileURL
                 fileName:(NSString *)fileName
                 fileType:(NSString *)fileTye
                  success:(void (^)(id responseObject))success
                     fail:(void (^)())fail
{
    
    // 本地上传给服务器时,没有确定的URL,不好用MD5的方式处理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //注意manage的两个POST方法的差异
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        //通过文件数据来上传
        //[formData appendPartWithFileData:[NSData data] name:@"uploadfileName" fileName:fileName mimeType:fileTye];
        
        //没有指定文件名称、类型等信息的上传文件的方式
        //[formData appendPartWithFileURL:fileURL name:@"uploadFile" error:NULL];
        
        //通过资源位置来上传
        [formData appendPartWithFileURL:fileURL name:@"uploadFile" fileName:fileName mimeType:fileTye error:nil];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            fail();
        }
    }];
}







/****************************旧AFN版本方法start***********************************/
/*******************************************************************************/

/*
 下面的这个方法是根据以前的AFNetworking的版本以及当时的项目需求写的，现在的新版本已经没有了AFHTTPClient，AFJSONRequestOperation等类，所以这个方法只在以前的版本能用上
 */
//+ (void)requestWithPath:(NSString *)path
//                 params:(NSDictionary *)params
//                  token:(NSString *)token
//                 method:(AFNRequestMethod) method
//                success:(AFNRequestSuccessBlock)success
//                   fail:(AFNRequestFailBlock)fail
//{
//    NSURLRequest *request = nil;
//    NSString* requestMethod = nil;
//
//    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:kServerURL]];
//    [client setAuthorizationHeaderWithToken:token];
//
//    switch (method) {
//        case HttpRequestMethodPost:
//            requestMethod = @"POST";
//            break;
//        case HttpRequestMethodGet:
//            requestMethod = @"GET";
//            break;
//        case HttpRequestMethodPut:
//            requestMethod = @"PUT";
//            break;
//        case HttpRequestMethodDelete:
//            requestMethod = @"DELETE";
//            break;
//    }
//
//    request =[client requestWithMethod:requestMethod path:path parameters:params];
//
//    NSLog(@"\n\n\n\n\n\n-----------request-----------\n%@",request);
//    NSOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        if (success == nil) return;
//
//        NSLog(@"\n\n-----------response----------\n%@\n",response);
//        NSLog(@"\n\n-----------JSON-----------\n%@\n",JSON);
//
//        success(response,JSON);
//
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        if (failure == nil) return;
//        NSLog(@"\n\n-----------error-----------\n%@\n\n\n\n\n",error);
//    }];
//
//    [operation start];
//}




/*
 下面的这个方法是根据以前的AFNetworking的版本写的，现在的新版本已经没有了AFHTTPClient，AFJSONRequestOperation等类，所以这个方法只在以前的版本能用上
 */
//上传图片
//+ (void)uploadImageWithInfo:(NSDictionary*)userInfo
//                      image:(UIImage *)image
//                    success:(HttpSuccessBlock)success
//                    failure:(HttpFailureBlock)failure
//{
//    NSString *defaultPath = @"RecvPicture.ashx";
//    NSData* data = UIImagePNGRepresentation(image);
//    NSString *len = [NSString stringWithFormat:@"%@",@(data.length)];
//
//    NSMutableURLRequest *request = nil;
//
//    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:kServerImageURL]];
//
//    request =[client requestWithMethod:@"POST" path:defaultPath parameters:nil];
//    //[client setAuthorizationHeaderWithToken:nil];
//    [request addValue:userInfo[kNetImageType] forHTTPHeaderField:kNetImageType];
//    [request addValue:len forHTTPHeaderField:kNetImageLen];
//    [request addValue:userInfo[kNetImageKey] forHTTPHeaderField:kNetImageKey];
//    [request addValue:userInfo[kNetImageId] forHTTPHeaderField:kNetImageId];
//
//    [request setHTTPBody:data];
//    NSLog(@"\n\n\n\n\n\n-----------request-----------\n%@",request);
//    NSOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        if (success == nil) return;
//
//        NSLog(@"\n\n-----------response----------\n%@\n",response);
//        NSLog(@"\n\n-----------JSON-----------\n%@\n",JSON);
//
//        success(response,JSON);
//
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        if (failure == nil) return;
//        NSLog(@"\n\n-----------error-----------\n%@\n\n\n\n\n",error);
//        failure(error);
//    }];
//
//    [operation start];
//}

/*****************************************************************************/
/****************************旧AFN版本方法end***********************************/
#pragma clang diagnostic pop
@end
