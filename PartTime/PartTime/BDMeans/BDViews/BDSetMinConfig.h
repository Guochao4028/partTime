//
//  BDSetMinConfig.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#ifndef BDSetMinConfig_h
#define BDSetMinConfig_h

#import "UIColor+Addition.h"
#import "ALTextUtility.h"


#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kScreenHeight (kDevice_Is_iPhoneX ? ([[UIScreen mainScreen] bounds].size.height - 34.0):([[UIScreen mainScreen] bounds].size.height))

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define STATUSHEIGHT  CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)



#endif /* BDSetMinConfig_h */
