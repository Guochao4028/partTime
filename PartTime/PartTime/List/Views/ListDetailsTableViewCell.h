//
//  ListDetailsTableViewCell.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JobsModel;
NS_ASSUME_NONNULL_BEGIN

@interface ListDetailsTableViewCell : UITableViewCell
@property(nonatomic, strong)JobsModel *model;
@end

NS_ASSUME_NONNULL_END
