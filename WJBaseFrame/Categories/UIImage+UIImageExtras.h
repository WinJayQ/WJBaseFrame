//
//  UIImage+UIImageExtras.h
//  Card
//
//  Created by jh navi on 15/1/19.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(UIImageExtras)
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height;
@end
