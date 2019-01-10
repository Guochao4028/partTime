//
//  ListNavgationView.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListNavgationView.h"


@interface ListNavgationView()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ListNavgationView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"ListNavgationView" owner:self options:nil];
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


#pragma mark - action

- (IBAction)goback:(id)sender {
    if ([self.delegate respondsToSelector:@selector(goback)] == YES) {
        [self.delegate goback];
    }
}

#pragma mark - setter/ getter
-(void)setTitleLabelStr:(NSString *)titleLabelStr{
    _titleLabelStr = titleLabelStr;
    [self.titleLabel setText:titleLabelStr];
}

@end
