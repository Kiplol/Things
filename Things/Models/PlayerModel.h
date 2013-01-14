//
//  PlayerModel.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerModel : NSObject
{
    NSString * _playerID;
    NSString * _displayName;
}

@property (nonatomic, retain) NSString * displayName;
@property (nonatomic, readonly) NSString * playerID;
-(id)initWithDisplayName:(NSString*)name;
+(PlayerModel*)getMe;
+(BOOL)setMe:(PlayerModel*)me;
@end
