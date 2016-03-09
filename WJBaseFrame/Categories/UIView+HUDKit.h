//
//  UIView+HUDKit.h
//  KeysDemo
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 IM. All rights reserved.
//

/*************************************文件功能说明*******************************/

/**
 UIView的分类，这个分类的主要功能是和MBProgressHUD框架配合使用,显示提示框。
 **/

/*****************************************************************************/



#import <UIKit/UIKit.h>

@interface UIView (HUDKit)

@property (nonatomic, assign)  BOOL isLoading;

- (void)showProgressDialog;
- (void)showProgressDialog2;
- (void)showCustomDialog;

/**
 *	@brief	在默认时间里显示某个text
 */
- (void)showText:(NSString *)text;

/**
 *	@brief	在给定时间里显示某个text
 */
- (void)showText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;

/**
 *	@brief	显示正在执行的状态
 */
- (void)showExcuting;

/**
 *	@brief	显示某个text和正在执行的状态
 */
- (void)showExcutingWithText:(NSString *)text;

/**
 *	@brief	隐藏某个view的HUD的显示
 */
- (void)hide;



/**
 *	@brief	在windows中默认时间里显示某个text
 */
+ (void)showText:(NSString *)text;


/**
 *	@brief	在windows中在给定时间里显示某个text
 */
+ (void)showText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;

/**
 *	@brief	在windows中显示正在执行的状态
 */
+ (void)showExcuting;

/**
 *	@brief	在windows中显示某个text和正在执行的状态
 */
+ (void)showExcutingWithText:(NSString *)text;

/**
 *	@brief	在windows中隐藏某个view的HUD的显示
 */
+ (void)hide;

@end
