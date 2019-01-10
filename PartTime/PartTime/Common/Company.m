//
//  Company.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "Company.h"

@implementation Company

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"companyId"  : @"id",
             @"locationId" : @"location.id",
             @"location_city" : @"location.city",
             @"location_country" : @"location.country",
             @"location_lat" : @"location.lat",
             @"location_lng" : @"location.lng",
             @"location_name" : @"location.name",
             @"location_state" : @"location.state"
             };
}

@end
