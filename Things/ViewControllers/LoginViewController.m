//
//  LoginViewController.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "LoginViewController.h"

#import "TGTopicManager.h"
#import "TGRoundModel.h"
#import "PlayerModel.h"
#import "InGameRespondViewController.h"
#import "TGGame.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    GKMatchRequest *request = [[GKMatchRequest alloc] init];
    request.minPlayers = 2;
    request.maxPlayers = 2;
    
    GKMatchmakerViewController *mmvc = [[GKMatchmakerViewController alloc] initWithMatchRequest:request];
    mmvc.matchmakerDelegate = self;
    
    [self presentViewController:mmvc animated:YES completion:nil];
}

#pragma mark - 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

-(IBAction)startTapped:(id)sender
{
    if(_txtNameEntry.text.length < 1)
        return;
    
    PlayerModel * me = [[PlayerModel alloc] initWithDisplayName:_txtNameEntry.text];
    [PlayerModel setMe:me];
    
    InGameRespondViewController * igvc = [[InGameRespondViewController alloc] initWithNibName:@"InGameRespondViewController" bundle:nil];
    igvc.players = [NSMutableArray arrayWithObject:me];
    igvc.currentRound = [[TGRoundModel alloc] initWithTopic:[[TGTopicManager getInstance] getRandomAvailableTopic] andNumPlayers:1];
    
    TGGame * thisGame = [[TGGame alloc] initWithRound:igvc.currentRound andPlayers:igvc.players];
    [TGGame setCurrentGame:thisGame];
    [self.navigationController pushViewController:igvc animated:YES];
}

@end
