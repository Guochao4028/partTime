//
//  ListDetailsBottomView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol ListDetailsBottomViewDelegate <NSObject>
@optional

-(void)callUp;
@end

@interface ListDetailsBottomView : UIView
@property(nonatomic, weak)id<ListDetailsBottomViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
