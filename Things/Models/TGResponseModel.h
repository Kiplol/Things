//
//  TGResponseModel.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGResponseModel : NSObject
{
    NSString * _szResponse;
    NSString * _playerID;
}

@property (nonatomic, retain) NSString * response;
@property (nonatomic, readonly) NSString * playerID;

-(id)initWithPlayerID:(NSString*)playerID;
-(id)initWithPlayerID:(NSString*)playerID andResponseString:(NSString*)response;
@end
