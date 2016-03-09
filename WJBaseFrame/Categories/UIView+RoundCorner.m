//
//  UIView+RoundCorner.m
//  tata
//
//  Created by Jhnavi on 13-7-24.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import "UIView+RoundCorner.h"

@implementation UIView (RoundCorner)

- (void)circleCorner {
    self.clipsToBounds = true;
    [self.layer setCornerRadius:CGRectGetWidth(self.bounds)*0.5];
}
- (void)avatarCorner
{
    self.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2.0f;
}

- (void)viewCorner
{
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

- (void)setCorner:(CGFloat)f
{
    self.layer.cornerRadius = f;
    self.layer.masksToBounds = YES;
}


- (void)viewCornerWithBoarderWith:(CGFloat)width color:(UIColor*)color
{
    [self viewCorner];
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;

}

- (void)defaultBtnShape
{
    [self viewCornerWithBoarderWith:1.0f color:[UIColor clearColor]];
}
@end
