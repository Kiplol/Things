//
//  TGResponseModel.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGResponseModel.h"

@implementation TGResponseModel
@synthesize response = _szResponse, playerID = _playerID;

-(id)initWithPlayerID:(NSString *)playerID
{
    if(!playerID)
    {
        NSLog(@"TGResponseModel must initialize with a playerID");
        return nil;
    }
    return [self initWithPlayerID:playerID andResponseString:nil];
}

-(id)initWithPlayerID:(NSString *)playerID andResponseString:(NSString *)response
{
    if((self = [super init]))
    {
        _playerID = playerID;
        _szResponse = response;
    }
    return self;
}

#pragma mark -
-(NSString*)description
{
    NSString * thingy = [super description];
    thingy = [NSString stringWithFormat:@"%@\n   playerID:%@", thingy, _playerID];
    thingy = [NSString stringWithFormat:@"%@\n   response:%@", thingy, _szResponse];
    return thingy;
}
@end
