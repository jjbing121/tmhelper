//
//  BaseTools.h
//  AmericanBaby
//
//  Created by Computer on 14-8-21.
//  Copyright (c) 2014年 Computer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTools : NSObject
+(NSDictionary *)decodeJsonString: (NSData*)data;

+(NSArray *)decodeArrayJsonString: (NSData*)data;
@end
