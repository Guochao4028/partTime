//
//  HistroyTableViewCell.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JobsModel;

@protocol HistroyTableViewCellDelegate <NSObject>
@optional

-(void)deleteCell:(NSIndexPath *)indexPath;

@end

@interface HistroyTableViewCell : UITableViewCell

@property(nonatomic, strong)JobsModel *model;

@property(nonatomic, strong)NSIndexPath *indexPath;

@property(nonatomic, weak)id<HistroyTableViewCellDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
