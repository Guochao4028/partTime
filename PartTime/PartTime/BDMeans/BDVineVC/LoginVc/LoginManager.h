//
//  LoginManager.h
//  FanliCenter
//
//  Created by AYLiOS on 2018/12/5.
//  Copyright © 2018年 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface LoginManager : NSObject

+(BOOL)isLogin;
+(void)saveLoginWithInfoUser:(UserInfoModel *)userInfo;
+(void)saveFollowWithInfoUser:(UserInfoModel *)userInfo;
+(NSArray *)getInfoFollowWithInfoUser;

+(BOOL)isInfoUserFollow:(UserInfoModel *)userInfo;

+(NSArray *)getOnCollectionWithInfoUser;

+(UserInfoModel *)getLoginUserInfo;
+(BOOL)LoginOutInfo;

@end
