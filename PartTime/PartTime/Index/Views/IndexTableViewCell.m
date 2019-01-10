//
//  IndexTableViewCell.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "IndexTableViewCell.h"


@interface IndexTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *conterImageView;

@end

@implementation IndexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    
    [self.conterImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)indexPath.row]]];
    
}

@end
