//
//  HistroyNavgtionView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "HistroyNavgtionView.h"


@interface HistroyNavgtionView()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation HistroyNavgtionView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"HistroyNavgtionView" owner:self options:nil];
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

- (IBAction)back:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(goback)] == YES) {
        [self.delegate goback];
    }
}


- (IBAction)clearedAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(clearedAction)] == YES) {
        [self.delegate clearedAction];
    }
}

@end
