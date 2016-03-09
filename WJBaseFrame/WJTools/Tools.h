//
//  Tools.h
//  EHealth_HM
//
//  Created by skusdk on 13-10-12.
//  Copyright (c) 2013年 dengwz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
//#define kAlphaNum   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
//#define kAlpha      @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
//#define kNumbers     @"0123456789"
//#define kNumbersPeriod  @"0123456789."

typedef enum {
    DateTypeHHmm,   //HH:mm
    DateTypeHHmmss, //HH:mm:ss
    DateTypeYAll    //YYYY-MM-dd HH:mm:ss
}DateType;

@interface Tools : NSObject
///**
// @method 获取指定宽度情况ixa，字符串value的高度
// @param value 待计算的字符串
// @param font 字体的大小
// @param andWidth 限制字符串显示区域的宽度
// @result CGFloat 返回的高度
// */
//+(CGFloat) heightForString:(NSString *) value font:(UIFont *) font andWidth:(CGFloat) width;
//
////+(CGFloat) heightForLabelByString:(NSString *) value font:(UIFont *) font andSize:(CGSize) size;
//
///**
// @method 获取字符串的宽度
// @param value 待计算的字符串
// @param font 字体的大小
// @result CGFloat 返回的高度
// */
//+(CGFloat) widthForString:(NSString *) value font:(UIFont *) font;

/**
 *	@brief	是否iOS7系统判断
 *
 *	@return	return value description
 */
+(BOOL) IS_IOS_7;

/**
 *	@brief	是否iOS8系统判断
 *
 *	@return	return value description
 */

+(BOOL)IS_IOS_8;

/**
 *	@brief	字符空值判断
 *
 *	@param 	string 	判断的字符串
 *
 *	@return	是否为NUll
 */
+(BOOL)isBlankString:(NSString *)string;



/**
 *	@brief	获取当前系统日期
 *
 *	@return	Year = [conponent year];
 *  @return	month = [conponent month];
 *  @return	day = [conponent day];
 */
-(NSDateComponents*)getDateNow;

/**
 *	@brief	获取系统当前时间
 *
 *	@param 	type 	DateType
 *
 *	@return	typeStyle
 */
+(NSString*)getDateTimeNow:(DateType)type;

/**
 *@method 获取网络图片
 *@param Url 图片路径
 */
+(void)getUIImageWithUrl:(NSString *) url succes:(void (^)(UIImage *rImg)) sucess;

/**
 *	@brief	获取导航堆栈内对应的UIViewController对象
 *
 *	@param 	navControllers 	导航堆栈
 *	@param 	outController 	需要获取的UIViewController
 *
 */
//+(UIViewController *)FindRootViewController:(NSArray *)navControllers outViewController:(Class)outViewController;


/**
 *@method 判断是否为浮点形
 *@param string 字符数据
 */
+(BOOL)isPureFloat:(NSString *)string;

/**
 *@method 判断是否为整形
 *@param string 字符数据
 */
+(BOOL)isPureInt:(NSString *)string;



+ (NSString*)getErrorTextByStatus:(NSInteger)errorCode;
//URL转码
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
//URL解码
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;


/**
 * baidu->gcj
 *百度坐标转化为国策局坐标
 */
//+(CLLocationCoordinate2D)baiduTogcj:( CLLocationCoordinate2D )locaPoint;

//火星坐标转为百度坐标
//+(CLLocationCoordinate2D )gcjToBaidu:( CLLocationCoordinate2D )locaPoint;


//转化距离
+(NSString*)transDistance:(NSInteger)iDistance;

//比较时间大小（格式2012-07-08 18：03：00）
+(NSInteger)compareTimeByStr:(NSString*)firstTime secondStrTime:(NSString*)secondTime;

//转化时间成字典
+(NSDictionary*)transeStrTime:(NSString*)strTime;

//+(CGSize)fontSize:(int)fontSize text:(NSString *)text width:(float)width;


#pragma mark 包大小转换工具类（将包大小转换成合适单位）
+(NSString *)getDataSizeString:(int) nSize;

#pragma mark 检查字符串是否为空
+(BOOL)checkStringIsEmpty:(NSString *)string;

#pragma mark - 当需要按照列表的形式显示一些view时，可根据参数返回view要显示的位置

/*
 参数说明：
 startPos:显示开始的位置
 size:显示的view的大小
 offX:每列的间隔距离
 offY：每行的间隔距离
 iCurrShow:当前显示的第几个
 count:一共有多少个需要显示
 perNum：每行显示多少个
 
 适用情况：
 要按表格的形式显示一系列的大小相同的view
 
 返回值：返回某个view要显示的位置
 */
+(CGRect)getViewRectWithStartPos:(CGPoint)startPos viewSize:(CGSize)size offXPos:(CGFloat)offX offYPos:(CGFloat)offY currShow:(NSUInteger)iCurrShow /*allCount:(NSUInteger)count*/ perRowShowNum:(NSUInteger)perNum;


/*邮箱验证 MODIFIED BY HELENSONG*/
+(BOOL)isValidateEmail:(NSString *)email;

/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile;

/*车牌号验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateCarNo:(NSString*)carNo;

//获取错误码
+ (NSInteger) getErrorCodeByError:(NSError*)error;

///是否打开相机权限
+ (BOOL)isCameraPermissions;

//用颜色和大小来创建一个纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize) size;
@end
