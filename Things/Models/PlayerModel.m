//
//  PlayerModel.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "PlayerModel.h"

@implementation PlayerModel
@synthesize displayName = _displayName, playerID = _playerID;

static PlayerModel * meModel;
-(id)initWithDisplayName:(NSString *)name
{
    if((self = [super init]))
    {
        _displayName = name;
        _playerID = [NSString stringWithFormat:@"%@_%f", name, [[NSDate date] timeIntervalSince1970]];
    }
    return self;
}

+(PlayerModel*)getMe
{
    @synchronized(self)
    {
        return meModel;
    }
    return nil;
}

+(BOOL)setMe:(PlayerModel *)me
{
    @synchronized(self)
    {
        meModel = me;
        return YES;
    }
    return NO;
}
@end
