//
//  Tools.m
//  EHealth_HM
//
//  Created by skusdk on 13-10-12.
//  Copyright (c) 2013年 dengwz. All rights reserved.
//

#import "Tools.h"
#import "Constants.h"
#import "WJMacro.h"

@implementation Tools
/**
 @method 获取指定宽度情况下，字符串value的高度
 @param value 待计算的字符串
 @param font 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result CGFloat 返回的高度
 */
//+(CGFloat) heightForString:(NSString *) value font:(UIFont *) font andWidth:(CGFloat) width
//{
//    CGSize sizeToFit = [value sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
//    return sizeToFit.height + 10;
//}
//
//+(CGFloat) heightForLabelByString:(NSString *) value font:(UIFont *) font andSize:(CGSize) size
//{
//    CGSize sizeToFit = [value sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
//    return sizeToFit.height;
//}
//
///**
// @method 获取字符串的宽度
// @param value 待计算的字符串
// @param font 字体的大小
// @result CGFloat 返回的高度
// */
//+(CGFloat) widthForString:(NSString *) value font:(UIFont *) font
//{
//    CGSize sizeToFit = [value sizeWithFont:font];
//    return sizeToFit.width;
//}

+(BOOL)IS_IOS_7
{
    return kSystemVersion > 6.2 && kSystemVersion < 8.0;
}

+(BOOL)IS_IOS_8
{
    return kSystemVersion >= 8.0;
}



-(NSDateComponents*)getDateNow
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *conponent = [cal components:unitFlags fromDate:[NSDate date]];
    return conponent;
}

