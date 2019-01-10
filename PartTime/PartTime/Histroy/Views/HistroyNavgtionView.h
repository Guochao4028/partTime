//
//  HistroyNavgtionView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HistroyNavgtionViewDelegate <NSObject>
@optional

-(void)goback;

-(void)clearedAction;

@end

@interface HistroyNavgtionView : UIView

@property(nonatomic, weak)id<HistroyNavgtionViewDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
