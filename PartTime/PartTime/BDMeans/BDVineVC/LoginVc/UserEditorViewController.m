//
//  UserEditorViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "UserEditorViewController.h"
#import "EdtiorBtnView.h"
#import "RootViewController.h"

#import "THDatePickerView.h"
#import "LoginManager.h"
#import "UserInfoModel.h"

@interface UserEditorViewController () <THDatePickerViewDelegate>

@property(nonatomic,strong)UILabel * labelTitle;
@property(nonatomic,strong)UILabel * labelDetail;
@property(nonatomic,strong)EdtiorBtnView * oneEditBtnView;
@property(nonatomic,strong)EdtiorBtnView * twoEditBtnView;
@property(nonatomic,strong)EdtiorBtnView * thereEditBtnView;
@property (weak, nonatomic)THDatePickerView *dateView;
@property(strong,nonatomic)NSString * yearChage;

@property(nonatomic,strong)UIButton * edtitorCoceBtn;

@end

@implementation UserEditorViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMarkEditorView];
    
    THDatePickerView *dateView = [[THDatePickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300)];
    dateView.delegate = self;
    dateView.title = @"Please choose the time";
    //    dateView.isSlide = NO;
    //    dateView.date = @"2017-03-23 12:43";
    //    dateView.minuteInterval = 1;
    [self.view addSubview:dateView];
    self.dateView = dateView;
    
}
#pragma mark - THDatePickerViewDelegate
/**
 保存按钮代理方法
 
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
    NSLog(@"保存点击");
    self.yearChage=timer;
    [self.thereEditBtnView.widthBtn setTitle:timer forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
    
}

/**
 取消按钮代理方法
 */
- (void)datePickerViewCancelBtnClickDelegate {
    NSLog(@"取消点击");
   
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
}
-(void)createMarkEditorView
{
    
    self.labelTitle =[[UILabel alloc]initWithFrame:CGRectMake(10, 180, ScreenWidth-20, 20)];
    self.labelTitle.textAlignment=NSTextAlignmentCenter;
    self.labelTitle.font=[UIFont systemFontOfSize:14];
    self.labelTitle.text=@"Please answer the following questions";
    self.labelTitle.textColor=[UIColor colorWithRed:0 green:109/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:self.labelTitle];
    
    self.labelDetail =[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.labelTitle.frame), ScreenWidth-20, 20)];
    self.labelDetail.textAlignment=NSTextAlignmentCenter;
    self.labelDetail.font=[UIFont systemFontOfSize:14];
    self.labelDetail.text=@"and thailor your part-time job to you needs.";
    self.labelDetail.textColor=[UIColor colorWithRed:0 green:109/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:self.labelDetail];
    
    self.oneEditBtnView =[[EdtiorBtnView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.labelDetail.frame)+40, ScreenWidth, 35)];
    self.oneEditBtnView.titleLabel.text=@"Sexuality";
    [self.oneEditBtnView.benginBtn setTitle:@"man" forState:UIControlStateNormal];
    [self.oneEditBtnView.endBtn setTitle:@"female" forState:UIControlStateNormal];
    self.oneEditBtnView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.oneEditBtnView];
    
    self.twoEditBtnView =[[EdtiorBtnView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.oneEditBtnView.frame)+5, ScreenWidth, 35)];
    self.twoEditBtnView.titleLabel.text=@"Type of";
    self.twoEditBtnView.secondLabel.hidden=NO;
    self.twoEditBtnView.secondLabel.text=@"job search";
    self.twoEditBtnView.titleLabel.numberOfLines=2;
    [self.twoEditBtnView.benginBtn setTitle:@"Full time" forState:UIControlStateNormal];
    [self.twoEditBtnView.endBtn setTitle:@"part-time" forState:UIControlStateNormal];
    self.twoEditBtnView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.twoEditBtnView];
    
    self.thereEditBtnView =[[EdtiorBtnView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.twoEditBtnView.frame)+5, ScreenWidth, 35)];
    self.thereEditBtnView.titleLabel.text=@"Year of birth";
    self.thereEditBtnView.benginBtn.hidden=YES;
    self.thereEditBtnView.endBtn.hidden=YES;
    self.thereEditBtnView.widthBtn.hidden=NO;
    [self.thereEditBtnView.widthBtn addTarget:self action:@selector(widthBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.thereEditBtnView.widthBtn setTitle:@"Please select" forState:UIControlStateNormal];
    self.thereEditBtnView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.thereEditBtnView];
    
    CGFloat widthBtnED =ScreenWidth - 42*2;
    self.edtitorCoceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.edtitorCoceBtn.frame=CGRectMake(42,CGRectGetMaxY(self.thereEditBtnView.frame)+20 ,widthBtnED, 45);
    self.edtitorCoceBtn.backgroundColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0];
    [self.edtitorCoceBtn setTitle:@"Enter" forState:UIControlStateNormal];
    [self.edtitorCoceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.edtitorCoceBtn.layer.masksToBounds=YES;
    self.edtitorCoceBtn.layer.cornerRadius=5;
    [self.edtitorCoceBtn addTarget:self action:@selector(edtitorCoceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.edtitorCoceBtn];
}
-(void)widthBtnClick:(UIButton *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
        [self.dateView show];
    }];
}
-(void)edtitorCoceBtnClick:(UIButton *)sender
{
    
    NSInteger man =[self.oneEditBtnView getWithSelectIndex];
    NSInteger Full =[self.oneEditBtnView getWithSelectIndex];
    
    NSString * manSelt =@"";
    if (man == 0) {
        manSelt = @"man";
    }else{
        manSelt =@"female";
    }
    
    if (self.yearChage.length ==0) {
        NSDate *date = [NSDate date];
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyyMMdd"];
        self.yearChage =[dateFormatter stringFromDate:date];
    }
    
    UserInfoModel * userModel =[LoginManager getLoginUserInfo];
    userModel.createtime =[self.yearChage floatValue];
    userModel.gender = (CGFloat)man;
    userModel.score = (CGFloat)Full;
    [LoginManager saveLoginWithInfoUser:userModel];
    
    NSUserDefaults * userInfo= [NSUserDefaults standardUserDefaults];
    [userInfo setObject:@"enter" forKey:@"EnterVC"];
    [userInfo synchronize];
    // 设置根控制器
    RootViewController * tabarVc =[[RootViewController alloc]init];
    UIWindow * window =[UIApplication sharedApplication].keyWindow;
    window.rootViewController =tabarVc;

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