+(NSString*)getDateTimeNow:(DateType)type
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    switch (type) {
        case DateTypeHHmm:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case DateTypeHHmmss:
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            break;
        case DateTypeYAll:
            [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
            break;
        default:
            [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
            break;
    }
    return [dateFormatter stringFromDate:date];
}


+ (BOOL)isBlankString:(NSString *)string
{
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    if (temp == nil) {
        return YES;
    }
    if (temp == NULL) {
        return YES;
    }
    if ([temp isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if(temp.length < 1){
        return YES;
    }
    return NO;
}

/**
 *@method 获取网络图片
 *@param Url 图片路径
 */
+(void)getUIImageWithUrl:(NSString *) url succes:(void (^)(UIImage *rImg)) sucess
{
    UIImage *img = nil;
    if(img == nil)
    {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if(data == nil) return;
        img = [UIImage imageWithData:data];
    }
    
    sucess(img);
}

/**
 *@method 判断是否为整形
 *@param string 字符数据
 */
+(BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/**
 *@method 判断是否为浮点形
 *@param string 字符数据
 */
+(BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}




+ (NSString*)getErrorTextByStatus:(NSInteger)errorCode
{
    
    NSString *text = nil;
    switch (errorCode) {
        case -1:
            text = @"服务器内部异常";
            break;
        case 0:
            text = @"";
            break;
        case 1:
            text = @"旧密码错误";
            break;
        case 2:
            text = @"登录失败";
            break;
        case 3:
            text = @"请求参数有误";
            break;
        case 4:
            text = @"注册失败";
            break;
        case 5:
            text = @"验证码错误";
            break;
        case 6:
            text = @"没有该手机号";
            break;
        case 7:
            text = @"数据不存在";
            break;
        case 8:
            text = @"数据错误";
            break;
        case 9:
            text = @"非法请求";
            break;
        case 10:
            text =@"已存在相同分组名";
            break;
        case 11:
            text = @"分组不存在或已被删除";
            break;
        case 12:
            text = @"分组关系已存在";
            break;
        case 13:
            text = @"名称不能为空";
            break;
        case 14:
            text = @"手机号不正确";
            break;
        case 15:
            text = @"用户名称有非法字符";
            break;
        case 16:
            text = @"职务有非法字符";
            break;
        case 17:
            text = @"公司名称有非法字符";
            break;
        case 18:
            text = @"公司地址有非法字符";
            break;
        case 19:
            text = @"主营有非法字符";
            break;
        case 20:
            text = @"个人名片已存在";
            break;
        case 21:
            text = @"名片不存在或已被删除";
            break;
        case 22:
            text = @"个人名片不存在";
            break;
        case 23:
            text = @"分组关系不存在";
            break;
        case 24:
            text = @"好友个人名片不存在";
            break;
        case 25:
            text = @"不可以对自己发私信";
            break;
        case 26:
            text = @"名片好友关系存在";
            break;
        case 27:
            text = @"名片好友关系不存在";
            break;
        case 51:
            text = @"验证码过期";
            break;
        case 100:
            text = @"验证码次数超出限制";
            break;
        case 101:
            text = @"验证码间隔太短";
            break;
        case 110:
            text = @"验证码间隔太短";
            break;
        case 600:
            text = @"搜索引擎错误";
            break;
        case 601:
            text = @"auth错误的请求";
            break;
        case 602:
            text = @"错误的客户端认证信息";
            break;
        case 603:
            text = @"账号或密码不正确";
            break;
        case 604:
            text = @"名片未认证";
            break;
        case 605:
            text = @"当前网络不稳定";//错误或过期的accesstoken
            break;
        case 606:
            text = @"当前网络不稳定";//错误或过期的refreshtoken
            break;
        case 607:
            text = @"服务端出现不可预料的错误";
            break;
        case 608:
            text = @"错误密码";
            break;
        case 700:
            text = @"手机号已被注册";
            break;
        case 701:
            text = @"用户名已经存在";
            break;
        case 702:
            text = @"注册密码错误";
            break;
        case 703:
            text = @"注册密码已经过期";
            break;
        case 704:
            text = @"没有绑定设备";
            break;
        case 706:
            text = @"不是正式账号";
            break;
  //      case kReachabilityFail:
   //         text = @"请检查网络是否正常";
    //        break;
        case -1001:
            text = @"请求超时";
            break;
        default:
            text = @"未知错误";
            break;
    }
    
    return text;
}

+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *outputStr = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                (CFStringRef)input,
                                                                                                NULL,
                                                                                                (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                kCFStringEncodingUTF8);
    return outputStr;
}

+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


//
///**
// * baidu->gcj
// *百度坐标转化为国策局坐标
// */
//-(void)baiduTogcj
//{
//    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    BMKLocationService* locService;
//    locService = delegate.locService;
//
//    double x_pi = M_PI * 3000.0 / 180.0;
//    double x = (double)locService.userLocation.location.coordinate.longitude - 0.0065;
//    double y = (double)locService.userLocation.location.coordinate.latitude - 0.006;
//    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
//    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
//    double gg_lon = z * cos(theta);
//    double gg_lat = z * sin(theta);
//    searchParam.lng = gg_lon;
//    searchParam.lat = gg_lat;
//
//}

/**
 * baidu->gcj
 *百度坐标转化为国策局坐标
 */
//+(CLLocationCoordinate2D)baiduTogcj:( CLLocationCoordinate2D )locaPoint
//{
//    double x_pi = M_PI * 3000.0 / 180.0;
//    double x = locaPoint.longitude - 0.0065;
//    double y = locaPoint.latitude - 0.006;
//    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
//    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
//    double gg_lon = z * cos(theta);
//    double gg_lat = z * sin(theta);
//    CLLocationCoordinate2D resPoint;
//    resPoint.longitude = gg_lon;
//    resPoint.latitude = gg_lat;
//    return resPoint;
//}

//火星坐标转为百度坐标
//+(CLLocationCoordinate2D )gcjToBaidu:( CLLocationCoordinate2D )locaPoint//火星坐标转化为百度坐标   (GCJ-02)转化(BD-09)
//{
//    double x_pi = M_PI * 3000.0 / 180.0;
//    double x = locaPoint.longitude;
//    double y = locaPoint.latitude;
//    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
//    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
//    double bd_lon = z * cos(theta) + 0.0065;
//    double bd_lat = z * sin(theta) + 0.006;
//
//    CLLocationCoordinate2D resPoint;
//    resPoint.latitude = bd_lat;
//    resPoint.longitude = bd_lon;
//    return resPoint;
//}


//转化距离
+(NSString*)transDistance:(NSInteger)iDistance
{
    float fTemp;
    if (iDistance < 1000) {//<1Km
        return [NSString stringWithFormat:@"%@m",@(iDistance)];
    }else if (iDistance >= 1000 && iDistance < 100000) {//<100KM
        fTemp = iDistance/1000.0f;
        return [NSString stringWithFormat:@"%0.2fkm",fTemp];
    }else//>100Km
    {
        fTemp = iDistance/1000.0f;
        return [NSString stringWithFormat:@"%0.1fkm",fTemp];
    }
}


//比较时间大小（格式2012-07-08 18：03：00）
+(NSInteger)compareTimeByStr:(NSString*)firstTime secondStrTime:(NSString*)secondTime
{
    NSDictionary *firstDict = [self transeStrTime:firstTime];
    NSDictionary *secondDict = [self transeStrTime:secondTime];
    
    NSInteger firstYear = [firstDict[@"year"] integerValue];
    NSInteger firstMonth = [firstDict[@"month"] integerValue];
    NSInteger firstDay = [firstDict[@"day"] integerValue];
    NSInteger firstHour = [firstDict[@"hour"] integerValue];
    NSInteger firstMinutes = [firstDict[@"minutes"] integerValue];
    NSInteger firstSeconds= [firstDict[@"seconds"] integerValue];
    
    NSInteger secondYear = [secondDict[@"year"] integerValue];
    NSInteger secondMonth = [secondDict[@"month"] integerValue];
    NSInteger secondDay = [secondDict[@"day"] integerValue];
    NSInteger secondHour = [secondDict[@"hour"] integerValue];
    NSInteger secondMinutes = [secondDict[@"minutes"] integerValue];
    NSInteger secondSeconds= [secondDict[@"seconds"] integerValue];
    
    if (firstYear > secondYear) {
        return 1;
    }else if (firstYear < secondYear)
    {
        return -1;
    }
    else
    {
        
        if (firstMonth > secondMonth) {
            return 1;
        }else if (firstMonth < secondMonth)
        {
            return -1;
        }
        else
        {
            if (firstDay > secondDay) {
                return 1;
            }else if (firstDay < secondDay)
            {
                return -1;
            }
            else
            {
                if (firstHour > secondHour) {
                    return 1;
                }else if (firstHour < secondHour)
                {
                    return -1;
                }
                else
                {
                    if (firstMinutes > secondMinutes) {
                        return 1;
                    }else if (firstMinutes < secondMinutes)
                    {
                        return -1;
                    }
                    else
                    {
                        if (firstSeconds > secondSeconds) {
                            return 1;
                        }else if (firstSeconds < secondSeconds)
                        {
                            return -1;
                        }
                        else
                        {
                            return 0;
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}

//转化时间成字典
+(NSDictionary*)transeStrTime:(NSString*)str
{
    if ( [str isEqualToString:@""]) {
        return nil;
    }
    
    NSString *strTime;
    NSString *strYear;
    NSString *strMonth;
    NSString *strDay;
    NSString *strHour;
    NSString *strMinutes;
    NSString *strSeconds;
    
    strTime =  str;
    strYear = [strTime substringWithRange:NSMakeRange(0, 4)];
    strMonth = [strTime substringWithRange:NSMakeRange(5, 2)];
    strDay = [strTime substringWithRange:NSMakeRange(8, 2)];
    strHour = [strTime substringWithRange:NSMakeRange(11, 2)];
    strMinutes = [strTime substringWithRange:NSMakeRange(14, 2)];
    strSeconds = [strTime substringWithRange:NSMakeRange(17, 2)];
    
    NSDictionary *timeDict =@{
                              @"year":strYear,
                              @"month":strMonth,
                              @"day":strDay,
                              @"hour":strHour,
                              @"minutes":strMinutes,
                              @"seconds":strSeconds
                              };
    
    return timeDict;
}
//+(CGSize)fontSize:(int)fontSize text:(NSString *)text width:(float)width{
//    CGSize size;
//    if (![Tools IS_IOS_7]) {
//        size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize]constrainedToSize:(CGSizeMake(width, MAXFLOAT))];
//    }else{
//        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
//        size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
//    }
//    
//    
//    return size;
//}


#pragma mark 包大小转换工具类（将包大小转换成合适单位）
+(NSString *)getDataSizeString:(int) nSize
{
    NSString *string = nil;
    if (nSize<1024)
    {
        string = [NSString stringWithFormat:@"%dB", nSize];
    }
    else if (nSize<1048576)
    {
        string = [NSString stringWithFormat:@"%dK", (nSize/1024)];
    }
    else if (nSize<1073741824)
    {
        if ((nSize%1048576)== 0 )
        {
            string = [NSString stringWithFormat:@"%dM", nSize/1048576];
        }
        else
        {
            int decimal = 0; //小数
            NSString* decimalStr = nil;
            decimal = (nSize%1048576);
            decimal /= 1024;
            
            if (decimal < 10)
            {
                decimalStr = [NSString stringWithFormat:@"%d", 0];
            }
            else if (decimal >= 10 && decimal < 100)
            {
                int i = decimal / 10;
                if (i >= 5)
                {
                    decimalStr = [NSString stringWithFormat:@"%d", 1];
                }
                else
                {
                    decimalStr = [NSString stringWithFormat:@"%d", 0];
                }
                
            }
            else if (decimal >= 100 && decimal < 1024)
            {
                int i = decimal / 100;
                if (i >= 5)
                {
                    decimal = i + 1;
                    
                    if (decimal >= 10)
                    {
                        decimal = 9;
                    }
                    
                    decimalStr = [NSString stringWithFormat:@"%d", decimal];
                }
                else
                {
                    decimalStr = [NSString stringWithFormat:@"%d", i];
                }
            }
            
            if (decimalStr == nil || [decimalStr isEqualToString:@""])
            {
                string = [NSString stringWithFormat:@"%dMss", nSize/1048576];
            }
            else
            {
                string = [NSString stringWithFormat:@"%d.%@M", nSize/1048576, decimalStr];
            }
        }
    }
    else	// >1G
    {
        string = [NSString stringWithFormat:@"%dG", nSize/1073741824];
    }
    
    return string;
}



+(BOOL)checkStringIsEmpty:(NSString *)string
{
    if(string == nil)
    {
        return YES;
    }
    if([string isKindOfClass:[NSString class]] == NO)
    {
        return YES;
    }
    
    return [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
}

/*
 参数说明：
 startPos:显示开始的位置
 size:显示的view的大小
 offX:每列的间隔距离
 offY：每行的间隔距离
 iCurrShow:当前显示的第几个(从1开始)
 //count:一共有多少个需要显示
 perNum：每行显示多少个
 
 适用情况：
 要按表格的形式显示一系列的大小相同的view
 
 返回值：返回某个view要显示的位置
 */
+(CGRect)getViewRectWithStartPos:(CGPoint)startPos viewSize:(CGSize)size offXPos:(CGFloat)offX offYPos:(CGFloat)offY currShow:(NSUInteger)iCurrShow /*allCount:(NSUInteger)count*/ perRowShowNum:(NSUInteger)perNum
{
    CGRect resRect;
    
    NSInteger xRow;//行数
    NSInteger yRow;//列数
    NSInteger xStartPos;//第一个view的x起始位置
    NSInteger yStartPos;//第一个view的y起始位置
    NSInteger xPos;//x位置
    NSInteger yPos;//y位置
    
    xStartPos = startPos.x;
    yStartPos = startPos.y;
    xRow = iCurrShow%perNum;
    yRow = iCurrShow/perNum;
    xPos = xStartPos + xRow * (offX + size.width);
    yPos = yStartPos + yRow * (offY + size.height);
    
    resRect = CGRectMake(xPos, yPos, size.width, size.height);
    return resRect;
}


/*邮箱验证 MODIFIED BY HELENSONG*/
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //    //手机号以13， 15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    //    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    return [phoneTest evaluateWithObject:mobile];
    
    
    NSScanner* scan = [NSScanner scannerWithString:mobile];
    int val;
    BOOL temp = [scan scanInt:&val] && [scan isAtEnd];
    if (!temp) {
        return NO;
    }
    else{
        if (mobile.length == 11) {
            return YES;
        }
        else{
            return NO;
        }
    }
    
}

/*车牌号验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateCarNo:(NSString*)carNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    //NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

+ (NSInteger) getErrorCodeByError:(NSError*)error
{
//    if ([error.domain isEqualToString:kReachabilityMark] && error.code == kReachabilityFail) {
//        return kReachabilityFail;
 //   }
    
    if ([error.domain isEqualToString:@"NSURLErrorDomain"] && error.code == -1001) {
        return -1001;
    }
    
    NSInteger code = 0;
    NSString* errorInfo = error.userInfo[@"NSLocalizedRecoverySuggestion"];
    errorInfo = [errorInfo stringByReplacingOccurrencesOfString:@"{" withString:@""];
    errorInfo = [errorInfo stringByReplacingOccurrencesOfString:@"}" withString:@""];
    NSArray* infoArr = [errorInfo componentsSeparatedByString:@","];
    for (NSString* obj in infoArr) {
        NSArray* tempArr = [obj componentsSeparatedByString:@":"];
        if (tempArr.count < 2) {
            continue;
        }
        
//        if ([str containsString:@"error_code"]) {
//            code = [tempArr[1] integerValue];
//            break;
//        }
        
        if ([tempArr[0] isEqualToString:@"\"error_code\""]) {
            code = [tempArr[1] integerValue];
            break;
        }
        
        if ([tempArr[0] isEqualToString:@" \"error_code\""]) {
            code = [tempArr[1] integerValue];
            break;
        }
        
        if ([tempArr[1] isEqualToString:@"\"error_code\""]) {
            code = [tempArr[0] integerValue];
            break;
        }
    }
    
    if (code == 0) {
        NSHTTPURLResponse *errorInfo = error.userInfo[@"AFNetworkingOperationFailingURLResponseErrorKey"];
        NSDictionary *dict = errorInfo.allHeaderFields;
        NSString *str = dict[@"Www-Authenticate"];
        NSArray* infoArr = [str componentsSeparatedByString:@","];
        for (NSString* obj in infoArr) {
            NSArray* tempArr = [obj componentsSeparatedByString:@"="];
            if (tempArr.count < 2) {
                continue;
            }
            
            if ([tempArr[0] isEqualToString:@"Bearer error_code"]) {
                code = [tempArr[1] integerValue];
                break;
            }
            
            if ([tempArr[1] isEqualToString:@"Bearer error_code"]) {
                code = [tempArr[0] integerValue];
                break;
            }
        }
    }
    
    return code;
}

#pragma mark -是否打开相机权限
//+ (BOOL)isCameraPermissions{
//    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//    if (authStatus != AVAuthorizationStatusAuthorized)
//    {
//        return NO;
//    }else{
//        return YES;
//    }
//}

+ (BOOL) isCameraPermissions
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied){
        
        //无权限
        return NO;
    }
    return YES;
}

//用颜色和大小来创建一个纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize) size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
