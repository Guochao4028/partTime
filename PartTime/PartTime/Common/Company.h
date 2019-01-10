//
//  Company.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Company : NSObject

@property(nonatomic, strong)NSString *locationId;
@property(nonatomic, strong)NSString *location_city;
@property(nonatomic, strong)NSString *location_country;
@property(nonatomic, strong)NSString *location_lat;
@property(nonatomic, strong)NSString *location_lng;
@property(nonatomic, strong)NSString *location_name;
@property(nonatomic, strong)NSString *location_state;
@property(nonatomic, strong)NSString *logo;
@property(nonatomic, strong)NSString *companyId;
@property(nonatomic, strong)NSString *tagline;
@property(nonatomic, strong)NSString *type;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *url;

@end

NS_ASSUME_NONNULL_END

