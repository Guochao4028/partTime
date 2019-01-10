//
//  MineHeaderCollectionViewCell.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "MineHeaderCollectionViewCell.h"

@implementation MineHeaderCollectionViewCell

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
    self.imageHeaderVi=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.imageHeaderVi.layer.masksToBounds=YES;
    self.imageHeaderVi.layer.cornerRadius=2;
    [self.contentView addSubview:self.imageHeaderVi];
}

@end
