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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startTapped:(id)sender
{
    if(_txtNameEntry.text.length < 1)
        return;
    
    PlayerModel * me = [[PlayerModel alloc] initWithDisplayName:_txtNameEntry.text];
    [PlayerModel setMe:me];
    
    InGameRespondViewController * igvc = [[InGameRespondViewController alloc] initWithNibName:@"InGameViewController" bundle:nil];
    igvc.players = [NSMutableArray arrayWithObject:me];
    igvc.currentRound = [[TGRoundModel alloc] initWithTopic:[[TGTopicManager getInstance] getRandomAvailableTopic] andNumPlayers:1];
    
    TGGame * thisGame = [[TGGame alloc] initWithRound:igvc.currentRound andPlayers:igvc.players];
    [TGGame setCurrentGame:thisGame];
    [self.navigationController pushViewController:igvc animated:YES];
}

@end
