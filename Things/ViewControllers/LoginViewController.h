//
//  LoginViewController.h
//  Things
//
//  Created by Elliott Kipper on 1/11/13.
//  Copyright (c) 2013 Elliott Kipper. All rights reserved.
//

#import "TGViewController.h"

@interface LoginViewController : TGViewController
{
    IBOutlet UIImageView * _imgLogo;
    IBOutlet UITextField * _txtNameEntry;
    IBOutlet UIButton * _btnStart;
}

-(IBAction)startTapped:(id)sender;

@end
