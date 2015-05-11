//
//  BaseTools.m
//  AmericanBaby
//
//  Created by Computer on 14-8-21.
//  Copyright (c) 2014年 Computer. All rights reserved.
//

#import "BaseTools.h"

@implementation BaseTools

+(NSDictionary *)decodeJsonString: (NSData*)data
{
    if (data == nil) {
        return nil;
    }
    NSError *error = nil;
    NSDictionary *dictFromJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (error == nil) {
        return dictFromJson;
    }else{
        NSLog(@"Json解析失败:%@",error);
    }
    return nil;
}

+(NSArray *)decodeArrayJsonString: (NSData*)data
{
    if (data == nil) {
        return nil;
    }
    NSError *error = nil;
    NSArray *arrayFromJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (error == nil) {
        return arrayFromJson;
    }else{
        NSLog(@"[decodeArrayJsonString]Json解析失败:%@",error);
    }
    return nil;
}
@end
