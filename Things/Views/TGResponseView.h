//
//  TGResponseView.h
//  Things
//
//  Created by Elliott Kipper on 1/12/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TGResponseModel;

@interface TGResponseView : UIView {
    IBOutlet UILabel * _lblResponse;
    BOOL _bSubmitted;
    BOOL _bRevealed;
    NSString * _szResponse;
}

@property (nonatomic, readwrite) BOOL submitted;
@property (nonatomic, readwrite) BOOL revealed;

-(id)initWithResponse:(TGResponseModel*)response;
-(void)updateWithResponse:(TGResponseModel*)response;

@end
