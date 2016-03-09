//
//  UIImageView+Size.m
//  DimsumPhoto
//
//  Created by Jhnavi on 13-6-4.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import "UIImageView+Size.h"

@implementation UIImageView (Size)


- (void)autoAspectFitIn:(CGSize)size{
    self.autoresizesSubviews = NO;
    NSLog(@"before resize: w=%f,h=%f",self.frame.size.width,self.frame.size.height);
    CGFloat h = self.image.size.height;
    CGFloat w = self.image.size.width;
    NSLog(@"image:: w=%f,h=%f",w,h);

    CGFloat frameWidth = 0;
    CGFloat frameHeight = 0;
    
    CGRect rect = self.frame;
    if (w>h) {//横
        CGFloat rate = w/size.width;
        frameWidth = size.width;
        frameHeight = h/rate;
    }
    else{
        CGFloat rate = h/size.width;
        frameWidth = w/rate;
        frameHeight = size.height;
    }
    
    rect.size = CGSizeMake(frameWidth,frameHeight);
    self.frame = rect;
    NSLog(@"after resize: w=%f,h=%f",self.frame.size.width,self.frame.size.height);
}


- (void)autoAdjustCenterIn:(CGSize)size{
    CGFloat x = size.width/2;
    CGFloat y = size.height/2;
    
    self.center = CGPointMake(x, y);
}


@end
