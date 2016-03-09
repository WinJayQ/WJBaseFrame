//
//  NetImageAdaper.h
//  Card
//
//  Created by mac on 14/12/15.
//  Copyright (c) 2014年 JH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNNetworkAdapter.h"
#import "JSONModel.h"


@interface NetImageInfo : JSONModel

@property (nonatomic, copy) NSString *Type;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *W;
@property (nonatomic, copy) NSString *H;

@end

#define kNetImageType               @"Type"
#define kNetImageId                 @"Id"
#define kNetImageWidth              @"W"
#define kNetImageHeight             @"H"

@interface NetImageAdaper : NSObject

//imageView获取图片
+ (void)loadImageWithInfo:(NSDictionary*)userInfo
              toImageView:(UIImageView*) imageView
               placeImage:(UIImage*)placeImage
           compeleteBlock:(void(^)(UIImage *loadImage))compeleteBlock;

@end
