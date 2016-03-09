//
//  NSObject+Utilities.h
//  KeysDemo
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 IM. All rights reserved.
//

/*************************************文件功能说明*******************************/

/**
NSObject的分类。
 **/

/*****************************************************************************/

#import <Foundation/Foundation.h>

@interface NSObject (Utilities)

///判定对象是否存在
- (BOOL)exists;

///断言obj存在
- (void)assert:(id)obj ;

@end
