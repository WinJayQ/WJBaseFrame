//
//  UIImageView+Size.h
//  DimsumPhoto
//
//  Created by Jhnavi on 13-6-4.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Size)
- (void)autoAspectFitIn:(CGSize)size;

- (void)autoAdjustCenterIn:(CGSize)size;
@end
