//
//  SearchNavgationView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SearchNavgationViewDelegate <NSObject>
@optional

-(void)selectJumpPage:(NSInteger)type;
@end


@interface SearchNavgationView : UIView

@property(nonatomic, weak)id<SearchNavgationViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END

