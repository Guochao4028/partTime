//
//  IndexTableHeardView.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "IndexTableHeardView.h"

@interface IndexTableHeardView()

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation IndexTableHeardView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"IndexTableHeardView" owner:self options:nil];
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

- (IBAction)buttonJumpMapAction:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(selectJumpPage:)]) {
        [self.delegate selectJumpPage:0];
    }
    
}

- (IBAction)buttonJumpWorkListAction:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(selectJumpPage:)]) {
        [self.delegate selectJumpPage:1];
    }
}

@end
