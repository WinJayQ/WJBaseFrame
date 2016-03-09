//
//  UIView+HUDKit.m
//  KeysDemo
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "UIView+HUDKit.h"
#import <MBProgressHUD.h>

//默认显示时间
#define kDefaultShowHudTime                     1.0f

@implementation UIView (HUDKit)

- (void)showProgressDialog {
   __block MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:HUD];
    HUD.labelText = @"正在加载";
    //设置模式为进度框形的
    HUD.mode = MBProgressHUDModeDeterminate;
    [HUD showAnimated:YES whileExecutingBlock:^{
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            HUD.progress = progress;
            usleep(50000);
        }
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

- (void)showProgressDialog2 {
    __block MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:HUD];
    HUD.labelText = @"正在加载";
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            HUD.progress = progress;
            usleep(50000);
        }
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

- (void)showCustomDialog {
    __block MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:HUD];
    HUD.labelText = @"操作成功";
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add"]];
    HUD.opacity = 1.0;
    HUD.margin = 10.0f; //设置HUD和customerView的边距（默认是20）
    HUD.yOffset = -20.0f; //设置HUD距离中心位置的y偏移（同理也可以设置xOffset）
   //    hud.userInteractionEnabled = NO; //userInteractionEnabled=NO时，
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
    
}

/**
 *	@brief	在默认时间里显示某个text
 */
- (void)showText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    //[hud setMode:MBProgressHUDModeText];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading.png"]];
    [hud setMode:MBProgressHUDModeCustomView];
    hud.labelText = text;
    hud.alpha = 1.0f;
    [hud hide:YES afterDelay:kDefaultShowHudTime];
}

/**
 *	@brief	在给定时间里显示某个text
 */
- (void)showText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationZoomOut];
    //[hud setMode:MBProgressHUDModeText];
    [hud setMode:MBProgressHUDModeCustomView];
    hud.labelText = text;
    hud.alpha = 1.0f;
    [hud hide:YES afterDelay:delay];
}

/**
 *	@brief	显示正在执行的状态
 */
- (void)showExcuting
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    [hud setMode:MBProgressHUDModeIndeterminate];
    //[hud setMode:MBProgressHUDModeDeterminate];
    [hud showExcuting];
}

/**
 *	@brief	显示某个text和正在执行的状态
 */
- (void)showExcutingWithText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    [hud setMode:MBProgressHUDModeIndeterminate];
    //[hud setMode:MBProgressHUDModeDeterminate];
    [hud showExcutingWithText:text];
}

/**
 *	@brief	隐藏某个view的HUD的显示
 */
- (void)hide
{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}



/**
 *	@brief	在windows中默认时间里显示某个text
 */
+ (void)showText:(NSString *)text
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    //[hud setMode:MBProgressHUDModeText];
    [hud setMode:MBProgressHUDModeCustomView];
    hud.labelText = text;
    hud.alpha = 1.0f;
    [hud hide:YES afterDelay:kDefaultShowHudTime];
}


/**
 *	@brief	在windows中在给定时间里显示某个text
 */
+ (void)showText:(NSString *)text hideAfterDelay:(NSTimeInterval)delay
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationZoomOut];
    //[hud setMode:MBProgressHUDModeText];
    [hud setMode:MBProgressHUDModeCustomView];
    hud.labelText = text;
    hud.alpha = 1.0f;
    [hud hide:YES afterDelay:delay];
}


/**
 *	@brief	在windows中显示正在执行的状态
 */
+ (void)showExcuting
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    [hud setMode:MBProgressHUDModeIndeterminate];
    //[hud setMode:MBProgressHUDModeDeterminate];
    [hud showExcuting];
}

/**
 *	@brief	在windows中显示某个text和正在执行的状态
 */
+ (void)showExcutingWithText:(NSString *)text
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    [hud setMode:MBProgressHUDModeIndeterminate];
    //[hud setMode:MBProgressHUDModeDeterminate];
    [hud showExcutingWithText:text];
}


/**
 *	@brief	在windows中隐藏某个view的HUD的显示
 */
+ (void)hide
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideAllHUDsForView:window animated:YES];
}

@end
