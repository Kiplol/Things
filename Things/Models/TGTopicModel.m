//
//  tgTopicModel.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGTopicModel.h"

@implementation TGTopicModel
@synthesize topic = _szTopic, usedThisRound = _bUsedThisRound;

-(id)initWithTopicString:(NSString *)topic
{
    if((self = [super init]))
    {
        _szTopic = topic;
        _bUsedThisRound = NO;
    }
    return self;
}

-(void)useUp
{
    _bUsedThisRound = YES;
}

-(void)reset
{
    _bUsedThisRound = NO;
}

@end
