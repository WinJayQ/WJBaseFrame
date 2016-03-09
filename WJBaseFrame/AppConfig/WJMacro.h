//
//  JHMacro.h
//  tata
//
//  Created by Jhnavi on 13-7-3.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

//<-----------
//notification
#define JHPostNotification(__X__, __Y__, __Z__) [[NSNotificationCenter defaultCenter] \
postNotificationName:__X__ \
object:__Y__ \
userInfo:__Z__]

#define JHAddNotification(__A__, __B__, __C__, __D__) \
[[NSNotificationCenter defaultCenter] \
addObserver:__A__ \
selector:__B__ \
name:__C__ \
object:__D__];

#define JHRemoveNotification(__A__) \
[[NSNotificationCenter defaultCenter] removeObserver:self name:__A__ object:nil]
//<-----------


//<-----------------
#define JHFloat(f) [NSString stringWithFormat:@"%f",f]
#define JHInt(d) [NSString stringWithFormat:@"%d",d]
//-------------------



//<-------------------
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
#define JHMutilineTextSize(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define JHMutilineTextSize(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

//-------------------

#define kAPIClientAccessKey [Base64Ex stringByEncodingData:[@"android:android_password" dataUsingEncoding:NSUTF8StringEncoding]]

#define kDefaultUserAPIAccessKey [NSString stringWithFormat:@"%@ %@",[JHGlobalUser sharedGlobal].defaultUser.token_type,[JHGlobalUser sharedGlobal].defaultUser.access_token]

#define kDefaultUserRefreshKey [JHGlobalUser sharedGlobal].defaultUser.refresh_token
#define kDefaultUserUid [JHGlobalUser sharedGlobal].defaultUser.uid
#ifndef __EXFRAMESIZE__
#define kNavBarHeight   60
#define kTabBarHeight   54
#define size2height(_size_) [UIFont systemFontOfSize:_size_].lineHeight
#endif

#define kNetwork [NSUserDefaults sharedObjectForKey:@"network"]
#define kNetwork [NSUserDefaults sharedObjectForKey:@"network"]

#define kCurrentLocation [NSUserDefaults sharedObjectForKey:@"currentLocation"]

#define kStartLocation [[(JHAppDelegate *)[UIApplication sharedApplication].delegate manager]startUpdatingLocation];
#define kStopLocation [[(JHAppDelegate *)[UIApplication sharedApplication].delegate manager]stopUpdatingLocation];

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


//默认图片
#define kDefaultImage @"common_default_nor.png"

