//
//  InGameViewController.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "InGameRespondViewController.h"
#import "InGameGuessViewController.h"
#import "TGRoundModel.h"
#import "TGTopicModel.h"
#import "TGResponseModel.h"
#import "PlayerModel.h"
#import "TGGame.h"

@interface InGameRespondViewController ()

@end

@implementation InGameRespondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _lblTopic.text = _currentRound.currentTopic.topic;
    
    NSString * szPlayers = @"";
    for(PlayerModel * p in _arrPlayers)
    {
        szPlayers = [NSString stringWithFormat:@"%@, %@", szPlayers, p.displayName];
    }
    _lblPlayerList.text = szPlayers;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Accessors
-(void)setCurrentRound:(TGRoundModel *)currentRound
{
    if(_currentRound)
    {
        _currentRound.delegate = nil;
        _currentRound = nil;
    }
    if(currentRound)
    {
        _currentRound = currentRound;
        _currentRound.delegate = self;
    }
}

#pragma mark -
-(IBAction)submitTapped:(id)sender
{
    NSString * text = _txtInput.text;
    if(text.length < 1)
        return;
    
    TGResponseModel * myResponse = [[TGResponseModel alloc] initWithPlayerID:[PlayerModel getMe].playerID andResponseString:text];
    [_currentRound setResponse:myResponse forPlayer:[PlayerModel getMe]];
}

#pragma mark - TGRoundDelegate
-(void)round:(TGRoundModel *)round didReceiveResponse:(TGResponseModel *)response
{
    [self layoutResponses];
}

-(void)roundDidReceiveAllResponses:(TGRoundModel *)round
{
    return;
    
    InGameGuessViewController * guessVC = [[InGameGuessViewController alloc] init];
    _currentRound.state = TGRoundStateGuess;
    guessVC.currentRound = _currentRound;
    guessVC.players = _arrPlayers;
    [self.navigationController pushViewController:guessVC animated:YES];
}
@end
