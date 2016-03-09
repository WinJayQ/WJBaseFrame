//
//  DatabaseTool.h
//  Card
//
//  Created by ios on 14/11/27.
//  Copyright (c) 2014年 JH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "LKDBHelper.h"
@interface DatabaseTool : NSObject
single_interface(DatabaseTool)
@property (nonatomic, strong)LKDBHelper *globalHelper;
@end
