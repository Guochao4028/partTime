//
//  HistroyTableViewCell.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "HistroyTableViewCell.h"
#import "JobsModel.h"
#import "Company.h"
#import "UIImageView+WebCache.h"

@interface HistroyTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *conetImageView;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *compayLabel;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation HistroyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.conetImageView.layer.cornerRadius = 8;
    self.conetImageView.layer.masksToBounds = YES;
    
    self.deleteButton.layer.cornerRadius = 8;
    self.deleteButton.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(JobsModel *)model{
    [self.title setText:model.title];
    [self.type setText:model.type_name];
    
    [self.compayLabel setText:model.company.name];
    
    if([model.company.logo rangeOfString:@"https://d2fcz5no062gar.cloudfront.neth"].location !=NSNotFound){
        NSRange range = [model.company.logo rangeOfString:@"https://d2fcz5no062gar.cloudfront.net"];
        NSString *logo = [model.company.logo substringFromIndex:(range.location + range.length)];
        [self.conetImageView sd_setImageWithURL: [NSURL URLWithString:logo] placeholderImage:[UIImage imageNamed:@"CompanyLogo"]];
    }else{
        [self.conetImageView sd_setImageWithURL: [NSURL URLWithString:model.company.logo] placeholderImage:[UIImage imageNamed:@"CompanyLogo"]];
    }
    
    if (model.location_name == nil && model.location_id == nil) {
        [self.locationLabel setText:@"Anywhere"];
    }else{
        [self.locationLabel setText:model.location_name];
    }
}


- (IBAction)deleteAction:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(deleteCell:)] == YES) {
        [self.delegate deleteCell:self.indexPath];
    }
}


@end
