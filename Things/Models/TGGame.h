//
//  TGGame.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TGRoundModel;
@class PlayerModel;
@class TGGame;

@protocol TGGameDelegate <NSObject>
@optional
-(void)playerDidJoin:(PlayerModel*)player;
-(void)playerDidLeave:(PlayerModel*)player;
@end

@interface TGGame : NSObject
{
    TGRoundModel * _currentRound;
    NSMutableArray * _arrPlayers;
    int _nRoundsSoFar;
    
    NSObject<TGGameDelegate>* _delegate;
}

+(TGGame*)currentGame;
+(BOOL)setCurrentGame:(TGGame*)game;

-(id)initWithRound:(TGRoundModel*)round;
-(id)initWithRound:(TGRoundModel *)round andPlayers:(NSArray*)players;

-(void)addPlayer:(PlayerModel*)player;
-(void)removePlayer:(PlayerModel*)player;

-(void)startGame;
-(TGRoundModel*)nextRound;
@end
