//
//  ListNavgationView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ListNavgationViewDelegate <NSObject>
@optional

-(void)goback;
@end

@interface ListNavgationView : UIView

@property(nonatomic, strong)NSString *titleLabelStr;

@property(nonatomic, weak)id<ListNavgationViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
