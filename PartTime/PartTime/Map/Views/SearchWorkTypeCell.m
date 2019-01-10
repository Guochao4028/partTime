//
//  SearchWorkTypeCell.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "SearchWorkTypeCell.h"

@interface SearchWorkTypeCell ()
@property (weak, nonatomic) IBOutlet UILabel *oneTimeGigLabel;
@property (weak, nonatomic) IBOutlet UIImageView *oneTimeGigImageView;
@property(nonatomic)BOOL isSelectedOneTimeGig;

@property (weak, nonatomic) IBOutlet UILabel *partTimeWorkLabel;
@property (weak, nonatomic) IBOutlet UIImageView *partTimeWorkImageView;
@property(nonatomic)BOOL isSelectedPartTimeWork;

@property (weak, nonatomic) IBOutlet UILabel *anytimeWorkLable;
@property (weak, nonatomic) IBOutlet UIImageView *anytimeWorkImageView;
@property(nonatomic)BOOL isSelectedAnytimeWork;

@property (weak, nonatomic) IBOutlet UILabel *fullTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fullTimeImageView;
@property(nonatomic)BOOL isSelectedFullTimeWork;




@end

@implementation SearchWorkTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (IBAction)oneTimeGigAction:(UIButton *)sender {
    if (self.isSelectedOneTimeGig == NO) {
        [self.oneTimeGigLabel setTextColor:[UIColor colorWithRed:(5/255.0) green:(89/255.0) blue:(254/255.0) alpha:1]];
        [self.oneTimeGigImageView setImage:[UIImage imageNamed:@"selected"]];
    }else{
        [self.oneTimeGigLabel setTextColor:[UIColor colorWithRed:(49/255.0) green:(49/255.0) blue:(50/255.0) alpha:1]];
        [self.oneTimeGigImageView setImage:[UIImage imageNamed:@"unSelect"]];
    }
    
    self.isSelectedOneTimeGig = !self.isSelectedOneTimeGig;
}

- (IBAction)partTimeWorkAction:(id)sender {
    if (self.isSelectedPartTimeWork == NO) {
        [self.partTimeWorkLabel setTextColor:[UIColor colorWithRed:(5/255.0) green:(89/255.0) blue:(254/255.0) alpha:1]];
        [self.partTimeWorkImageView setImage:[UIImage imageNamed:@"selected"]];
    }else{
        [self.partTimeWorkLabel setTextColor:[UIColor colorWithRed:(49/255.0) green:(49/255.0) blue:(50/255.0) alpha:1]];
        [self.partTimeWorkImageView setImage:[UIImage imageNamed:@"unSelect"]];
    }
    self.isSelectedPartTimeWork = !self.isSelectedPartTimeWork;
}

- (IBAction)anytimeWorkAction:(id)sender {
    
    
    if (self.isSelectedAnytimeWork == NO) {
        [self.anytimeWorkLable setTextColor:[UIColor colorWithRed:(5/255.0) green:(89/255.0) blue:(254/255.0) alpha:1]];
        [self.anytimeWorkImageView setImage:[UIImage imageNamed:@"selected"]];
    }else{
        [self.anytimeWorkLable setTextColor:[UIColor colorWithRed:(49/255.0) green:(49/255.0) blue:(50/255.0) alpha:1]];
        [self.anytimeWorkImageView setImage:[UIImage imageNamed:@"unSelect"]];
    }
    self.isSelectedAnytimeWork = !self.isSelectedAnytimeWork;
}

- (IBAction)fullTimeAction:(id)sender {
    
    if (self.isSelectedFullTimeWork == NO) {
        [self.fullTimeLabel setTextColor:[UIColor colorWithRed:(5/255.0) green:(89/255.0) blue:(254/255.0) alpha:1]];
        [self.fullTimeImageView setImage:[UIImage imageNamed:@"selected"]];
    }else{
        [self.fullTimeLabel setTextColor:[UIColor colorWithRed:(49/255.0) green:(49/255.0) blue:(50/255.0) alpha:1]];
        [self.fullTimeImageView setImage:[UIImage imageNamed:@"unSelect"]];
    }
    self.isSelectedFullTimeWork = !self.isSelectedFullTimeWork;
    
}


@end
