//
//  tgTopicManager.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TGTopicModel.h"

@interface TGTopicManager : NSObject
{
    NSMutableArray * _arrUsedTopics;
    NSMutableArray * _arrAvailableTopics;
}

+(TGTopicManager*)getInstance;

-(BOOL)loadTopics;
-(BOOL)saveTopics;

-(TGTopicModel*)getRandomAvailableTopic;
-(void)resetAllTopics;
-(void)useUpTopic:(TGTopicModel*)topic;

@end
