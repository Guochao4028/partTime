//
//  ALTextUtility.m
//
//  Created by healex on 14-8-28.
//  Copyright (c) 2014年  machealex. All rights reserved.
//



#import "ALTextUtility.h"

@implementation ALTextUtility

#ifdef __IPHONE_6_0
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
#else
# define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
#endif


+ (NSString*)jsonStringOrBlank:(NSString*)value
{
    return (value == nil || value == (NSString*)[NSNull null]) ? @"" : value;
}


+ (CGFloat) getHeightWithFontSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize].lineHeight;
}

+ (CGFloat) getHeight:(NSString*)text withWidth:(CGFloat)width withFontType:(UIFont *)font
{
    NSDictionary * arrtib=@{NSFontAttributeName : font};
    CGFloat height=[text boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:arrtib context:nil].size.height;
    
    return height;
}

+ (CGFloat) getWidth:(NSString*)text withFontSize:(CGFloat)fontSize
{
    UIFont * font=[UIFont systemFontOfSize:fontSize];
    NSDictionary * arrtib=@{NSFontAttributeName : font};
    
    CGFloat width=[text sizeWithAttributes:arrtib].width;
    return width;
}

+ (CGFloat)getWidth:(NSString*)text withFont:(UIFont *)targetFont
{
    NSDictionary * arrtib=@{NSFontAttributeName : targetFont};
    CGFloat width=[text sizeWithAttributes:arrtib].width;
    return width;
    
}

+ (NSString*)documentDirectory
{
    NSArray* paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* document = [paths objectAtIndex:0];
    return document;
}

+ (unsigned long)changeOxNSStringToNum:(NSString *)targetString {
    
    //先以16为参数告诉strtoul字符串参数表示16进制数字，然后使用0x%X转为数字类型
    //    unsigned long red = strtoul([gadgetClassId UTF8String],0,16);
    
    unsigned long num = strtoul([targetString UTF8String],0,0);
    //    YFLog(@"转换完的数字为：%lx",num);
    return num;
    
}
#pragma mark 颜色转换成image
+ (UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f,0.0f,1.0,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context,rect);
    
    UIImage * theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark 将汉字转换为拼音
+(NSString *)transform:(NSString *)chinese
{
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [chinese mutableCopy];
    
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //    NSLog(@"%@", pinyin);
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //    NSLog(@"%@", pinyin);
    
    //返回最近结果
    return pinyin;
    
}
#pragma mark 随机数
+(NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to
{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}
#pragma mark - 将某个时间戳转化成 时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}
#pragma mark 两个时间的差值
+(NSString *)pleaseInsertStarTimeo:(NSString *)time1 andInsertEndTime:(NSString *)time2
{
    // 1.将时间转换为date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-ddHH:mm:ss";
    NSDate *date1 = [formatter dateFromString:time1];
    NSDate *date2 = [formatter dateFromString:time2];
    // 2.创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 3.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:date1 toDate:date2 options:0];
    // 4.输出结果 两个时间相差%02ld时%02ld分%02ld秒
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",cmps.hour,cmps.minute,cmps.second];
    
}
#pragma mark 获取当前时间
+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}

+(NSInteger)dateTimeDifferenceWithStartTime:(NSString *)startTime

{
    
    NSDate *now = [NSDate date];
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate *startDate =[formatter dateFromString:startTime];
    
    
    
    NSString *nowstr = [formatter stringFromDate:now];
    
    NSDate *nowDate = [formatter dateFromString:nowstr];
    
    
    
    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
    
    NSTimeInterval end = [nowDate timeIntervalSince1970]*1;
    
    NSTimeInterval value = end - start;
    
    
    int second = (int)value %60;//秒
    
    int minute = (int)value /60%60;
    
    int house = (int)value / (24 * 3600)%3600;
    
    int day = (int)value / (24 * 3600);
    
    NSString *str;
    
    NSInteger time;//剩余时间为多少分钟
    
    if (day != 0) {
        
        str = [NSString stringWithFormat:@"%d天%d小时%d分%d秒",day,house,minute,second];
        
        time = day*24*60+house*60+minute;
        
    }else if (day==0 && house != 0) {
        
        str = [NSString stringWithFormat:@"%d小时%d分%d秒",house,minute,second];
        
        time = house*60+minute;
        
    }else if (day==0 && house == 0 && minute !=0){
        
        str = [NSString stringWithFormat:@"%d分%d秒",minute,second];
        
        time = minute;
        
    }else{
        
        str = [NSString stringWithFormat:@"%d秒",second];
        
        time = second;
        
    }
    
    return time;
    
}
+(NSString *)dateTimeDetailWithStartTime:(NSString *)startTime
{
    NSDate *now = [NSDate date];
    

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *startDate =[formatter dateFromString:startTime];
    
    
    
    NSString *nowstr = [formatter stringFromDate:now];
    
    NSDate *nowDate = [formatter dateFromString:nowstr];
    
    
    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
    
    NSTimeInterval end = [nowDate timeIntervalSince1970]*1;
    
    NSTimeInterval value = end - start;
    
    int second = (int)value %60;//秒
    
    int minute = (int)value /60%60;
    
    int house = (int)value / (24 * 3600)%3600;
    
    int day = (int)value / (24 * 3600);
    
    NSString *str;
    
    NSInteger time;//剩余时间为多少分钟
    
    if (day != 0) {
        
        str = [NSString stringWithFormat:@"%d天%d小时%d分%d秒",day,house,minute,second];
        
        time = day*24*60+house*60+minute;
        
    }else if (day==0 && house != 0) {
        
        str = [NSString stringWithFormat:@"%d小时%d分%d秒",house,minute,second];
        
        time = house*60+minute;
        
    }else if (day==0 && house == 0 && minute !=0){
        
        str = [NSString stringWithFormat:@"%d分%d秒",minute,second];
        
        time = minute;
        
    }else{
        
        str = [NSString stringWithFormat:@"%d秒",second];
        
        time = second;
        
    }
    return str;
}

@end
