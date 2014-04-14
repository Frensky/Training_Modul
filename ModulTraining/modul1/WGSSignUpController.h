//
//  WGSSignUpController.h
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGSSignUpController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>{

    IBOutlet UITextField *usernameText;

    IBOutlet UITextField *passwordText;
    IBOutlet UISegmentedControl *genderSegmenButton;
    IBOutlet UIStepper *ageStepper;
   
    IBOutlet UILabel *ageLbl;
    IBOutlet UIPickerView *cityPicker;
    
    NSArray *cities;
    NSString *selectedCitties;
}

- (IBAction)saveAction:(id)sender;
- (IBAction)ageChange:(id)sender;

- (IBAction)cancelAction:(id)sender;

@end
