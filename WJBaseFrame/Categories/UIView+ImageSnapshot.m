//
//  UIView+ImageSnapshot.m
//  RESideMenuExample
//
//  Created by Sam Oakley on 22/07/2013.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "UIView+ImageSnapshot.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (ImageSnapshot)

//屏幕截图
- (UIImage *)screenShot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
