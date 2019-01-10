//
//  SearchNavgationView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "SearchNavgationView.h"


@interface SearchNavgationView()

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end


@implementation SearchNavgationView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"SearchNavgationView" owner:self options:nil];
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
- (IBAction)cloose:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(selectJumpPage:)] == YES) {
        [self.delegate selectJumpPage:0];
    }
}

@end
