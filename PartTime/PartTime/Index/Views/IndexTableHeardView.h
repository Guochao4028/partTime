//
//  IndexTableHeardView.h
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexTableHeardViewDelegate <NSObject>

@optional

-(void)selectJumpPage:(NSInteger)type;
@end

@interface IndexTableHeardView : UIView

@property(nonatomic, weak)id<IndexTableHeardViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END




