//
//  SearchBottomView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "SearchBottomView.h"

@interface SearchBottomView()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *numberJobLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;


@end

@implementation SearchBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"SearchBottomView" owner:self options:nil];
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self.contentView setFrame:self.bounds];
    [self addSubview:self.contentView];
    self.doneButton.layer.cornerRadius = 8;
    self.doneButton.layer.masksToBounds = YES;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self.contentView setFrame:self.bounds];
}

#pragma mark - action

- (IBAction)doneAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(selectDone)] == YES) {
        [self.delegate selectDone];
    }
}

#pragma mark - setter / getter

-(void)setNumberJob:(NSString *)numberJob{
    _numberJob = numberJob;
    [self.numberJobLabel setText:[NSString stringWithFormat:@"%@ job match available", numberJob]];
}


@end
