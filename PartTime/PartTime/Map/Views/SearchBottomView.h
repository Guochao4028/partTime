//
//  SearchBottomView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol SearchBottomViewDelegate <NSObject>
@optional

-(void)selectDone;
@end

@interface SearchBottomView : UIView

@property(nonatomic, weak)id<SearchBottomViewDelegate>delegate;

@property(nonatomic, strong)NSString *numberJob;

@end

NS_ASSUME_NONNULL_END
