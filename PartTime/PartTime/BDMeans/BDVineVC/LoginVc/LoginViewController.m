//
//  LoginViewController.m
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/25.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import "LoginViewController.h"
#import "CoustomTextFieldVierw.h"
#import "RegiestViewController.h"
#import "RootViewController.h"
#import "LoginManager.h"
#import "UserInfoModel.h"
#import "ALTextUtility.h"
#import "MBProgressHUD+Add.h"
#import "NSString+RegexCategory.h"
#import "BDSetMinConfig.h"
#import "UserEditorViewController.h"

@interface LoginViewController ()

@property(nonatomic,strong)CoustomTextFieldVierw * userNameView;
@property(nonatomic,strong)CoustomTextFieldVierw * passWordView;
@property(nonatomic,strong)UIButton * rememberBtn;
@property(nonatomic,strong)UIButton * subMitBtn;
@property(nonatomic,strong)UIButton * registBtn;
@property(nonatomic,strong)UIButton * forGetPWDBtn;
@property(nonatomic,strong)UIImageView * imaegBigView;
@property(nonatomic,strong)UIImageView * imageNIView;

@property(nonatomic,assign)BOOL isOpenl;

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowNotife:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHiheNotife:) name:UIKeyboardWillShowNotification object:nil];
}

-(void)willShowNotife:(NSNotification *)notifican
{
    
}

