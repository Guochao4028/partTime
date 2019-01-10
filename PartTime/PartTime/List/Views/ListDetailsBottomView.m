//
//  ListDetailsBottomView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListDetailsBottomView.h"

@interface ListDetailsBottomView()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *callUp;

@end

@implementation ListDetailsBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"ListDetailsBottomView" owner:self options:nil];
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self.contentView setFrame:self.bounds];
    [self addSubview:self.contentView];
    
    self.callUp.layer.cornerRadius = 8;
    self.callUp.layer.masksToBounds = YES;
    
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self.contentView setFrame:self.bounds];
}


- (IBAction)callupAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(callUp)] == YES) {
        [self.delegate callUp];
    }
}

@end
