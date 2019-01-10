//
//  MineHeaderView.h
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/19.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineHeaderView : UIView
@property (strong, nonatomic)  UIView * backView;
@property (strong, nonatomic)  UIImageView * imageBackView;
@property (strong, nonatomic)  UIVisualEffectView *effectView;
@property (strong, nonatomic)  UIImageView * imageIconVi;
@property (strong, nonatomic)  UILabel * titleOLabel;
@property (strong, nonatomic)  UIImageView * moreImgVi;
@property (strong, nonatomic)  UILabel * labelIdStr;

@property (strong, nonatomic) void(^headerImageClick)(void);

-(void)configWithMineData:(id)dataItem;


@end

NS_ASSUME_NONNULL_END
