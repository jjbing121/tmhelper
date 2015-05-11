//
//  HttpPack.m
//  Mibang3
//
//  Created by admin on 14/12/29.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import "HttpPack.h"
#import "GZIP.h"

@implementation HttpPack
- (instancetype)init
{
    self = [super init];
    if (self) {
        _packStatus = NO;           // 打包状态
        _isEncrypted = NO;          // 是否加密
        _packLength = 0;            // 包体长度
        _action = @"";              // 指定动作     (type == 1)
        _command = @"";             // 指定指令集合  (type == 1)
        _body = [NSString new];     // 包体实际内容
        _bodyData = [NSData new];   // 包体的2进制内容
    }
    return self;
}

-(NSData *)checkPack:(NSData *)data adapterServer:(int)type{
    NSData *newData = [NSData new];
    if (data == nil) {
        return newData;
    }
    
    // TODO: - 适配自编写服务端 <项目: zFramework>
    if (type == 0) {
        _packStatus = YES;
        _bodyData = data;
        _body = [[NSString alloc]initWithData:_bodyData encoding:NSUTF8StringEncoding];
        newData = [data subdataWithRange:NSMakeRange(0, data.length)];
    }
    // TODO: - 适配php服务端 <项目: 米帮3>
    else if (type == 1) {
        int little;
        [data getBytes:&little length:sizeof(little)];
        int big = NSSwapHostIntToBig(little);
        
        int len = *(int *)(&big);
        if( len & 0x80000000)
        {
            len  &= 0x7fffffff;
            // 压缩的
            _packStatus = YES;
            _isEncrypted = YES;
            _packLength = len;
        } else {
            //未压缩
            _packStatus = YES;
            _isEncrypted = NO;
            _packLength = len;
        }
        
        NSLog(@"packStatus:%@ isEncrypted:%@ packLength:%i dataStr:%@",_packStatus ? @"YES" : @"NO",_isEncrypted ? @"YES" : @"NO",_packLength,[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding]);
        
        NSData *actionData = [data subdataWithRange:NSMakeRange(4, 1)];
        NSString *action = [[NSString alloc]initWithData:actionData encoding:NSUTF8StringEncoding];
        _action = [NSString stringWithFormat:@"%i",[action characterAtIndex:0]];
        
        NSData *commandData = [data subdataWithRange:NSMakeRange(5, 1)];
        NSString *command = [[NSString alloc]initWithData:commandData encoding:NSUTF8StringEncoding];
        _command = [NSString stringWithFormat:@"%i",[command characterAtIndex:0]];
        
        _bodyData = [data subdataWithRange:NSMakeRange(6, _packLength-6)];
        if (_isEncrypted) {
            NSData *unzipBodyData =_bodyData.gunzippedData;
            if (unzipBodyData.length > 0) {
                _body = [[NSString alloc]initWithData:unzipBodyData encoding:NSUTF8StringEncoding];
                _bodyData = unzipBodyData;
                //NSLog(@"unzipBody:%@",_body);
            }
        } else {
            _body = [[NSString alloc]initWithData:_bodyData encoding:NSUTF8StringEncoding];
        }
        if (data.length > _packLength) {
            NSLog(@"有多个包");
            newData = [data subdataWithRange:NSMakeRange(_packLength, data.length - _packLength)];
        }

    }
    return newData;
}
@end
