//
//  DetailBtnView.m
//  FanliCenter
//
//  Created by AYLiOS on 2018/11/29.
//  Copyright © 2018年 AYLiOS. All rights reserved.
//

#import "DetailBtnView.h"

@implementation DetailBtnView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createSetupView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.labelTitile.frame=CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+5, 0, CGRectGetWidth(self.frame)-(CGRectGetMaxX(self.iconImageView.frame)),CGRectGetHeight(self.frame));
    
}
-(void)createSetupView
{
    self.iconImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0,0, CGRectGetHeight(self.frame),CGRectGetHeight(self.frame))];
    [self addSubview:self.iconImageView];
    
    self.labelTitile =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+5, 0, CGRectGetWidth(self.frame)-(CGRectGetMaxX(self.iconImageView.frame)),CGRectGetHeight(self.frame))];
    self.labelTitile.font=[UIFont systemFontOfSize:14];
    self.labelTitile.textColor=[UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1.0];
    self.labelTitile.textAlignment=NSTextAlignmentLeft;
    [self addSubview:self.labelTitile];
    
    CGFloat originY = (CGRectGetHeight(self.frame)-20*2 -5)/2;
    self.labelTopView =[[UILabel alloc]initWithFrame:CGRectMake(2, originY,CGRectGetWidth(self.frame)-4 ,20)];
    self.labelTopView.font=[UIFont systemFontOfSize:14];
    self.labelTopView.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.labelTopView];
    self.labelBottomView =[[UILabel alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(self.labelTopView.frame)+5,CGRectGetWidth(self.frame)-4 ,20)];
    self.labelBottomView.font=[UIFont systemFontOfSize:14];
    self.labelBottomView.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.labelBottomView];
    self.labelTopView.hidden=YES;
    self.labelBottomView.hidden=YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
