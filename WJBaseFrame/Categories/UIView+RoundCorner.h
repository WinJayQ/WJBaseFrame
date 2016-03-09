//
//  UIView+RoundCorner.h
//  tata
//
//  Created by Jhnavi on 13-7-24.
//  Copyright (c) 2013年 Maxicn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (RoundCorner)
- (void)circleCorner; //圆形头像1
- (void)avatarCorner; //圆形头像2,有白边
- (void)viewCorner; //圆角
- (void)setCorner:(CGFloat)f;  //设置角度
- (void)viewCornerWithBoarderWith:(CGFloat)width color:(UIColor*)color; //设置边宽
- (void)defaultBtnShape;//默认按钮形状
@end
