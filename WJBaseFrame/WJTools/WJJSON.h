//
//  JHJSON.h
//  tata
//
//  Created by CalvinLaw on 5/11/13.
//  Copyright (c) 2013 Maxicn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(WJJSON)

- (id)JSONObject;

@end

@interface NSString(WJJSON)

- (id)JSONObject;
+ (NSString *)JSONString:(id)object;
+ (NSString *)prettyJSONString:(id)object;

@end

@interface NSDictionary(WJJSON)

- (NSString *)JSONString;
- (NSString *)prettyJSONString;

@end

@interface NSArray(WJJSON)

- (NSString *)JSONString;
- (NSString *)prettyJSONString;

@end
