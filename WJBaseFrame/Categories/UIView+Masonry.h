//
//  UIView+Masonry.h
//  WJBaseFrame
//
//  Created by jh navi on 16/3/18.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface UIView(Masonry)

- (void)distributeSpacingHorizontallyWith:(NSArray *)views;
- (void)distributeSpacingVerticallyWith:(NSArray *)views;

@end
