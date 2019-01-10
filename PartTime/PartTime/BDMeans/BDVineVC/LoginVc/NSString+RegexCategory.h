//
//  NSString+RegexCategory.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RegexCategory)
//自定义正则内容对比
- (BOOL)isValidateByRegex:(NSString *)regex;
//手机号分服务商
- (BOOL)isMobileNumberClassification;
//手机号
- (BOOL)isMobileNumber;
//邮箱
- (BOOL)isEmailAddress;
//身份证号
- (BOOL) simpleVerifyIdentityCardNum;
//车牌
- (BOOL)isCarNumber;
//mac地址
- (BOOL)isMacAddress;
//网址
- (BOOL)isValidUrl;
//是否是中文
- (BOOL)isValidChinese;
//邮政编码
- (BOOL)isValidPostalcode;
//税号
- (BOOL)isValidTaxNo;
//字符串长度
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;
//字符串长度
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

//精确的身份证号码有效性检测
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;
//银行卡号有效性
- (BOOL)bankCardluhmCheck;
//IP地址
- (BOOL)isIPAddress;

@end

NS_ASSUME_NONNULL_END
