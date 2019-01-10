//
//  JobsModel.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "JobsModel.h"

@implementation JobsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"job_id"  : @"id",
             @"job_description" : @"description",
             @"category_id" : @"category.id",
             @"category_name" : @"category.name",
             @"type_id" : @"type.id",
             @"type_name" : @"type.name",
             @"location_id" : @"location.id",
             @"location_name" : @"location.name"
             };
}

@end
