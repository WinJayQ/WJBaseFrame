//
//  WJConfig.h
//  zlDSA
//
//  Created by jh navi on 15/7/15.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#ifndef zlDSA_WJConfig_h
#define zlDSA_WJConfig_h

#define WJOfficial          10086

#ifdef WJOfficial

/**************************正式版*************************/

/****服务器域名****/
#define kServerURL                           @"http://wzapp.ginha.com"
#define kUpLoadImagURL                       @"http://xxx.com/RecvPicture.ashx"
#define kDownLoadImagURL                     @"http://xxx.com/DownloadPicture.ashx?"


/****个推key****/
#define kGeTui_AppId                        @"sbRd0eMHxxxG72K5NET3"
#define kGeTui_AppKey                       @"VCidAFiR2xxxItYqCBUiBp8"
#define kGeTui_AppSecret                    @"8pcgmvm2Jxxx90CXjeNxKUe3"
/**************************正式版end*************************/

#else

/**************************测试版*************************/

/****服务器域名****/
#define kServerURL                         @"http://xxx:2000"
#define kUpLoadImagURL                     @"http://xxx.com/RecvPicture.ashx"
#define kDownLoadImagURL                   @"http://xxx.com/DownloadPicture.ashx?"

/****个推key****/
#define kGeTui_AppId                        @"bjWVXSxxxS4B3DB5RVOAI2"
#define kGeTui_AppKey                       @"XRKqbgGxxxZAddO6KoSEDW6"
#define kGeTui_AppSecret                    @"EBMO35Hxxx6ApzptOQcAJR6"
/**************************测试版end*************************/

#endif


/**
 *	@brief	调试输出    
 *  注释下面代码就输出NSLog(适用于测试版)，打开注释时则不输出NSLog(适用于发布版)
 */

/*
#if JHDebug
#    define NSLog(...) NSLog(__VA_ARGS__)
#else
#    define NSLog(...) {}
#endif
*/

/* XCode-开发中消除警告语句
 #pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wdeprecated-declarations"
 <#这里包含住出现警告的代码#>
 #pragma clang diagnostic pop
 */

#endif
