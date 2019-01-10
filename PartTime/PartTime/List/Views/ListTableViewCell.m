//
//  ListTableViewCell.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListTableViewCell.h"
#import "JobsModel.h"
#import "Company.h"
#import "UIImageView+WebCache.h"

@interface ListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *addres;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(JobsModel *)model{
    [self.title setText:model.title];
    [self.type setText:model.type_name];
    
    [self.name setText:model.company.name];
    
    if([model.company.logo rangeOfString:@"https://d2fcz5no062gar.cloudfront.neth"].location !=NSNotFound){
        NSRange range = [model.company.logo rangeOfString:@"https://d2fcz5no062gar.cloudfront.net"];
        NSString *logo = [model.company.logo substringFromIndex:(range.location + range.length)];
        [self.logo sd_setImageWithURL: [NSURL URLWithString:logo] placeholderImage:[UIImage imageNamed:@"CompanyLogo"]];
    }else{
        [self.logo sd_setImageWithURL: [NSURL URLWithString:model.company.logo] placeholderImage:[UIImage imageNamed:@"CompanyLogo"]];
    }
    
    self.logo.layer.cornerRadius = 8;
    self.logo.layer.masksToBounds = YES;
    
    if (model.location_name == nil && model.location_id == nil) {
        [self.addres setText:@"Anywhere"];
    }else{
        [self.addres setText:model.location_name];
    }
}

@end
