//
//  UIImage+RoundCorner.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/3.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "UIImage+RoundCorner.h"

@implementation UIImage(RoundCorner)
//圆角图形
- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
    CGRect rect = (CGRect){0.f, 0.f, self.size};
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
