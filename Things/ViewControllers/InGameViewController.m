//
//  InGameViewController.m
//  Things
//
//  Created by Elliott Kipper on 1/12/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "InGameViewController.h"
#import "TGRoundModel.h"
#import "TGResponseModel.h"
#import "TGResponseView.h"

@interface InGameViewController ()

@end

@implementation InGameViewController
@synthesize players = _arrPlayers, currentRound = _currentRound;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _arrPlayers = [[NSMutableArray alloc] initWithCapacity:6];
        _dicResponseViews = [[NSMutableDictionary alloc] initWithCapacity:6];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layoutResponses
{
    NSArray * responseKeys = [_currentRound.responses allKeys];
    for(NSString * key in responseKeys)
    {
        if(![_dicResponseViews objectForKey:key])
        {
            TGResponseView * rv = [[TGResponseView alloc] initWithResponse:[_currentRound.responses objectForKey:key]];
            [_dicResponseViews setObject:rv forKey:key];
        }
    }
    
    CGFloat baseY = 20.0;
    int nCount = [_dicResponseViews count];
    for(int i = 0; i < nCount; i++)
    {
        TGResponseView * rv = [_dicResponseViews objectForKey:[responseKeys objectAtIndex:i]];
        
        //test
        rv.submitted = YES;
        rv.revealed = NO;
        if(rv.superview != self.view)
        {
            [rv removeFromSuperview];
            [self.view addSubview:rv];
        }
        rv.frame = CGRectMake(rv.frame.origin.x, baseY, rv.frame.size.width, rv.frame.size.height);
        baseY += rv.frame.size.height;
    }
}

@end
