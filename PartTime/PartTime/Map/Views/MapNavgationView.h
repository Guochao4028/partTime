//
//  MapNavgationView.h
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MapNavgationViewDelegate <NSObject>
@optional

-(void)selectJumpPage:(NSInteger)type;
@end

@interface MapNavgationView : UIView

@property(nonatomic, weak)id<MapNavgationViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
