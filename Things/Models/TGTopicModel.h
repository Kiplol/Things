//
//  tgTopicModel.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGTopicModel : NSObject
{
    NSString * _szTopic;
    BOOL _bUsedThisRound;
}

@property (nonatomic, readonly) NSString * topic;
@property (nonatomic, readonly) BOOL usedThisRound;

-(id)initWithTopicString:(NSString*)topic;
-(void)reset;
-(void)useUp;

@end
