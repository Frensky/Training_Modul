//
//  WGSLoginViewController.m
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import "WGSLoginViewController.h"
#import "WGSDataType.h"
#import "WGSMainView.h"

@interface WGSLoginViewController ()

@end

@implementation WGSLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [alertText setText:alert];
    [alertText setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier]isEqualToString:@"loginSegue"]){
    //lakukan something misalkan kita setting usernamenya..
        WGSMainView *mainView = (WGSMainView *)[segue destinationViewController];
        mainView.nama = userNameTxt.text;
    }

}

#pragma mark UITextField delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    if([textField isEqual:userNameTxt]){
        [userNameTxt resignFirstResponder];
        [userPassword becomeFirstResponder];
    }
    else{
        [userPassword resignFirstResponder];
    }
    
    
    return YES;
    
}

#pragma mark IBAction method
- (IBAction)signUpAction:(id)sender {
}

- (IBAction)loginAction:(id)sender {

    NSString *username = [userNameTxt text];
    NSString *password = [userPassword text];
    
    //menghilangkan keyboard ketika tombol login dipencet
    [userNameTxt resignFirstResponder];
    [userPassword resignFirstResponder];
    
    if([WGSDataType isUserValid:username withPassword:password]){
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
        [alertText setHidden:YES];
    }
    else{
        [alertText setHidden:NO];
    }
    
}
@end
