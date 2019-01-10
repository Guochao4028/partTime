//
//  UserInfo.m
//
//  Created by AYLiOS  on 2018/12/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "UserInfoModel.h"


NSString *const kUserInfoMobile = @"mobile";
NSString *const kUserInfoScore = @"score";
NSString *const kUserInfoAvatar = @"avatar";
NSString *const kUserInfoId = @"id";
NSString *const kUserInfoNickname = @"nickname";
NSString *const kUserInfoExpiretime = @"expiretime";
NSString *const kUserInfoUsername = @"username";
NSString *const kUserInfoUserId = @"user_id";
NSString *const kUserInfoToken = @"token";
NSString *const kUserInfoCreatetime = @"createtime";
NSString *const kUserInfoExpiresIn = @"expires_in";
NSString *const kUserInfoGender = @"gender";
NSString *const kUserInfoInviteCode = @"inviteCode";

@interface UserInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoModel

@synthesize mobile = _mobile;
@synthesize score = _score;
@synthesize avatar = _avatar;
@synthesize internIdent = _internIdent;
@synthesize nickname = _nickname;
@synthesize expiretime = _expiretime;
@synthesize username = _username;
@synthesize userId = _userId;
@synthesize token = _token;
@synthesize createtime = _createtime;
@synthesize expiresIn = _expiresIn;
@synthesize gender = _gender;
@synthesize inviteCode = _inviteCode;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.mobile = [self objectOrNilForKey:kUserInfoMobile fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kUserInfoScore fromDictionary:dict] doubleValue];
            self.avatar = [self objectOrNilForKey:kUserInfoAvatar fromDictionary:dict];
            self.internIdent = [[self objectOrNilForKey:kUserInfoId fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kUserInfoNickname fromDictionary:dict];
            self.expiretime = [[self objectOrNilForKey:kUserInfoExpiretime fromDictionary:dict] doubleValue];
            self.username = [self objectOrNilForKey:kUserInfoUsername fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kUserInfoUserId fromDictionary:dict] doubleValue];
            self.token = [self objectOrNilForKey:kUserInfoToken fromDictionary:dict];
            self.createtime = [[self objectOrNilForKey:kUserInfoCreatetime fromDictionary:dict] doubleValue];
            self.expiresIn = [[self objectOrNilForKey:kUserInfoExpiresIn fromDictionary:dict] doubleValue];
            self.gender = [[self objectOrNilForKey:kUserInfoGender fromDictionary:dict] doubleValue];
            self.inviteCode = [self objectOrNilForKey:kUserInfoInviteCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.mobile forKey:kUserInfoMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kUserInfoScore];
    [mutableDict setValue:self.avatar forKey:kUserInfoAvatar];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internIdent] forKey:kUserInfoId];
    [mutableDict setValue:self.nickname forKey:kUserInfoNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expiretime] forKey:kUserInfoExpiretime];
    [mutableDict setValue:self.username forKey:kUserInfoUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kUserInfoUserId];
    [mutableDict setValue:self.token forKey:kUserInfoToken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createtime] forKey:kUserInfoCreatetime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expiresIn] forKey:kUserInfoExpiresIn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kUserInfoGender];
    [mutableDict setValue:self.inviteCode forKey:kUserInfoInviteCode];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.mobile = [aDecoder decodeObjectForKey:kUserInfoMobile];
    self.score = [aDecoder decodeDoubleForKey:kUserInfoScore];
    self.avatar = [aDecoder decodeObjectForKey:kUserInfoAvatar];
    self.internIdent = [aDecoder decodeDoubleForKey:kUserInfoId];
    self.nickname = [aDecoder decodeObjectForKey:kUserInfoNickname];
    self.expiretime = [aDecoder decodeDoubleForKey:kUserInfoExpiretime];
    self.username = [aDecoder decodeObjectForKey:kUserInfoUsername];
    self.userId = [aDecoder decodeDoubleForKey:kUserInfoUserId];
    self.token = [aDecoder decodeObjectForKey:kUserInfoToken];
    self.createtime = [aDecoder decodeDoubleForKey:kUserInfoCreatetime];
    self.expiresIn = [aDecoder decodeDoubleForKey:kUserInfoExpiresIn];
    self.gender = [aDecoder decodeDoubleForKey:kUserInfoGender];
    self.inviteCode = [aDecoder decodeObjectForKey:kUserInfoInviteCode];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mobile forKey:kUserInfoMobile];
    [aCoder encodeDouble:_score forKey:kUserInfoScore];
    [aCoder encodeObject:_avatar forKey:kUserInfoAvatar];
    [aCoder encodeDouble:_internIdent forKey:kUserInfoId];
    [aCoder encodeObject:_nickname forKey:kUserInfoNickname];
    [aCoder encodeDouble:_expiretime forKey:kUserInfoExpiretime];
    [aCoder encodeObject:_username forKey:kUserInfoUsername];
    [aCoder encodeDouble:_userId forKey:kUserInfoUserId];
    [aCoder encodeObject:_token forKey:kUserInfoToken];
    [aCoder encodeDouble:_createtime forKey:kUserInfoCreatetime];
    [aCoder encodeDouble:_expiresIn forKey:kUserInfoExpiresIn];
    [aCoder encodeDouble:_gender forKey:kUserInfoGender];
    [aCoder encodeObject:_inviteCode forKey:kUserInfoInviteCode];
    
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoModel *copy = [[UserInfoModel alloc] init];
    
    if (copy) {

        copy.mobile = [self.mobile copyWithZone:zone];
        copy.score = self.score;
        copy.avatar = [self.avatar copyWithZone:zone];
        copy.internIdent = self.internIdent;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.expiretime = self.expiretime;
        copy.username = [self.username copyWithZone:zone];
        copy.userId = self.userId;
        copy.token = [self.token copyWithZone:zone];
        copy.createtime = self.createtime;
        copy.expiresIn = self.expiresIn;
        copy.gender = self.gender;
        copy.inviteCode = [self.inviteCode copyWithZone:zone];
    }
    
    return copy;
}


@end
