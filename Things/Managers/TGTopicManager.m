//
//  tgTopicManager.m
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGTopicManager.h"

static TGTopicManager * pInstance;

@implementation TGTopicManager
+(TGTopicManager*)getInstance
{
    @synchronized(self)
    {
        if(!pInstance)
        {
            pInstance = [[TGTopicManager alloc] init];
        }
        return pInstance;
    }
    return nil;
}

#pragma mark -
-(id)init
{
    if((self = [super init]))
    {
        _arrAvailableTopics = [[NSMutableArray alloc] initWithCapacity:50];
        _arrUsedTopics = [[NSMutableArray alloc] initWithCapacity:50];
        [self loadTopics];
    }
    return self;
}

-(BOOL)loadTopics
{
    [_arrAvailableTopics removeAllObjects];
    [_arrUsedTopics removeAllObjects];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"topics" ofType:@"plist"];
    NSArray * topicStrings = [NSArray arrayWithContentsOfFile:path];
    int nStrings = [topicStrings count];
    if(nStrings < 1)
        return NO;
    for(int i = 0; i < nStrings; i++)
    {
        NSString * str = [topicStrings objectAtIndex:i];
        TGTopicModel * tm = [[TGTopicModel alloc] initWithTopicString:str];
        [_arrAvailableTopics addObject:tm];
    }
    return YES;
}

-(BOOL)saveTopics
{
    return NO;
}

-(TGTopicModel*)getRandomAvailableTopic
{
    if(_arrAvailableTopics.count < 1)
        return nil;
    
    int idx = random() % _arrAvailableTopics.count;
    return [_arrAvailableTopics objectAtIndex:idx];
}

-(void)useUpTopic:(TGTopicModel *)topic
{
    if([_arrAvailableTopics containsObject:topic])
    {
        [_arrAvailableTopics removeObject:topic];
        [_arrUsedTopics addObject:topic];
    }
}

-(void)resetAllTopics
{
    for(TGTopicModel * tm in _arrUsedTopics)
    {
        [_arrAvailableTopics addObject:tm];
        [tm reset];
    }
    [_arrUsedTopics removeAllObjects];
}
@end
