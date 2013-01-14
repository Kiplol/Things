//
//  TGRoundModel.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TGTopicModel;
@class TGResponseModel;
@class PlayerModel;
@class TGRoundModel;

@protocol TGRoundDelegate <NSObject>
-(void)round:(TGRoundModel*)round didReceiveResponse:(TGResponseModel*)response;
-(void)roundDidReceiveAllResponses:(TGRoundModel*)round;
@end

typedef enum {TGRoundStateSubmit = 0, TGRoundStateGuess} TGRoundState;
@interface TGRoundModel : NSObject
{
    int _nPlayers;
    TGTopicModel * _topic;
    NSMutableDictionary * _dicResponses;
    BOOL _bRevealed;
    TGRoundState _state;
    
    id<TGRoundDelegate> __unsafe_unretained _delegate;
}

@property (nonatomic, readonly) NSDictionary * responses;
@property (nonatomic, readonly) TGTopicModel * currentTopic;
@property (nonatomic, readonly) BOOL allResponsesSubmitted;
@property (nonatomic, assign) id<TGRoundDelegate> delegate;
@property (nonatomic, readwrite) TGRoundState state;

-(id)initWithTopic:(TGTopicModel*)topic andNumPlayers:(int)players;
-(void)setResponse:(TGResponseModel*)response forPlayer:(PlayerModel*)player;
@end