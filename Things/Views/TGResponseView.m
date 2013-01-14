//
//  TGResponseView.m
//  Things
//
//  Created by Elliott Kipper on 1/12/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGResponseView.h"
#import "TGResponseModel.h"

@implementation TGResponseView

-(id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 300, 100)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lblResponse = [[UILabel alloc] init];
        [self addSubview:_lblResponse];
    }
    return self;
}

-(id)initWithResponse:(TGResponseModel *)response
{
    TGResponseView * lol = [self initWithFrame:CGRectMake(0, 0, 300, 100)];
    [lol updateWithResponse:response];
    return lol;
}

-(void)updateWithResponse:(TGResponseModel *)response
{
    _szResponse = response.response;
    [self setNeedsDisplay];
}

-(void)setRevealed:(BOOL)revealed
{
    _bRevealed = revealed;
    [self setNeedsLayout];
}

-(void)setSubmitted:(BOOL)submitted
{
    _bSubmitted = submitted;
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];

    if(!_bSubmitted)
        _lblResponse.text = @"";
    else
    {
        if(_bRevealed)
        {
            _lblResponse.text = _szResponse;
        }
        else
        {
            _lblResponse.text = @"**********";
        }
    }
    [_lblResponse sizeToFit];
    _lblResponse.center = self.center;
}

@end
