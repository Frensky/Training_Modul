//
//  WGSDataType.m
//  ModulTraining
//
//  Created by FrenskyMacs on 4/11/14.
//  Copyright (c) 2014 wgs. All rights reserved.
//

#import "WGSDataType.h"

@implementation WGSDataType


#pragma mark function method
-(void)initAndSaveData:(NSString *)nama withPassword:(NSString *)pass withGender:(BOOL)isMale withAge:(int)age withCity:(NSString*)city{

    /*
     int = 0,1,2,3,........
     NSString = a,b,c,........
     BOOL = YES,NO
     long = 0.0001,0.0002,......
     
     NSDictionary -> sistemnya seperti Hash Key pada Collection
     NSMutableDictionary -> seperti NSDictionary namun value pada keynya bisa dirubah rubah...
     NSArray -> array yang fix jumlah datanya...
     NSMutableArray -> array yang jumlahnya bisa mengembang sifatnya seperti collection list
     */
    
    
    //definisi variabel tipe data
    userName = nama;
    userPasswords = pass;
    userAge = age;
    userCity = city;
    
    //penggunaan if
    if(isMale){
        userGender = @"Male";
    }
    else{
        userGender = @"Female";
    }

    [self saveData];

}

+(BOOL)isUserValid:(NSString *)nama withPassword:(NSString *)pass{
    
    //penggunaan if
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *Usernames = [defaults objectForKey:@"UserName"];
    NSString *UserPass = [defaults objectForKey:@"UserPassword"];

    if(Usernames == nil || UserPass == nil){
        return NO;
    }
    else if([Usernames isEqualToString:nama] && [UserPass isEqualToString:pass]){
        return YES;
    }
    else{
        return NO;
    }
}

+(NSArray *)getCityData{
    
    //penggunaan mutable array switch dan for
    
    NSMutableArray *theCountries = [[NSMutableArray alloc]init];
    
    for(int i=0 ; i<5 ; i++){
        
        switch(i){
            case 0  :
                [theCountries addObject:@"Jakarta"];
                break;
            case 1 :
                [theCountries addObject:@"Bogor"];
                break;
            case 2 :
                [theCountries addObject:@"Bandung"];
                break;
            case 3 :
                [theCountries addObject:@"Banten"];
                break;
            default :
                [theCountries addObject:@"Bali"];
                break;
        }
    }
    
    /*kalau mau pakai while kaya gini
    int i = 0;
    while(i<5){
        switch(i){
            case 0  :
                [theCountries addObject:@"Jakarta"];
                break;
            case 1 :
                [theCountries addObject:@"Bogor"];
                break;
            case 2 :
                [theCountries addObject:@"Bandung"];
                break;
            case 3 :
                [theCountries addObject:@"Banten"];
                break;
            default :
                [theCountries addObject:@"Bali"];
                break;
        }
        i++;
    }
    */
 
    //cara gunain for each di ios contohnya disini untuk memprint nilai cities satu persatu
    for(NSString *data in theCountries){
        NSLog(@"%@",data);
    }
    
    NSArray *countries = [NSArray arrayWithArray:theCountries];
    return countries;
    
}

-(NSDictionary *)getData{
    //cara meload data cookies di ios
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    userName = [defaults objectForKey:@"UserName"];
    userPasswords = [defaults objectForKey:@"UserPassword"];
    userAge = [[defaults objectForKey:@"UserAge"] integerValue];
    userGender = [defaults objectForKey:@"UserGender"];
    userCity = [defaults objectForKey:@"UserCity"];

    //cara membuat NSDictionary melalui NSDictyionary kita bisa membuat tipe objek apapun dengan fleksibel...selama kita tau key key apa saja yang dibutuhkan...
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:userName,userPasswords,userAge,userGender,userCity,nil] forKeys:[NSArray arrayWithObjects:@"UserName",@"UserPassword",@"UserAge",@"UserGender",@"UserCity",nil]];
    
    return dict;
}

#pragma mark local method
-(void)saveData{
    //cara mensave data cookies di ios
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:@"UserName"];
    [defaults setObject:userPasswords forKey:@"UserPassword"];
    [defaults setObject:[NSString stringWithFormat:@"%i",userAge] forKey:@"UserAge"];
    [defaults setObject:userGender forKey:@"UserGender"];
    [defaults setObject:userCity forKey:@"UserCity"];
    [defaults synchronize];
}


@end
