//
//  WGSLoginViewController.h
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGSLoginViewController : UIViewController<UITextFieldDelegate>{

    IBOutlet UITextField *userNameTxt;
    IBOutlet UITextField *userPassword;
    IBOutlet UILabel *alertText;
}
- (IBAction)signUpAction:(id)sender;
- (IBAction)loginAction:(id)sender;

@end
