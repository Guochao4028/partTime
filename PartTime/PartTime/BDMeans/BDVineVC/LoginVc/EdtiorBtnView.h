//
//  EdtiorBtnView.h
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EdtiorBtnView : UIView

@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * secondLabel;
@property(nonatomic,strong)UIButton * benginBtn;
@property(nonatomic,strong)UIButton * endBtn;
@property(nonatomic,strong)UIButton * widthBtn;

@property(nonatomic,assign)NSInteger indexPage;

-(NSInteger)getWithSelectIndex;

@end

NS_ASSUME_NONNULL_END
