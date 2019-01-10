//
//  ListDetailsViewController.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsModel;

@interface ListDetailsViewController : BaseViewController

@property(nonatomic, strong)JobsModel *model;

@end

NS_ASSUME_NONNULL_END
