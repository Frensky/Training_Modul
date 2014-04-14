//
//  WGSMainView.m
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import "WGSMainView.h"

@interface WGSMainView ()

@end

@implementation WGSMainView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //di sini kita set namanya ketika view baru akan meload tampilannya
    [userNameLbl setText:self.nama];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark IBAction method

- (IBAction)nextModulAction:(id)sender {
    [self performSegueWithIdentifier:@"toFoodReview" sender:self];
}
@end
