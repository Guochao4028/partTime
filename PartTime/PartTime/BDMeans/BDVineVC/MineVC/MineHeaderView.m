//
//  MineHeaderView.m
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/19.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createChageWithHeader];
    }
    return self;
}

-(void)createChageWithHeader
{
    self.backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , CGRectGetWidth(self.frame),CGRectGetHeight(self.frame))];
    self.backView.backgroundColor =[UIColor whiteColor];
    self.backView.userInteractionEnabled=YES;
    [self addSubview:self.backView];
    
    self.imageBackView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.backView.frame), 135)];
    [self.imageBackView setContentMode:UIViewContentModeScaleAspectFill];
    self.imageBackView.clipsToBounds = YES;
    [self.backView addSubview:self.imageBackView];
    
    //实现模糊效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //毛玻璃视图
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:effect];;
    self.effectView.frame = CGRectMake(0, 0, CGRectGetWidth(self.imageBackView.frame), CGRectGetHeight(self.imageBackView.frame));
    [self.imageBackView addSubview:self.effectView];
    
    
    self.imageIconVi=[[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.imageBackView.frame)-35 , 70, 70)];
    self.imageIconVi.layer.masksToBounds=YES;
    self.imageIconVi.layer.cornerRadius=CGRectGetHeight(self.imageIconVi.frame)/2;
    self.imageIconVi.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
    self.imageIconVi.layer.borderWidth=1;
    self.imageIconVi.userInteractionEnabled=YES;
    [self.backView addSubview:self.imageIconVi];
    
    self.titleOLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageIconVi.frame)+10, CGRectGetMidY(self.imageIconVi.frame)+5, CGRectGetWidth(self.backView.frame)-15-(CGRectGetMaxX(self.imageIconVi.frame)+10), 20)];
    self.titleOLabel.font =[UIFont systemFontOfSize:15];
    self.titleOLabel.textColor=[UIColor blackColor];
    [self.backView addSubview:self.titleOLabel];
    
//    self.moreImgVi=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleOLabel.frame), CGRectGetMinX(self.titleOLabel.frame) , 20, 20)];
//    [self.backView addSubview:self.moreImgVi];
//
//    self.labelIdStr =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageIconVi.frame)+10, CGRectGetMaxY(self.titleOLabel.frame), CGRectGetWidth(self.frame)-CGRectGetMaxX(self.imageIconVi.frame)-10-15, 20)];
//    self.labelIdStr.font =[UIFont systemFontOfSize:15];
//    self.labelIdStr.textColor=[UIColor blackColor];
//    [self.backView addSubview:self.labelIdStr];
    
    UITapGestureRecognizer * tapVode =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestChageVode:)];
    
    [self.imageIconVi addGestureRecognizer:tapVode];
}

-(void)tapGestChageVode:(UITapGestureRecognizer *)tapGest
{
    if (self.headerImageClick) {
        self.headerImageClick();
    }
    
}

-(void)configWithMineData:(id)dataItem
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
