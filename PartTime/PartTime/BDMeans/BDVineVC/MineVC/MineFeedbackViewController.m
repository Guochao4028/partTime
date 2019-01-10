//
//  MineFeedbackViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "MineFeedbackViewController.h"
#import "BDCustomNavtionInView.h"
#import "BDSetMinConfig.h"
#import "CoustomTextFieldVierw.h"
#import "DetailBtnView.h"

@interface MineFeedbackViewController ()<UITextViewDelegate>

@property (strong, nonatomic) BDCustomNavtionInView * navInView;

@property (strong, nonatomic) UIView * backView;
@property (strong, nonatomic) UILabel * labelTitle;
@property (strong, nonatomic) UIView * btnBackInter;
@property (strong, nonatomic) UIView * textBackView;
@property (strong, nonatomic) UITextView * textView;
@property (strong, nonatomic) UILabel * textNumLable;
@property (strong, nonatomic) CoustomTextFieldVierw * textFieldBack;
@property (strong, nonatomic) UIButton * submitBtn;

@property (assign, nonatomic) NSInteger btnInfoCode;

@end

@implementation MineFeedbackViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.btnInfoCode = 0;
    [self createNavTionView];
    [self creatFeedBackView];
}
-(void)createNavTionView
{
    CGFloat heightNav =STATUSHEIGHT + CGRectGetHeight(self.navigationController.navigationBar.frame);
    self.navInView =[[BDCustomNavtionInView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, heightNav)];
    self.navInView.backgroundColor=[UIColor whiteColor];
    self.navInView.titleLable.text=@"Feedback";
    self.navInView.titleLable.textColor=[UIColor blackColor];
    [self.view addSubview:self.navInView];
    __weak typeof(self) weakSelf =self;
    self.navInView.btnClickBackIndex = ^(NSInteger index) {
        if (index == 0) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    };
}
-(void)creatFeedBackView
{
    CGFloat heightNav =STATUSHEIGHT + CGRectGetHeight(self.navigationController.navigationBar.frame);
    self.backView=[[UIView alloc]initWithFrame:CGRectMake(0, heightNav, SCREEN_WIDTH, SCREEN_HEIGHT-heightNav)];
    self.backView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.backView];
    
    NSString * feedback =@"Feedback";
    NSString * others =@"(Type of problem you encountered)";
    NSString * allStr =[NSString stringWithFormat:@"%@%@",feedback,others];
    self.labelTitle =[[UILabel alloc]initWithFrame:CGRectMake(15,15, SCREEN_WIDTH -30, 20)];
    self.labelTitle.font=[UIFont systemFontOfSize:14];
    self.labelTitle.text=allStr;
    [self.backView addSubview:self.labelTitle];
    
    NSMutableAttributedString * str2 = [[NSMutableAttributedString alloc]initWithString:allStr];
    [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#999999"] range:NSMakeRange(feedback.length,others.length)];
    self.labelTitle.attributedText =str2;
    
    
    self.btnBackInter =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.labelTitle.frame)+10, SCREEN_WIDTH, 40)];
    [self.backView addSubview:self.btnBackInter];
    
    UIFont * font =[UIFont systemFontOfSize:13];
    NSArray * arrayIndex =@[@"product suggestion",@"function",@"other"];
    for (int i=0; i<arrayIndex.count; i++) {
        NSString * string =[arrayIndex objectAtIndex:i];
        CGFloat widthTitle = [ALTextUtility getWidth:string withFont:font];
        DetailBtnView * btnView =nil;
        if (i ==0 ) {
            btnView = [[DetailBtnView alloc]initWithFrame:CGRectMake(15,(40 - 20)/2 , widthTitle+20+20, 20)];
            btnView.iconImageView.image=[UIImage imageNamed:@"xuanzhong_code"];
        }else{
            DetailBtnView * oncebtnView=[self.btnBackInter viewWithTag:100+i-1];
            btnView = [[DetailBtnView alloc]initWithFrame:CGRectMake(15+(CGRectGetMaxX(oncebtnView.frame)),(40 - 20)/2 , widthTitle+20+20, 20)];
            btnView.iconImageView.image=[UIImage imageNamed:@"xuanzhong_uncode"];
        }
        [btnView addTarget:self action:@selector(btnViewXuanZClick:) forControlEvents:UIControlEventTouchUpInside];
        btnView.labelTitile.text=string;
        btnView.labelTitile.textColor=[UIColor blackColor];
        btnView.tag=100+i;
        [self.btnBackInter addSubview:btnView];
    }
    
    
    self.textBackView=[[UIView alloc]initWithFrame:CGRectMake(15,CGRectGetMaxY(self.btnBackInter.frame)+10,SCREEN_WIDTH-30 , 135)];
    self.textBackView.layer.masksToBounds=YES;
    self.textBackView.layer.cornerRadius=1;
    self.textBackView.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
    self.textBackView.layer.borderWidth=1.0;
    [self.backView addSubview:self.textBackView];
    
    self.textView =[[UITextView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.textBackView.frame)-20, CGRectGetHeight(self.textBackView.frame)-15-20)];
    self.textView.delegate=self;
    self.textView.returnKeyType =UIReturnKeyDone;
    self.textView.textColor=[UIColor colorWithRed:62/255.0 green:63/255.0 blue:64/255.0 alpha:1.0];
    self.textView.font=[UIFont systemFontOfSize:13];
    [self.textBackView addSubview:self.textView];
    
    self.textNumLable =[[UILabel alloc]initWithFrame:CGRectMake(4,CGRectGetMaxY(self.textView.frame), CGRectGetWidth(self.textBackView.frame) -8, 20)];
    self.textNumLable.font=[UIFont systemFontOfSize:13];
    self.textNumLable.textAlignment=NSTextAlignmentRight;
    self.textNumLable.textColor=[UIColor colorWithRed:62/255.0 green:63/255.0 blue:64/255.0 alpha:1.0];
    self.textNumLable.text=@"500 words";
    [self.textBackView addSubview:self.textNumLable];
    
    
    self.textFieldBack =[[CoustomTextFieldVierw alloc]initWithFrame:CGRectMake(15,CGRectGetMaxY(self.textBackView.frame)+30 , SCREEN_WIDTH-30, 40)];
    self.textFieldBack.layer.masksToBounds=YES;
    self.textFieldBack.layer.cornerRadius=1;
    self.textFieldBack.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
    self.textFieldBack.layer.borderWidth=1.0;
    self.textFieldBack.butNLeft.hidden=YES;
    self.textFieldBack.textField.frame=CGRectMake(10, 0, CGRectGetWidth(self.textFieldBack.frame)-20, 40);
    self.textFieldBack.textField.placeholder=@"Fill out you phone or email";
    [self.backView addSubview:self.textFieldBack];
    
    self.submitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn.frame=CGRectMake(15, CGRectGetMaxY(self.textFieldBack.frame)+30, SCREEN_WIDTH-30, 45);
    [self.submitBtn setTitle:@"Submit to" forState:UIControlStateNormal];
    [self.submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.submitBtn.backgroundColor=[UIColor colorWithRed:29/255.0 green:131/255.0 blue:231/255.0 alpha:1.0];
    [self.backView addSubview:self.submitBtn];
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
    
}
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger indexLone = 500 - textView.text.length;
    self.textNumLable.text=[NSString stringWithFormat:@"%ld words",indexLone];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return YES;
}

-(void)btnViewXuanZClick:(UIButton *)sender
{
    NSInteger indexTage =sender.tag - 100;
    NSLog(@"%ld",(long)indexTage);
    self.btnInfoCode=indexTage;
    for (DetailBtnView * detailVi in [self.btnBackInter subviews]) {
    
        if (detailVi.tag >= 100) {
            if (detailVi.tag == sender.tag) {
                detailVi.iconImageView.image=[UIImage imageNamed:@"xuanzhong_code"];
            }else{
                detailVi.iconImageView.image=[UIImage imageNamed:@"xuanzhong_uncode"];
            }
        }
        
    }
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
