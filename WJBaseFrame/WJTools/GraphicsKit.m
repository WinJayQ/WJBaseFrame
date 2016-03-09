//
//  GraphicsKit.m
//  KeysDemo
//
//  Created by mac on 15/4/11.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "GraphicsKit.h"

@implementation GraphicsKit

///绘制贴图
+ (UIImage *)mergeImageWithBaseImage:(UIImage *)baseImage pasteImage:(UIImage *)pasteimage pastePoint:(CGPoint)pastePoint
{
    if (!baseImage) {
        return nil;
    }
    
    if (!pasteimage) {
        return nil;
    }
    
    //表明获取位图上下文并开始绘制
    UIGraphicsBeginImageContext(baseImage.size);
    
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    //将底图绘制到上下文中
    [baseImage drawInRect:CGRectMake(0, 0, baseImage.size.width, baseImage.size.height)];
    
    //绘制子图
    [pasteimage drawInRect:CGRectMake(pastePoint.x, pastePoint.y, pasteimage.size.width, pasteimage.size.height)];
    
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


///图片裁剪
+ (UIImage *)imageByClipSouceImage:(UIImage *)souceImage sourceRect:(CGRect)sourceRect clipSize:(CGSize)clipSize
{
    CGImageRef imageRef = souceImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, sourceRect);
    UIGraphicsBeginImageContext(clipSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, sourceRect, subImageRef);
    //UIImage* image = [UIImage imageWithCGImage:subImageRef];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); //返回裁剪的图像
    return image;
}

///按比例放缩图片
+ (UIImage *)scaleImage:(UIImage *)sourceImage widthScale:(CGFloat)widthScale heightScale:(CGFloat)heightScale
{
    CGFloat width = sourceImage.size.width * widthScale;
    CGFloat height = sourceImage.size.height * heightScale;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImage drawInRect:CGRectMake(0, 0, width, height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


///按长度放缩图片
+ (UIImage *)scaleImage:(UIImage *)sourceImage toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [sourceImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
