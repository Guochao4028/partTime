//
//  SearchHomeCell.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SearchHomeCellDelegate <NSObject>
@optional
-(void)random;
@end

@interface SearchHomeCell : UITableViewCell
@property(nonatomic, weak)id<SearchHomeCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
