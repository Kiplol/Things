//
//  InGameViewController.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "InGameViewController.h"
#import "TGRoundModel.h"

@class TGTopicModel;
@interface InGameRespondViewController : InGameViewController <TGRoundDelegate>
{
    //UI
    IBOutlet UILabel * _lblTopic;
    IBOutlet UILabel * _lblPlayerList;
    IBOutlet UITextField * _txtInput;
    IBOutlet UIButton * _btnSubmit;
}

-(IBAction)submitTapped:(id)sender;
@end
