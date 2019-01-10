//
//  SearchHomeCell.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "SearchHomeCell.h"


@interface SearchHomeCell ()
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation SearchHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (IBAction)switchAction:(UISwitch *)sender {
    [self.sliderView setHidden:!sender.isOn];
}


- (IBAction)sliderAction:(UISlider *)sender {
    
    int value = sender.value;
    
    
    if (value > 30) {
        [self.descLabel setText:@"30+ miles"];
    }else{
        [self.descLabel setText:[NSString stringWithFormat:@"%d miles", value]];
    }
    
    
    if ([self.delegate respondsToSelector:@selector(random)] == YES) {
        [self.delegate random];
    }
    
}


@end
