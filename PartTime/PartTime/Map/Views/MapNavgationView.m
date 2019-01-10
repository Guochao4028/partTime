//
//  MapNavgationView.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "MapNavgationView.h"

@interface MapNavgationView()

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation MapNavgationView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"MapNavgationView" owner:self options:nil];
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self.contentView setFrame:self.bounds];
    [self addSubview:self.contentView];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self.contentView setFrame:self.bounds];
}

- (IBAction)jump:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(selectJumpPage:)]) {
        [self.delegate selectJumpPage:sender.tag];
    }
}

@end
