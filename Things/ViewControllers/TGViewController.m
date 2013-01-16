//
//  tgViewController.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "tgViewController.h"

@interface TGViewController ()

@end

@implementation TGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - GKMatchmakerViewControllerDelegate
- (void)matchmakerViewControllerWasCancelled:(GKMatchmakerViewController *)viewController
{
    NSLog(@"Cancelled");
}
- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFailWithError:(NSError *)error
{
    NSLog(@"Error:%@", [error description]);
}
- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFindMatch:(GKMatch *)match
{
    NSLog(@"Dope");
}
- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFindPlayers:(NSArray *)playerIDs
{
    NSLog(@"Mmhmm");
}

@end
