//
//  BDCustomNavtionInView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BDCustomNavtionInView : UIView

@property(nonatomic,strong)UIImageView * navBackVi;
@property(nonatomic,strong)UIButton * leftBtn;
@property(nonatomic,strong)UIButton * rightBtn;
@property(nonatomic,strong)UILabel * titleLable;
@property(nonatomic,strong)UIView * lineView;

@property(nonatomic,strong)void(^btnClickBackIndex)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
