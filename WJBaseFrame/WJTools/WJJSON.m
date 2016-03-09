//
//  JHJSON.m
//  tata
//
//  Created by CalvinLaw on 5/11/13.
//  Copyright (c) 2013 Maxicn. All rights reserved.
//

#import "WJJSON.h"



@implementation NSData(WJJSON)

- (id)JSONObject{
    if(self == nil){
        return self;
    }
    return [NSJSONSerialization JSONObjectWithData:self options:0 error:nil];
}

@end

@implementation NSString(WJJSON)

- (id)JSONObject{
    if(self == nil){
        return self;
    }
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

+ (NSString *)JSONString:(id)object{
    if(object == nil){
        return nil;
    }
    NSData *json = [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
    return [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
}

+ (NSString *)prettyJSONString:(id)object{
    if(object == nil){
        return nil;
    }
    NSData *json = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
}

@end

@implementation NSDictionary(WJJSON)

- (NSString *)JSONString{
    return [NSString JSONString:self];
}

- (NSString *)prettyJSONString{
    return [NSString prettyJSONString:self];
}

@end

@implementation NSArray(WJJSON)

- (NSString *)JSONString{
    return [NSString JSONString:self];
}

- (NSString *)prettyJSONString{
    return [NSString prettyJSONString:self];
}

@end
