//
//  TGRoundModel.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGRoundModel.h"
#import "PlayerModel.h"
#import "TGResponseModel.h"

@implementation TGRoundModel
@synthesize currentTopic = _topic, delegate = _delegate, responses = _dicResponses;

-(id)init
{
    NSAssert(NO, @"MUST be initiazlied with topic and number of players");
    return nil;
}

-(id)initWithTopic:(TGTopicModel *)topic andNumPlayers:(int)players
{
    if((self = [super init]))
    {
        _topic = topic;
        _nPlayers = players;
        _dicResponses = [[NSMutableDictionary alloc] initWithCapacity:_nPlayers];
        _bRevealed = NO;
        _state = TGRoundStateSubmit;
    }
    return self;
}

-(void)setResponse:(TGResponseModel *)response forPlayer:(PlayerModel *)player
{
    [_dicResponses setObject:response forKey:player.playerID];
    
    if(_delegate && [_delegate respondsToSelector:@selector(round:didReceiveResponse:)])
        [_delegate round:self didReceiveResponse:response];
    
    if([self allResponsesSubmitted])
    {
        if(_delegate && [_delegate respondsToSelector:@selector(roundDidReceiveAllResponses:)])
            [_delegate roundDidReceiveAllResponses:self];
    }
        
}

-(BOOL)allResponsesSubmitted
{
    return ([_dicResponses count] == _nPlayers);
}

@end
