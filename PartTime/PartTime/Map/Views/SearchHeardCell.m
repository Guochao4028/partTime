//
//  SearchHeardCell.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "SearchHeardCell.h"

@interface SearchHeardCell ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end

@implementation SearchHeardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCurrLocationStr:(NSString *)currLocationStr{
    _currLocationStr = currLocationStr;
    [self.cityLabel setText:currLocationStr];
}

@end
