//
//  DatabaseTool.m
//  Card
//
//  Created by ios on 14/11/27.
//  Copyright (c) 2014年 JH. All rights reserved.
//

#import "DatabaseTool.h"

@implementation DatabaseTool
single_implementation(DatabaseTool)
- (instancetype)init
{
    self = [super init];
    if (self) {
        //清空数据库
        _globalHelper = [LKDBHelper getUsingLKDBHelper];
       // [_globalHelper dropAllTable];
       //[_globalHelper setDBName:@"VQDB"];
        //创建表  会根据表的版本号  来判断具体的操作 .
      //  [_globalHelper createTableWithModelClass:[CarBrandInfo class]];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSLog(@"%@",documentDirectory);
 
        //清空表数据
//        [LKDBHelper clearTableData:[CarBrandInfo class]];

    }
    return self;
}
@end
