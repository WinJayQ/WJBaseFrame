//
//  GraphicsKit.h
//  KeysDemo
//
//  Created by mac on 15/4/11.
//  Copyright (c) 2015年 IM. All rights reserved.
//


/**********************************文件功能说明**************************/

/**
 本文件主要是为了封装一些常用的绘制相关的方法（一些使用方法可以看GraphicExample类中的例子）
 
  1、这里需要说明的是，如果需要用到上下文，即CGContextRef对象，除了用UIKit中已经封装的了，把上下文封装到方法中的，其余要用到上下文的，有两种方式获得，一种就是继承UIView及其子类的类，然后在类中重写drawRect:方法时，用CGGraphicGetCurrentContext方法可以得到上下文。另外一种方式就是，通过UIGraphicsBeginImageContext(CGSize size)或者UIGraphicsBeginPDFPageWithInfo(CGRect bounds, NSDictionary *pageInfo)方法,再用UIGraphicsGetCurrentContext获取上下文，这两种获取上下文的方式根据是需要生成位图还是PDF文件来决定
 
 2、这里需要说明的是，UIView中的drawRect方法，是系统调用的，只能重写，不能主动去调用。
 
 **/

/*********************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GraphicsKit : NSObject

/**
 *@method 在一张图上贴上另一张图
 *@param baseImage      要被贴上图片的基础底图
 *@param pasteImage     将要拿去贴的图
 *@param pastePoint     贴图开始的位置(相对于基础地图)
 *@return 贴完图之后两张图合并图
 */
///贴图
+ (UIImage *)mergeImageWithBaseImage:(UIImage *)baseImage pasteImage:(UIImage *)pasteimage pastePoint:(CGPoint)pastePoint;

/**
 *@method   裁剪图片
 *@param souceImage     将要被裁剪的源图片
 *@param sourceRect     源图片里要被裁剪的区域
 *@param clipSize       源图片里要被裁剪的区域里被裁减的大小
 *@return 裁剪完之后的图片
 */
///裁剪图片
+ (UIImage *)imageByClipSouceImage:(UIImage *)souceImage sourceRect:(CGRect)sourceRect clipSize:(CGSize)clipSize;


/**
 *@method   按比例放缩图片
 *@param souceImage     将要被放缩的源图片
 *@param widthScale     宽度放缩比
 *@param heightScale    高度放缩比
 *@return 放缩完之后的图片
 */
///按比例放缩图片
+ (UIImage *)scaleImage:(UIImage *)sourceImage widthScale:(CGFloat)widthScale heightScale:(CGFloat)heightScale;

/**
 *@method   按长度放缩图片
 *@param souceImage     将要被放缩的源图片
 *@param width          放缩后的宽度
 *@param height         放缩后的高度
 *@return 放缩完之后的图片
 */
///按长度放缩图片
+ (UIImage *)scaleImage:(UIImage *)sourceImage toSize:(CGSize)size;

@end
