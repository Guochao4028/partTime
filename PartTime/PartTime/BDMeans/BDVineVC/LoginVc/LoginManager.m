//
//  LoginManager.m
//  FanliCenter
//
//  Created by AYLiOS on 2018/12/5.
//  Copyright © 2018年 AYLiOS. All rights reserved.
//

#import "LoginManager.h"


#define LOGINSUCCESS @"LoginSuccess"
#define USERINFOLOGIN @"userInfo"


@implementation LoginManager

static LoginManager * _sharedLogin = nil;

+ (instancetype)sharedDownloader {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLogin = [[self alloc] init];
    });
    return _sharedLogin;
}

+(BOOL)isLogin
{
    NSUserDefaults * userDefaul =[NSUserDefaults standardUserDefaults];
    NSString * loginOther =[userDefaul objectForKey:LOGINSUCCESS];
    if ([loginOther isEqualToString:@"1"]) {
        return YES;
    }else{
        return NO;
    }
}

+(void)saveLoginWithInfoUser:(UserInfoModel *)userInfo
{
    if (userInfo !=nil) {
        NSDictionary * dict =[userInfo dictionaryRepresentation];
        NSUserDefaults * userDefaul =[NSUserDefaults standardUserDefaults];
        [userDefaul setObject:dict forKey:USERINFOLOGIN];
        [userDefaul setObject:@"1" forKey:LOGINSUCCESS];
        [userDefaul synchronize];
    }
}

+(void)saveFollowWithInfoUser:(UserInfoModel *)userInfo
{
    if (userInfo !=nil) {
        NSDictionary * dict =[userInfo dictionaryRepresentation];
        NSArray * arrayItems =[[NSUserDefaults standardUserDefaults] objectForKey:@"FOLLOWARRAY"];
        NSMutableArray * arrayMost =[NSMutableArray arrayWithCapacity:0];
        if (arrayItems  != nil) {
            
            [arrayMost addObjectsFromArray:arrayItems];
            NSPredicate * predicate =[NSPredicate predicateWithFormat:@"id == %@",[dict objectForKey:@"id"]];
            NSArray * restArr=[arrayItems filteredArrayUsingPredicate:predicate];
            if (restArr.count >0) {
                [arrayMost removeObject:[restArr objectAtIndex:0]];
            }
        }
        [arrayMost addObject:dict];
        
        NSUserDefaults * userDefaul =[NSUserDefaults standardUserDefaults];
        [userDefaul setObject:arrayMost forKey:@"FOLLOWARRAY"];
        [userDefaul synchronize];
    }
}


+(NSArray *)getOnCollectionWithInfoUser
{
    NSMutableArray * arrayMost =[NSMutableArray arrayWithCapacity:0];
    NSArray * arrayItems =[[NSUserDefaults standardUserDefaults] objectForKey:@"CollectionMine"];
    if (arrayItems  != nil) {
        
        [arrayMost addObjectsFromArray:arrayItems];
    }
    return [arrayMost copy];
}

+(NSArray *)getInfoFollowWithInfoUser
{
    NSMutableArray * arrayMost =[NSMutableArray arrayWithCapacity:0];
    NSArray * arrayItems =[[NSUserDefaults standardUserDefaults] objectForKey:@"FOLLOWARRAY"];
    if (arrayItems  != nil) {
        
        [arrayMost addObjectsFromArray:arrayItems];
    }
    return [arrayMost copy];
}
+(BOOL)isInfoUserFollow:(UserInfoModel *)userInfo
{
    NSDictionary * dict =[userInfo dictionaryRepresentation];
    NSArray * arrayItems =[[NSUserDefaults standardUserDefaults] objectForKey:@"FOLLOWARRAY"];
    if (arrayItems  != nil) {
       
        NSPredicate * predicate =[NSPredicate predicateWithFormat:@"id == %@",[dict objectForKey:@"id"]];
        NSArray * restArr=[arrayItems filteredArrayUsingPredicate:predicate];
        if (restArr.count >0) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}


+(UserInfoModel *)getLoginUserInfo
{
    BOOL islogin =[LoginManager isLogin];
    if (islogin) {
        NSUserDefaults * userDefaul =[NSUserDefaults standardUserDefaults];
        NSDictionary * dict =[userDefaul objectForKey:USERINFOLOGIN];
        UserInfoModel * user =[UserInfoModel modelObjectWithDictionary:dict];
        return user;
    }else{
        return nil;
    }
}

+(BOOL)LoginOutInfo
{
    NSUserDefaults * userDefaul =[NSUserDefaults standardUserDefaults];
    [userDefaul setObject:@"0" forKey:LOGINSUCCESS];
    [userDefaul synchronize];
    return YES;
}
-(instancetype)init
{
    self=[super init];
    if (self){
    
    }
    return self;
}






@end
