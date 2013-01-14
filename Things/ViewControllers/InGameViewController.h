//
//  InGameViewController.h
//  Things
//
//  Created by Elliott Kipper on 1/12/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGViewController.h"
@class TGRoundModel;

@interface InGameViewController : TGViewController {
    NSMutableArray * _arrPlayers;
    TGRoundModel * _currentRound;
    
    NSMutableDictionary * _dicResponseViews;
}
@property (nonatomic, retain) TGRoundModel * currentRound;
@property (nonatomic, retain) NSMutableArray * players;

-(void)layoutResponses;
@end
