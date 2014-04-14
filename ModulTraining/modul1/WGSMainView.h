//
//  WGSMainView.h
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGSMainView : UIViewController{
    
    IBOutlet UILabel *userNameLbl;
}


@property NSString *nama;

- (IBAction)nextModulAction:(id)sender;


@end
