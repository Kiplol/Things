//
//  TGGame.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGGame.h"
#import "TGRoundModel.h"
#import "PlayerModel.h"
#import "TGTopicModel.h"
#import "TGTopicManager.h"

static TGGame * pCurrentGame;

@implementation TGGame

+(TGGame*)currentGame
{
    @synchronized(self)
    {
        if(pCurrentGame)
            return pCurrentGame;
    }
    return nil;
}

+(BOOL)setCurrentGame:(TGGame *)game
{
    @synchronized(self)
    {
        pCurrentGame = game;
        return YES;
    }
    return NO;
}
-(id)init
{
    return [self initWithRound:nil];
}

-(id)initWithRound:(TGRoundModel *)round
{
    return [self initWithRound:round andPlayers:nil];
}

-(id)initWithRound:(TGRoundModel *)round andPlayers:(NSArray *)players
{
    if((self = [super init]))
    {
        _nRoundsSoFar = 0;
        _currentRound = round;
        _arrPlayers = [NSMutableArray arrayWithArray:players];
    }
    return self;
}

#pragma mark - Players
-(void)addPlayer:(PlayerModel *)player
{
    if(player && ![_arrPlayers containsObject:player])
    {
        [_arrPlayers addObject:player];
        _nRoundsSoFar--;
        [self nextRound];
    }
}

-(void)removePlayer:(PlayerModel *)player
{
    if(player && [_arrPlayers containsObject:player])
    {
        [_arrPlayers removeObject:player];
        _nRoundsSoFar--;
        [self nextRound];
    }
}

#pragma mark-
-(void)startGame
{
    
}
-(TGRoundModel*)nextRound
{
    [[TGTopicManager getInstance] useUpTopic:_currentRound.currentTopic];
    TGTopicModel * nextRoundsTopic = [[TGTopicManager getInstance] getRandomAvailableTopic];
    _currentRound = [[TGRoundModel alloc] initWithTopic:nextRoundsTopic andNumPlayers:_arrPlayers.count];
    
    return _currentRound;
}

@end
