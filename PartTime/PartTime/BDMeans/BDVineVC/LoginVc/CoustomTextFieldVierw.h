//
//  CoustomTextFieldVierw.h
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/25.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CoustomTextFieldVierwDelegate <NSObject>
-(void)textFeildChageValueWith:(UITextField *)textFild;
//-(void)textFieldCodeReturnCilck:(UITextField *)textFild;
@end

@interface CoustomTextFieldVierw : UIView


@property(nonatomic,strong) UIButton * butNLeft;
@property(nonatomic,strong) UITextField * textField;

@property(nonatomic,weak) id<CoustomTextFieldVierwDelegate> delegate;

@property(nonatomic,strong)void (^textFieldReturnChage)(UITextField * textField);


@end

NS_ASSUME_NONNULL_END
