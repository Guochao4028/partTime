//
//  DBManager.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject

+(instancetype)shareInstance;

-(void)savePlist:(id)model;

-(void)deleteOnce:(NSInteger)location;

-(void)deleteFileToPlist;

-(NSArray *)queryPlist;

@end

NS_ASSUME_NONNULL_END
