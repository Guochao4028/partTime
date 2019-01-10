//
//  JobsModel.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Company;

NS_ASSUME_NONNULL_BEGIN

@interface JobsModel : NSObject

@property(nonatomic, strong)NSString *job_id;
@property(nonatomic, strong)NSString *job_description;
@property(nonatomic, strong)NSString *category_id;
@property(nonatomic, strong)NSString *category_name;
@property(nonatomic, strong)NSString *apply_url;
@property(nonatomic, strong)NSString *telecommuting;
@property(nonatomic, strong)NSString *url;
@property(nonatomic, strong)NSString *perks;
@property(nonatomic, strong)NSString *relocation_assistance;
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSDictionary *type_id;
@property(nonatomic, strong)NSString *type_name;
@property(nonatomic, strong)Company *company;
@property(nonatomic, strong)NSString *keywords;
@property(nonatomic, strong)NSString *howto_apply;
@property(nonatomic, strong)NSString *post_date;

@property(nonatomic, strong)NSString *location_id;
@property(nonatomic, strong)NSString *location_name;

@end

NS_ASSUME_NONNULL_END
