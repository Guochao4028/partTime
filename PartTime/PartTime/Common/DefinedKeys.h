//
//  DefinedKeys.h
//  AYLWeather
//
//  Created by AYLiOS on 2018/11/28.
//  Copyright © 2018年 AYLiOS. All rights reserved.
//

#ifndef DefinedKeys_h
#define DefinedKeys_h

#define StatusBarHeight   [[UIApplication sharedApplication] statusBarFrame].size.height

#define NavigatorHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64)

#define ScreenWidth    [[UIScreen mainScreen]bounds].size.width

#define ScreenHeight   [[UIScreen mainScreen]bounds].size.height

#define NAVIBAR_Space  (NavHeight - 64.f)
//自定义颜色
#define COMMONCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1];

#define SafeAreaBottomHeight (StatusBarHeight > 20 ? 34 : 0)

#define TabBarHeight 49.0

#define AdjustsScrollViewInsetNever(controller, view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

#define UITableViewEstimatedHeight(tableView) \
if (@available(iOS 11.0, *)) { \
tableView.estimatedRowHeight = 0; \
tableView.estimatedSectionHeaderHeight = 0; \
tableView.estimatedSectionFooterHeight = 0; \
}


//测试的时候打印语句，发布程序的时候自动去除打印语句
#ifdef DEBUG
#define GCLog(FORMAT, ...) fprintf(stderr,"错误日志methodName:%s  lineNumbers:%d\n~~~~~~>: %s\n", __func__,__LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#endif

#endif /* DefinedKeys_h */
