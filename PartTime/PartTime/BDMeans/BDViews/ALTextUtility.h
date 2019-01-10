//
//  ALTextUtility.h
//  iGenieHelper
//
//  Created by healex on 14-8-28.
//  Copyright (c) 2014年  machealex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ALTextUtility : NSObject

//对json数据组安全性检查
+ (NSString*)jsonStringOrBlank:(NSString*)value;

//字体相关
+ (CGFloat)getHeightWithFontSize:(CGFloat)fontSize;
+ (CGFloat)getHeight:(NSString*)text  withWidth:(CGFloat)width withFontType:(UIFont *)font;
+ (CGFloat)getWidth:(NSString*)text withFontSize:(CGFloat)fontSize;

+ (CGFloat)getWidth:(NSString*)text withFont:(UIFont *)targetFont;


//程序的document路径
+ (NSString*)documentDirectory;

//将时间转成邮票
//+ (NSString*)convertDateToStamp:(NSString*)Date;

//将16进制的字符串转成数字,字符串要是0x的开头的
+ (unsigned long)changeOxNSStringToNum:(NSString *)targetString;
//颜色转换图片
+ (UIImage*)createImageWithColor:(UIColor*)color;
//将汉字转换为拼音
+(NSString *)transform:(NSString *)chinese;

+(NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to;
//将某个时间戳转化成 时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
//两个时间的差值
+(NSString *)pleaseInsertStarTimeo:(NSString *)time1 andInsertEndTime:(NSString *)time2;
//获取当前时间
+(NSString*)getCurrentTimes;

//某个时间距现在多久
+(NSInteger)dateTimeDifferenceWithStartTime:(NSString *)startTime;
+(NSString *)dateTimeDetailWithStartTime:(NSString *)startTime;

@end
