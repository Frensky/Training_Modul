//
//  WGSFoodListController.h
//  ModulTraining
//
//  Created by FrenskyMacs on 4/14/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGSFoodListController : UITableViewController{

    NSMutableArray *foodListData;
    
}

-(void)getFoodData;

- (IBAction)AddAction:(id)sender;

@end
