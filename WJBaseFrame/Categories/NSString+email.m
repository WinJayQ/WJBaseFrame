//
//  NSString+email.m
//  fengbin@jhnavi.com
//
//  Created by Jhnavi on 13-6-23.
//  Copyright (c) 2013年 fengbin@jhnavi.com. All rights reserved.
//

#import "NSString+email.h"

@implementation NSString (email)
- (BOOL) isEmailAddress{
    
    NSString *emailRegex = @"^\\w+((\\-\\w+)|(\\.\\w+))*@[A-Za-z0-9]+((\\.|\\-)[A-Za-z0-9]+)*.[A-Za-z0-9]+$";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
} 

@end
