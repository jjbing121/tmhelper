//
//  HttpPack.h
//  Mibang3
//
//  Created by admin on 14/12/29.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpPack : NSObject
@property (nonatomic) BOOL packStatus;
@property (nonatomic) BOOL isEncrypted;
@property (nonatomic) int packLength;
@property (nonatomic) NSString *action;
@property (nonatomic) NSString *command;
@property (nonatomic) NSString *body;
@property (nonatomic) NSData *bodyData;

-(NSData *)checkPack:(NSData *)data adapterServer:(int)type;
@end
