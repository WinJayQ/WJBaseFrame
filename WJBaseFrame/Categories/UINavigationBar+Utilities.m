//
//  UINavigationBar+Utilities.m
//  KeysDemo
//
//  Created by mac on 15/4/21.
//  Copyright (c) 2015年 IM. All rights reserved.
//

#import "UINavigationBar+Utilities.h"

@implementation UINavigationBar (Utilities)


///绘制导航栏背景
- (void)drawNaviBar
{
    UIGraphicsBeginImageContext(CGSizeMake(kMainWidth, 64));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat compotents[12] = {
        212/255.0f,160/255.0f,252/255.0f,1.0f,
        0,1,0,1.0f,
        0.5,0.5,1.0,1.0f
    };
    
    CGFloat locations[3] = {
        0.2f,0.6,1.0f
    };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, compotents, locations, 3);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(kMainWidth, 64), kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}


+ (void)drawNaviBar
{
    UIGraphicsBeginImageContext(CGSizeMake(kMainWidth, 64));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat compotents[12] = {
        1,0,0,1.0f,
        0,1,0,1.0f,
        0,0,1,1.0f
    };
    
    CGFloat locations[3] = {
        0.1,0.7,1.0
    };
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, compotents, locations, 3);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(kMainWidth, 64), kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    UIGraphicsEndImageContext();
    
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

@end
