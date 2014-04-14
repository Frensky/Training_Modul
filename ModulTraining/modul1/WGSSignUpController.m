//
//  WGSSignUpController.m
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import "WGSSignUpController.h"
#import "WGSDataType.h"
@interface WGSSignUpController ()

@end

@implementation WGSSignUpController

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
	
    cities = [WGSDataType getCityData];
    selectedCitties = [cities objectAtIndex:0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIPicker DataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //fungsi ini akan menentukan mau seberapa banyak kolum picker yang mau kita gunakan (disini kita menggunakan cuman 1 contoh yang lebih dari 1 itu misalnya picker tanggal/jam)
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //kita harus menentukan seberapa banyak komponen yang mau ditampilkan
    return [cities count];
}

#pragma mark UIPicker delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //ini untuk menampilkan data ke picker view
    return [cities objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //ini aksi ketika picker view kita geser nilainya
    selectedCitties = [cities objectAtIndex:row];
}

#pragma mark UITextField delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //ini untuk mengganti fokus text dari satu ke yang lain
    if([textField isEqual:usernameText]){
        [usernameText resignFirstResponder];
        [passwordText becomeFirstResponder];
    }
    else{
        [passwordText resignFirstResponder];
    }
    return YES;
}

#pragma mark IBAction method
- (IBAction)saveAction:(id)sender {
    NSString *name = usernameText.text;
    NSString *password = passwordText.text;
    int selectedGender = genderSegmenButton.selectedSegmentIndex;
    int theAge = [ageLbl.text intValue];
    
    BOOL isMale = YES;
    if(selectedGender == 1){
        isMale = NO;}
    
    WGSDataType *theType = [[WGSDataType alloc]init];
    
    [theType initAndSaveData:name withPassword:password withGender:isMale withAge:theAge withCity:selectedCitties];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ageChange:(id)sender {
    NSNumber *ageNumber = [NSNumber numberWithDouble: ageStepper.value];
    ageLbl.text =  [NSString stringWithFormat:@"%i",ageNumber.integerValue];
}

- (IBAction)cancelAction:(id)sender {
    //contoh kode untuk kembali ke view controller sebelumnya
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
