//
//  UserInfo.h
//
//  Created by AYLiOS  on 2018/12/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *token;

@property (nonatomic, strong) id inviteCode;

@property (nonatomic, assign) double score;
@property (nonatomic, assign) double internIdent;
@property (nonatomic, assign) double expiretime;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createtime;
@property (nonatomic, assign) double expiresIn;
@property (nonatomic, assign) double gender;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
