//
//  EdtiorBtnView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "EdtiorBtnView.h"

@implementation EdtiorBtnView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.indexPage = 0;
        [self createChageView];
    }
    return self;
    
}
-(void)createChageView
{
    CGFloat widthTile =CGRectGetWidth(self.frame)-260;
    self.titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, widthTile, 20)];
    self.titleLabel.textAlignment=NSTextAlignmentRight;
    self.titleLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:self.titleLabel];
    self.secondLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), widthTile, 20)];
    self.secondLabel.textAlignment=NSTextAlignmentRight;
    self.secondLabel.font=[UIFont systemFontOfSize:15];
    self.secondLabel.hidden=YES;
    [self addSubview:self.secondLabel];
    
    CGFloat btnWidth = (260-40-20-20)/2;
    self.benginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.benginBtn.frame=CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+20, 0, btnWidth,30);
    self.benginBtn.backgroundColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0];
    self.benginBtn.layer.masksToBounds=YES;
    self.benginBtn.layer.cornerRadius=CGRectGetHeight(self.benginBtn.frame)/2;
    self.benginBtn.layer.borderColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0].CGColor;
    self.benginBtn.layer.borderWidth=1.0;
    [self.benginBtn addTarget:self action:@selector(benginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.benginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.benginBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:self.benginBtn];
    
    self.endBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.endBtn.frame=CGRectMake(CGRectGetMaxX(self.benginBtn.frame)+20, 0, btnWidth,30);
    self.endBtn.backgroundColor=[UIColor whiteColor];
    self.endBtn.layer.masksToBounds=YES;
    self.endBtn.layer.cornerRadius=CGRectGetHeight(self.benginBtn.frame)/2;
    self.endBtn.layer.borderColor=[UIColor colorWithRed:160/255.0 green:161/255.0 blue:162/255.0 alpha:1.0].CGColor;
    self.endBtn.layer.borderWidth=1.0;
    [self.endBtn setTitleColor:[UIColor colorWithRed:160/255.0 green:161/255.0 blue:162/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.endBtn addTarget:self action:@selector(endBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.endBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:self.endBtn];
    
    
    self.widthBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.widthBtn.frame=CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+20, 0, CGRectGetMaxX(self.endBtn.frame) -CGRectGetMinX(self.benginBtn.frame),30);
    self.widthBtn.backgroundColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0];
    self.widthBtn.hidden=YES;
    self.widthBtn.layer.masksToBounds=YES;
    self.widthBtn.layer.cornerRadius=CGRectGetHeight(self.benginBtn.frame)/2;
    self.widthBtn.layer.borderColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0].CGColor;
    self.widthBtn.layer.borderWidth=1.0;
    [self.widthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.widthBtn.titleLabel.font=[UIFont systemFontOfSize:15];
//    [self.widthBtn addTarget:self action:@selector(widthBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.widthBtn];
    
}
-(NSInteger)getWithSelectIndex
{
    return self.indexPage;
}

-(void)benginBtnClick:(UIButton *)sender
{
    self.indexPage=0;
}
-(void)endBtnBtnClick:(UIButton *)sender
{
    self.indexPage=1;
}
-(void)widthBtnClick:(UIButton *)sender
{
    self.indexPage=2;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