-(void)willHiheNotife:(NSNotification *)notifican
{
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isOpenl=NO;
    self.view.backgroundColor =[UIColor whiteColor];
    [self createViewCareCoad];
    
}
-(void)createViewCareCoad
{
    self.imaegBigView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.imaegBigView.backgroundColor=[UIColor colorWithRed:239/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
    self.imaegBigView.userInteractionEnabled=YES;
    [self.view addSubview:self.imaegBigView];
    
    CGFloat originY = 140;
    CGFloat lineOriginY = (180 -10)/3;
    
    UIView * backView =[[UIView alloc]initWithFrame:CGRectMake(20, originY, SCREEN_WIDTH -40, 120)];
    backView.backgroundColor=[UIColor whiteColor];
    backView.layer.masksToBounds=YES;
    backView.layer.cornerRadius=5;
    [self.imaegBigView addSubview:backView];
    
    UIView * lineViewOne =[[UIView alloc]initWithFrame:CGRectMake(25, 10+lineOriginY-1, CGRectGetWidth(backView.frame)-50, 1)];
    lineViewOne.backgroundColor=[UIColor colorWithRed:243/255.0 green:244/255.0 blue:245/255.0 alpha:1];
    [backView addSubview:lineViewOne];
    
    CGFloat heightText =(lineOriginY-20);
    self.userNameView=[[CoustomTextFieldVierw alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(lineViewOne.frame) -heightText, CGRectGetWidth(backView.frame), heightText)];
    [backView addSubview:self.userNameView];
    self.userNameView.butNLeft.frame=CGRectMake(0, 0, 25, heightText);
    self.userNameView.textField.frame=CGRectMake(25, 0, CGRectGetWidth(self.userNameView.frame)-25-25, heightText);
    self.userNameView.textField.placeholder=@"Please enter your email accout";
    self.userNameView.textFieldReturnChage = ^(UITextField * _Nonnull textField) {
        
    };
    
    UIView * lineViewTwo =[[UIView alloc]initWithFrame:CGRectMake(25, 10 +lineOriginY *2 -1, CGRectGetWidth(backView.frame)-50, 1)];
    lineViewTwo.backgroundColor=[UIColor colorWithRed:243/255.0 green:244/255.0 blue:245/255.0 alpha:1];
    [backView addSubview:lineViewTwo];
    
    self.passWordView=[[CoustomTextFieldVierw alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(lineViewTwo.frame) -heightText-10, CGRectGetWidth(backView.frame), heightText)];
    [backView addSubview:self.passWordView];
    self.passWordView.butNLeft.frame=CGRectMake(0, 0, 25, heightText);
    self.passWordView.textField.frame=CGRectMake(25, 0, CGRectGetWidth(self.passWordView.frame)-25-25, heightText);
    self.passWordView.textField.placeholder=@"Please enter your password";
    self.passWordView.textField.secureTextEntry=YES;
    self.passWordView.textFieldReturnChage = ^(UITextField * _Nonnull textField) {
        
    };
    
//    CGFloat remeWidth =[ALTextUtility getWidth:@"记住我" withFont:[UIFont systemFontOfSize:13]];
//    CGFloat width =remeWidth+25+30;
//    self.rememberBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    self.rememberBtn.frame=CGRectMake(0, CGRectGetMaxY(lineViewTwo.frame), width, lineOriginY);
//    [self.rememberBtn addTarget:self action:@selector(rememberBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [backView addSubview:self.rememberBtn];
//
//    self.imageNIView =[[UIImageView alloc]initWithFrame:CGRectMake(25, 20, 12 ,12)];
//    self.imageNIView.backgroundColor=[UIColor whiteColor];
//    self.imageNIView.layer.masksToBounds=YES;
//    self.imageNIView.layer.borderWidth=1.0;
//    self.imageNIView.layer.borderColor=[UIColor orangeColor].CGColor;
//    [self.rememberBtn addSubview:self.imageNIView];
//
//    UILabel * lableTi =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageNIView.frame)+10, 20, remeWidth,13)];
//    lableTi.font=[UIFont systemFontOfSize:13];
//    lableTi.text=@"记住我";
//    lableTi.textColor=[UIColor colorWithRed:141/255.0 green:142/255.0 blue:145/255.0 alpha:1.0];
//    [self.rememberBtn addSubview:lableTi];
    
//    UILabel * lableTest =[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(backView.frame)+40, CGRectGetWidth(self.imaegBigView.frame)-20,13)];
//    lableTest.font=[UIFont systemFontOfSize:15];
//    lableTest.textAlignment=NSTextAlignmentCenter;
//    lableTest.text=@"登录即同意《爱盈电竞用户协议及服务协议》";
//    lableTest.textColor=[UIColor blackColor];
//    [self.imaegBigView addSubview:lableTest];
    
    self.subMitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.subMitBtn.frame=CGRectMake(40, CGRectGetMaxY(backView.frame)+30, CGRectGetWidth(self.imaegBigView.frame)-80, 45);
    [self.subMitBtn addTarget:self action:@selector(subMitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.subMitBtn setTitle:@"Login" forState:UIControlStateNormal];
    self.subMitBtn.backgroundColor=[UIColor colorWithRed:86/255.0 green:151/255.0 blue:245/255.0 alpha:0.8];
    self.subMitBtn.layer.masksToBounds=YES;
    self.subMitBtn.layer.cornerRadius=45/2.0;
    [self.imaegBigView addSubview:self.subMitBtn];

    self.registBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.registBtn.frame=CGRectMake(40, CGRectGetMaxY(self.subMitBtn.frame)+30, CGRectGetWidth(self.imaegBigView.frame)-80, 45);
    [self.registBtn addTarget:self action:@selector(registBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.registBtn setTitle:@"Register" forState:UIControlStateNormal];
    self.registBtn.backgroundColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0];
    self.registBtn.layer.masksToBounds=YES;
    self.registBtn.layer.cornerRadius=45/2.0;
    [self.imaegBigView addSubview:self.registBtn];
    
    
    
}
-(void)rememberBtnClick:(UIButton *)sender
{
    if (self.isOpenl) {
        self.imageNIView.backgroundColor=[UIColor whiteColor];
        self.isOpenl=NO;
    }else{
        
        self.isOpenl=YES;
        self.imageNIView.backgroundColor=[UIColor orangeColor];

    }
}
// 点击非TextField区域取消第一响应者
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)subMitBtnClick:(UIButton *)sender
{
    
    if (![self.userNameView.textField.text isEmailAddress]) {
        [self alertViewShowTitle:@"Please enter your email account" cancel:@"Confirm" subMitWith:nil];
    }else{
        if (self.passWordView.textField.text.length <6) {
            [self alertViewShowTitle:@"Password must not be less than 6 bits" cancel:@"Confirm" subMitWith:nil];
        }else{
            
            NSUserDefaults * userInfo =[NSUserDefaults standardUserDefaults];
            [userInfo setObject:self.userNameView.textField.text forKey:@"userName"];
            [userInfo setObject:self.passWordView.textField.text forKey:@"passWord"];
            [userInfo setObject:@"LoginSkip" forKey:@"LoginSkip"];
            [userInfo synchronize];
            
            UserInfoModel * model =[UserInfoModel new];
            model.username = self.userNameView.textField.text;
            model.nickname = self.userNameView.textField.text;
            model.userId = 2317670;
            model.internIdent=2317670;
            model.avatar =[NSString stringWithFormat:@"touxiang"];
            model.gender=0;
            [LoginManager saveLoginWithInfoUser:model];
            [MBProgressHUD showError:@"Loign Success" toView:self.view];
            [self atherChageWith:0];
            
        }
    }

}

-(void)atherChageWith:(id)chageItem
{
    NSString * string =[[NSUserDefaults standardUserDefaults] objectForKey:@"EnterVC"];
    if ([string isEqualToString:@"enter"]) {
        RootViewController * tabarVc =[[RootViewController alloc]init];
        UIWindow * window =[UIApplication sharedApplication].keyWindow;
        window.rootViewController =tabarVc;
    }else{
        
        UserEditorViewController * tabarVc =[[UserEditorViewController alloc]init];
        UIWindow * window =[UIApplication sharedApplication].keyWindow;
        window.rootViewController =tabarVc;
    }
   
    
}


-(void)alertViewShowTitle:(NSString *)title cancel:(NSString *)cancel subMitWith:(NSString *)submit
{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Remind" message:title preferredStyle:UIAlertControllerStyleAlert];
    
    if (submit !=nil) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:submit style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了确认");
            //textFields是一个数组，获取所输入的字符串
            [self alertViewDidSelectIndex:1];
        }];
        [alert addAction:action1];
    }
    if (cancel !=nil ) {
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
            
            [self alertViewDidSelectIndex:0];
        }];
        [alert addAction:action2];
    }
    
    if (cancel == nil && submit == nil) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self alertViewDidSelectIndex:0];
        }];
        [alert addAction:action];
    }
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)alertViewDidSelectIndex:(NSUInteger)indexOnce
{
    if (indexOnce == 0) {
        
        return;
    }else{
        
        RootViewController * tabarVc =[[RootViewController alloc]init];
        UIWindow * window =[UIApplication sharedApplication].keyWindow;
        window.rootViewController =tabarVc;
    }
    
}


-(void)registBtnClick:(UIButton *)sender
{
    RegiestViewController * regiest =[[RegiestViewController alloc]init];
    [self.navigationController pushViewController:regiest animated:YES];
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
