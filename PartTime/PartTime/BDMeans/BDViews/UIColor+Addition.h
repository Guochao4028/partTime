//
//  UIColor+Addition.h
//  FanliCenter
//
//  Created by AYLiOS on 2018/11/21.
//  Copyright © 2018年 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

//设置RGB颜色
+ (UIColor *)red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
//将颜色转换成RGB
+ (NSArray *)convertColorToRGB:(UIColor *)color;
//设置十六进制颜色
+ (UIColor *)colorWithHex:(NSInteger)hex;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

- (NSString *)toHexRGB;

@end
