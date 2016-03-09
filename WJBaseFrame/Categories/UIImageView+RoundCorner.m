//
//  UIImageView+RoundCorner.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/3.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "UIImageView+RoundCorner.h"

@implementation UIImageView(RoundCorner)
//最简单的图片圆角
- (void)normalCorner {
    self.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.0f;
    self.layer.masksToBounds = YES;
    //离屏渲染（off-screen-rendering）需要消耗性能
}

//栅格化的图片圆角
- (void)rasterizeCorner {
    self.layer.cornerRadius=CGRectGetWidth(self.bounds)/2.0f;
    self.layer.shouldRasterize = YES;
    self.clipsToBounds=YES;
    self.layer.rasterizationScale=[UIScreen mainScreen].scale;  //不设置会模糊
}

@end
