//
//  MineAboutViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "MineAboutViewController.h"
#import "BDCustomNavtionInView.h"
#import "BDSetMinConfig.h"

@interface MineAboutViewController ()

@property (strong, nonatomic) UIImageView * headerImgView;
@property (strong, nonatomic) BDCustomNavtionInView * navInView;
@property (strong, nonatomic) UILabel * labelTitle;
@property (strong, nonatomic) UILabel * labelSecond;

@end

@implementation MineAboutViewController

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
-(void)createNavTionView
{
    CGFloat heightNav =STATUSHEIGHT + CGRectGetHeight(self.navigationController.navigationBar.frame);
    self.navInView =[[BDCustomNavtionInView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, heightNav)];
    self.navInView.backgroundColor=[UIColor whiteColor];
    self.navInView.titleLable.text=@"About us.";
    self.navInView.titleLable.textColor=[UIColor blackColor];
    [self.view addSubview:self.navInView];
    __weak typeof(self) weakSelf =self;
    self.navInView.btnClickBackIndex = ^(NSInteger index) {
        if (index == 0) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    };
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self createNavTionView];
    [self creatAboutInfoView];
}
-(void)creatAboutInfoView
{
    CGFloat heightNav =STATUSHEIGHT + CGRectGetHeight(self.navigationController.navigationBar.frame);
    self.headerImgView=[[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth-70)/2, heightNav+40, 70, 70)];
    self.headerImgView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.headerImgView];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.labelTitle =[[UILabel alloc]initWithFrame:CGRectMake(15,CGRectGetMaxY(self.headerImgView.frame)+20, SCREEN_WIDTH -30, 20)];
    self.labelTitle.font=[UIFont systemFontOfSize:14];
    self.labelTitle.textAlignment=NSTextAlignmentCenter;
    self.labelTitle.text=[NSString stringWithFormat:@"Version Number:%@",app_Version];
    [self.view addSubview:self.labelTitle];
    
    self.labelSecond =[[UILabel alloc]initWithFrame:CGRectMake(15,CGRectGetMaxY(self.labelTitle.frame)+20, SCREEN_WIDTH -30, 20)];
    self.labelSecond.font=[UIFont systemFontOfSize:14];
    self.labelSecond.textAlignment=NSTextAlignmentCenter;
    self.labelSecond.text=@"Working nearby. Accurate location";
    [self.view addSubview:self.labelSecond];
    
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
