//
//  WGSFoodListController.m
//  ModulTraining
//
//  Created by FrenskyMacs on 4/14/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import "WGSFoodListController.h"

@interface WGSFoodListController ()

@end

@implementation WGSFoodListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    foodListData = [[NSMutableArray alloc]init];

    [super viewDidLoad];

    [self getFoodData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //ini untuk menentukan jumlah grup data yang ingin ditampilkan
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // menentukan jumlah baris dari tiap grup data
    // Return the number of rows in the section.
    return [foodListData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //menentukan isi tiap cellnya mau kaya gimana
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *theData = [foodListData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [theData objectForKey:@"title"];
    return cell;
}



#pragma mark local method
-(void)getFoodData{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"foodData" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *foodTitle = [dict objectForKey:@"FoodTitle"];
    NSArray *foodLocation = [dict objectForKey:@"FoodLocation"];
    NSArray *foodComentar = [dict objectForKey:@"FoodComentar"];
    NSArray *foodType = [dict objectForKey:@"FoodType"];
    NSArray *foodPics = [dict objectForKey:@"FoodPicture"];
    
    for(int i=0;i<foodTitle.count;i++){
        NSString *titles = [foodTitle objectAtIndex:i];
        NSString *loc = [foodLocation objectAtIndex:i];
        NSString *comments = [foodComentar objectAtIndex:i];
        NSString *type = [foodType objectAtIndex:i];
        NSString *picture = [foodPics objectAtIndex:i];
        
        NSDictionary *theData = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:titles,loc,comments,type,picture,nil] forKeys:[NSArray arrayWithObjects:@"title",@"location",@"comment",@"type",@"picture",nil]];
        
        [foodListData addObject:theData];
        
    }
    

}

#pragma mark IBAction Method
- (IBAction)AddAction:(id)sender {
}
@end
