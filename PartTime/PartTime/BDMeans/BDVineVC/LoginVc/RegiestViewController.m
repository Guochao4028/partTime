//
//  RegiestViewController.m
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/25.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import "RegiestViewController.h"
#import "CoustomTextFieldVierw.h"
#import "RootViewController.h"
#import "LoginManager.h"
#import "UserInfoModel.h"
#import "MBProgressHUD+Add.h"
#import "ALTextUtility.h"
#import "NSString+RegexCategory.h"
#import "BDSetMinConfig.h"
#import "UserEditorViewController.h"

@interface RegiestViewController ()<CoustomTextFieldVierwDelegate>

@property(nonatomic,strong)CoustomTextFieldVierw * userNameView;
@property(nonatomic,strong)CoustomTextFieldVierw * passWordView;
@property(nonatomic,strong)CoustomTextFieldVierw * rememberView;
@property(nonatomic,strong)UIImageView * headerView;
@property(nonatomic,strong)UIImageView * imaegBigView;
@property(nonatomic,strong)UIButton * subMitBtn;
@property(nonatomic,strong)UIButton * backInfoBtn;

@end

@implementation RegiestViewController


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

    self.view.backgroundColor =[UIColor whiteColor];
    [self createViewCareCoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

-(void)createViewCareCoad
{
    
    self.imaegBigView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.imaegBigView.backgroundColor=[UIColor colorWithRed:239/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
    self.imaegBigView.userInteractionEnabled=YES;
    [self.view addSubview:self.imaegBigView];
    
    
    self.headerView =[[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 70)/2, STATUSHEIGHT + 44, 70, 70)];
    self.headerView.image=[UIImage imageNamed:@"touxiang"];
    [self.imaegBigView addSubview:self.headerView];
    
    
    CGFloat originY = CGRectGetMaxY(self.headerView.frame)+20;
    CGFloat lineOriginY = (180 -10)/3;
    
    UIView * backView =[[UIView alloc]initWithFrame:CGRectMake(20, originY, SCREEN_WIDTH -40, 180)];
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
    self.userNameView.textField.placeholder=@"Please enter your email account";
    self.userNameView.delegate=self;
    self.userNameView.textFieldReturnChage = ^(UITextField * _Nonnull textField) {
        
    };
    
    UIView * lineViewTwo =[[UIView alloc]initWithFrame:CGRectMake(25, 10 +lineOriginY *2 -1, CGRectGetWidth(backView.frame)-50, 1)];
    lineViewTwo.backgroundColor=[UIColor colorWithRed:243/255.0 green:244/255.0 blue:245/255.0 alpha:1];
    [backView addSubview:lineViewTwo];
    
    self.passWordView=[[CoustomTextFieldVierw alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(lineViewTwo.frame) -heightText, CGRectGetWidth(backView.frame), heightText)];
    [backView addSubview:self.passWordView];
    self.passWordView.butNLeft.frame=CGRectMake(0, 0, 25, heightText);
    self.passWordView.textField.frame=CGRectMake(25, 0, CGRectGetWidth(self.passWordView.frame)-25-25, heightText);
    self.passWordView.textField.placeholder=@"Please enter your password";
    self.passWordView.textField.secureTextEntry=YES;
    self.passWordView.delegate=self;
    self.passWordView.textFieldReturnChage = ^(UITextField * _Nonnull textField) {
        
    };
    

    self.rememberView=[[CoustomTextFieldVierw alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineViewTwo.frame)+10, CGRectGetWidth(backView.frame), heightText)];
    [backView addSubview:self.rememberView];
    self.rememberView.butNLeft.frame=CGRectMake(0, 0, 25, heightText);
    self.rememberView.textField.frame=CGRectMake(25, 0, CGRectGetWidth(self.passWordView.frame)-25-25, heightText);
    self.rememberView.textField.placeholder=@"Confirm Password";
    self.rememberView.textField.secureTextEntry=YES;
    self.rememberView.delegate=self;
    self.rememberView.textFieldReturnChage = ^(UITextField * _Nonnull textField) {
        
    };
    
    UIView * lineViewThree =[[UIView alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(self.rememberView.frame) , CGRectGetWidth(backView.frame)-50, 1)];
    lineViewThree.backgroundColor=[UIColor colorWithRed:243/255.0 green:244/255.0 blue:245/255.0 alpha:1];
    [backView addSubview:lineViewThree];
    
    
    
    self.subMitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.subMitBtn.frame=CGRectMake(40, CGRectGetMaxY(backView.frame)+50, CGRectGetWidth(self.imaegBigView.frame)-80, 45);
    [self.subMitBtn addTarget:self action:@selector(subMitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.subMitBtn setTitle:@"Register and login" forState:UIControlStateNormal];
    self.subMitBtn.backgroundColor=[UIColor colorWithRed:86/255.0 green:151/255.0 blue:245/255.0 alpha:0.8];
    self.subMitBtn.layer.masksToBounds=YES;
    self.subMitBtn.layer.cornerRadius=45/2.0;
    [self.imaegBigView addSubview:self.subMitBtn];
    
    
    self.backInfoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.backInfoBtn.frame=CGRectMake(10, STATUSHEIGHT, 20, 20);
    [self.backInfoBtn addTarget:self action:@selector(backInfoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        self.backInfoBtn.backgroundColor=[UIColor colorWithRed:238/255.0 green:100/255.0 blue:60/255.0 alpha:1.0];
    self.backInfoBtn.layer.masksToBounds=YES;
    self.backInfoBtn.layer.cornerRadius=CGRectGetHeight(self.backInfoBtn.frame)/2;
    [self.view addSubview:self.backInfoBtn];
    
    UIImageView * imageVi =[[UIImageView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.backInfoBtn.frame)-9)/2, (CGRectGetHeight(self.backInfoBtn.frame)-16)/2, 9, 16)];
    imageVi.image=[UIImage imageNamed:@"back_white"];
    [self.backInfoBtn addSubview:imageVi];
    
    
}
-(void)textFeildChageValueWith:(UITextField *)textFild
{
    if (self.userNameView.textField.text.length >= 6 && self.passWordView.textField.text.length >= 6 && self.rememberView.textField.text.length >= 6) {
        
        self.subMitBtn.backgroundColor=[UIColor colorWithRed:36/255.0 green:115/255.0 blue:240/255.0 alpha:1.0];
    }else{
        self.subMitBtn.backgroundColor=[UIColor colorWithRed:86/255.0 green:151/255.0 blue:245/255.0 alpha:0.8];
    }
}
-(void)subMitBtnClick:(UIButton *)sender
{
    if (![self.userNameView.textField.text isEmailAddress]) {
        [self alertViewShowTitle:@"Please enter your email account" cancel:@"Confirm" subMitWith:nil];
        
    }else{
        if (self.passWordView.textField.text.length <6) {
            [self alertViewShowTitle:@"Password must not be less than 6 bits" cancel:@"Confirm" subMitWith:nil];
        }else{
            
            if (![self.rememberView.textField.text isEqualToString:self.passWordView.textField.text]) {
                [self alertViewShowTitle:@"The passwords entered twice are different" cancel:@"Confirm" subMitWith:nil];
            }else{
                
               
                [MBProgressHUD showError:@"Register Success" toView:self.view];
        
                NSUserDefaults * userInfo =[NSUserDefaults standardUserDefaults];
                [userInfo setObject:self.userNameView.textField.text forKey:@"userName"];
                [userInfo setObject:self.passWordView.textField.text forKey:@"passWord"];
                [userInfo setObject:@"LoginSkip" forKey:@"LoginSkip"];
                [userInfo synchronize];
                
                UserInfoModel * model =[UserInfoModel new];
                model.username =self.userNameView.textField.text;
                model.nickname = self.userNameView.textField.text;
                model.userId = 2317670;
                model.internIdent=2317670;
                model.avatar =[NSString stringWithFormat:@"touxiang"];
                model.gender=0;
                [LoginManager saveLoginWithInfoUser:model];
                
                [self atherChageWith:0];
                
            }
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
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:action1];
    }
    if (cancel !=nil ) {
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
        }];
        [alert addAction:action2];
    }
    
    if (cancel == nil && submit == nil) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        [alert addAction:action];
    }
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


-(void)backInfoBtnClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
