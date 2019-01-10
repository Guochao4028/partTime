//
//  BDCustomNavtionInView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "BDCustomNavtionInView.h"
#import "BDSetMinConfig.h"
@implementation BDCustomNavtionInView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self createNavtionView];
    }
    return self;
}
-(void)createNavtionView
{
    CGFloat heightBarNav =CGRectGetHeight(self.frame)-STATUSHEIGHT;
    CGFloat backBtnWidth = 60;
    
    self.navBackVi =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.navBackVi.userInteractionEnabled =YES;
    self.navBackVi.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.navBackVi];
    
    self.leftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame=CGRectMake(0, STATUSHEIGHT, backBtnWidth,heightBarNav);
    [self.leftBtn addTarget:self action:@selector(btnLeftBackClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navBackVi addSubview:self.leftBtn];
    
    UIImageView * imageBack =[[UIImageView alloc]initWithFrame:CGRectMake(15, (CGRectGetHeight(self.leftBtn.frame)-16)/2,9, 16)];
    imageBack.image =[UIImage imageNamed:@"back_black"];
    [self.leftBtn addSubview:imageBack];
    
    self.titleLable =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftBtn.frame), STATUSHEIGHT, SCREEN_WIDTH -(CGRectGetMaxX(self.leftBtn.frame) *2), heightBarNav)];
    self.titleLable.textColor=[UIColor blackColor];
    self.titleLable.font=[UIFont systemFontOfSize:18];
    self.titleLable.textAlignment=NSTextAlignmentCenter;
    [self.navBackVi addSubview:self.titleLable];
    
    self.rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame=CGRectMake(CGRectGetWidth(self.frame)-backBtnWidth, STATUSHEIGHT, backBtnWidth,heightBarNav);
    [self.rightBtn addTarget:self action:@selector(btnRightBackClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navBackVi addSubview:self.rightBtn];
    
    self.lineView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.navBackVi.frame)-1, SCREEN_WIDTH, 1)];
    self.lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.navBackVi addSubview:self.lineView];
}

-(void)btnLeftBackClick:(UIButton *)sender
{
    if (self.btnClickBackIndex) {
        self.btnClickBackIndex(0);
    }
}
-(void)btnRightBackClick:(UIButton *)sender
{
    if (self.btnClickBackIndex) {
        self.btnClickBackIndex(1);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
