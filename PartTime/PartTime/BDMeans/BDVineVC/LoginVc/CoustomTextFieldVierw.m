//
//  CoustomTextFieldVierw.m
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/25.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import "CoustomTextFieldVierw.h"


@interface CoustomTextFieldVierw ()<UITextFieldDelegate>


@end

@implementation CoustomTextFieldVierw


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
        
        [self createTextFieldView];
    }
    return self;
}

-(void)createTextFieldView
{
    self.butNLeft =[UIButton buttonWithType:UIButtonTypeCustom];
    self.butNLeft.frame=CGRectMake(0, 0, 50, CGRectGetHeight(self.frame));
    self.butNLeft.userInteractionEnabled=NO;
    [self addSubview:self.butNLeft];
    self.butNLeft.titleLabel.font=[UIFont systemFontOfSize:14];
    
    self.textField=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.butNLeft.frame)+5, 5, CGRectGetWidth(self.frame)-(CGRectGetMaxX(self.butNLeft.frame)+5),  CGRectGetHeight(self.frame)-10)];
    self.textField.font=[UIFont systemFontOfSize:14];
    self.textField.delegate=self;
    [self.textField addTarget:self action:@selector(textFieldCEventValueChage:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:self.textField];
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField.text.length >0) {
        if (self.textFieldReturnChage) {
            self.textFieldReturnChage(textField);
        }
    }
    return YES;
}
-(void)textFieldCEventValueChage:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(textFeildChageValueWith:)]) {
        [self.delegate textFeildChageValueWith:textField];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
