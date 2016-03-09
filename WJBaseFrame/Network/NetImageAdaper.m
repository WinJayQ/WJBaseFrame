//
//  NetImageAdaper.m
//  Card
//
//  Created by mac on 14/12/15.
//  Copyright (c) 2014年 JH. All rights reserved.
//

#import "NetImageAdaper.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "globalHeaders.h"

@implementation NetImageInfo

@end

@implementation NetImageAdaper

//获取网络图片所在的路径
+ (NSURL *)getNetImageUrlWithInfo:(NSDictionary *)userInfo
{
    NSURL *pictureURL;
    NSNumber *imageType = userInfo[kNetImageType];
    NSNumber *imageID = userInfo[kNetImageId];
    NSNumber *imageWidth = userInfo[kNetImageWidth];
    NSNumber *imageHeight = userInfo[kNetImageHeight];
    
    NSString *defaultPath = kDownLoadImagURL;
    
    
    NSString *strUserInfo = [NSString stringWithFormat:@"Type=%@&Id=%@&W=%@&H=%@",imageType,imageID,imageWidth,imageHeight];
    defaultPath = [defaultPath stringByAppendingFormat:@"%@",strUserInfo];
    
    NSLog(@"%@",defaultPath);
    pictureURL = [NSURL URLWithString:defaultPath];
    
    return pictureURL;
}


//获取图片
+ (void)loadImageWithInfo:(NSDictionary*)userInfo
              toImageView:(UIImageView*) imageView
               placeImage:(UIImage*)placeImage
           compeleteBlock:(void(^)(UIImage *loadImage))compeleteBlock
{
    
    NSURL *URL = [self getNetImageUrlWithInfo:userInfo];
    [imageView sd_setImageWithURL:URL placeholderImage:placeImage options:SDWebImageLowPriority | SDWebImageRetryFailed | SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        compeleteBlock(image);
    }];
    
}

@end
