//
//  Constants.h
//  KeysDemo
//
//  Created by mac on 15/3/27.
//  Copyright (c) 2015年 IM. All rights reserved.
//


/**********************************文件功能说明**************************/
/**
 本文件主要是声明和实现一些常用的宏常量和宏函数，方便编码时直接使用，节省开发时间
 
 本文件的引入位置在.pch文件中
 **/

/*********************************************************************/

#ifndef Config_Constants_h
#define Config_Constants_h

/**
 *	@brief	判断当前设备是否是iPad
 */
#define IS_IPAD     ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

/**
 *	@brief	判断当前设备是否是iPhone或者iPod
 */
#define IS_IPHONE_IPOD  !([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

/**
 *	@brief	判断当前所用的是ios的哪个版本
 */
#define IS_IOS6 (kSystemVersion >= 6.0 && kSystemVersion < 7.0)
#define IS_IOS7 (kSystemVersion >= 7.0 && kSystemVersion < 8.0)
#define IS_IOS8 (kSystemVersion >= 8.0 && kSystemVersion < 9.0)
#define IS_IOS9 (kSystemVersion >= 9.0 && kSystemVersion < 10.0)

/**
 *	@brief	判断是用模拟器还是真机的方法
 */
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif


/**
 *	@brief	获取当前的screen的大小数据
 */
#define kMainFrame   [[UIScreen mainScreen] bounds]
#define kMainWidth    [[UIScreen mainScreen] bounds].size.width
#define kMainHeight   [[UIScreen mainScreen] bounds].size.height


/**
 *	@brief	获取当前的全局异步线程/主线程（同步线程）
 */
#define kGlobalQueue  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kMainQueue    dispatch_get_main_queue()


/**
 *	@brief	系统版本号
 */
#define kSystemVersion [[UIDevice currentDevice].systemVersion floatValue]


//颜色和透明度设置
#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define kClearColor [UIColor clearColor]


/**********快速创建单例单例begin**********/
//.h
#define single_interface(class) + (class *)shared##class;



//.m
// \ 代表下一行也属于宏
// ## 是分隔符
#define single_implementation(class) \
static class *_instance;\
+ (class *)shared##class{\
if (_instance == nil) {\
_instance = [[self alloc]init];\
}\
return _instance;\
}\
\
+ (id)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}
/**********快速创建单例单例end**********/

#define kDatabase [DatabaseTool sharedDatabaseTool].globalHelper

#endif
