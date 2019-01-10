//
//  ListTableHeardView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListTableHeardView.h"

@interface ListTableHeardView()

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation ListTableHeardView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"ListTableHeardView" owner:self options:nil];
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


@end
