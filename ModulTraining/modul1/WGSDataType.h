//
//  WGSDataType.h
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import <Foundation/Foundation.h>
//define constant in ios
#define alert @"Invalid User Data!"

@interface WGSDataType : NSObject{
    int userAge;
    NSString *userGender;
    NSString *userName;
    NSString *userPasswords;
    NSString *userCity;
}

-(void)initAndSaveData:(NSString *)nama withPassword:(NSString *)pass withGender:(BOOL)isMale withAge:(int)age withCity:(NSString*)city;
-(NSDictionary *)getData;
+(BOOL)isUserValid:(NSString *)nama withPassword:(NSString *)pass;
+(NSArray *)getCityData;




@end
