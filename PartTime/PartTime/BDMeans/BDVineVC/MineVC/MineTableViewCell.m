//
//  MineTableViewCell.m
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/19.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import "MineTableViewCell.h"
#import "BDSetMinConfig.h"

@implementation MineTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createWithChage];
    }
    return self;
}
-(void)createWithChage
{
    self.imageIconVi=[[UIImageView alloc]initWithFrame:CGRectMake(15, 20 , 20, 20)];
    [self.contentView addSubview:self.imageIconVi];
    
    self.titleOLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageIconVi.frame)+10, 20, SCREEN_WIDTH - (CGRectGetMaxX(self.imageIconVi.frame)+10+20), 20)];
    self.titleOLabel.font =[UIFont systemFontOfSize:14];
    self.titleOLabel.textColor=[UIColor blackColor];
    [self.contentView addSubview:self.titleOLabel];
    
    self.moreImgVi=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-15, 20 , 20, 20)];
    [self.contentView addSubview:self.imageIconVi];
    
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1)];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
