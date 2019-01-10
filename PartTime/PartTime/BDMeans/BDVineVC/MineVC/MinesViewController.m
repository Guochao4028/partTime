//
//  MinesViewController.m
//  CommunityGame
//
//  Created by AYLiOS on 2018/12/17.
//  Copyright © 2018 MissiOS. All rights reserved.
//

#import "MinesViewController.h"
#import "MineTableViewCell.h"
#import "MineHeaderView.h"
#import "HistroyViewController.h"
#import "LoginManager.h"
#import "UserInfoModel.h"
#import "BDSetMinConfig.h"
#import "BDCustomNavtionInView.h"

#import "MineFeedbackViewController.h"
#import "MineAboutViewController.h"
#import "MineHeaderViewController.h"

#define kHeaderHeight 190

@interface MinesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *mineTableView;
@property (strong, nonatomic) NSMutableArray * arrayItems;
@property (strong, nonatomic) BDCustomNavtionInView * navInView;
@property (strong, nonatomic) MineHeaderView * headerMineVi;

@end

@implementation MinesViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)btnBackClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
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
    self.navInView.leftBtn.hidden=YES;
    self.navInView.titleLable.textColor=[UIColor colorWithRed:0 green:99/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:self.navInView];
}

-(void)createTableView
{
    CGFloat heightNav = STATUSHEIGHT + CGRectGetHeight(self.navigationController.navigationBar.frame);
    self.mineTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, heightNav, SCREEN_WIDTH, SCREEN_HEIGHT - heightNav) style:UITableViewStylePlain];
    self.mineTableView.delegate=self;
    self.mineTableView.dataSource =self;
    self.mineTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.mineTableView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.mineTableView];
    
    self.headerMineVi=[[MineHeaderView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH ,190 )];
    self.headerMineVi.backgroundColor=[UIColor whiteColor];
    
    UserInfoModel * userInfo =[LoginManager getLoginUserInfo];
    self.headerMineVi.imageIconVi.image=[UIImage imageNamed:userInfo.avatar];
    self.headerMineVi.imageBackView.image=[UIImage imageNamed:userInfo.avatar];
    NSString * string = userInfo.nickname;
    self.headerMineVi.titleOLabel.text=string;
    self.headerMineVi.titleOLabel.textColor=[UIColor colorWithRed:0 green:99/255.0 blue:238/255.0 alpha:1.0];
    __weak typeof(self) weakSelf =self;
    self.headerMineVi.headerImageClick = ^{
        [weakSelf pushHeaderVodeVC];
    };
    self.mineTableView.tableHeaderView=self.headerMineVi;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrayItems=[NSMutableArray arrayWithCapacity:0];
    [self createNavTionView];
    [self createTableView];
    self.navInView.titleLable.text=@"Mine.";
    [self requestWithData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(headerRefrash:) name:@"headerGengRefrash" object:nil];
}
-(void)headerRefrash:(NSNotification *)notifi
{
    UserInfoModel * userInfo =[LoginManager getLoginUserInfo];
    self.headerMineVi.imageIconVi.image=[UIImage imageNamed:userInfo.avatar];
    self.headerMineVi.imageBackView.image=[UIImage imageNamed:userInfo.avatar];
    [self.mineTableView reloadData];
}

-(void)requestWithData
{
    NSArray * titleArr0 =@[@{@"title":@"header",@"image" : @"mine_cell01"}];
    NSArray * titleArr1 =@[
                           @{@"title":@"Histroy",@"image" : @"mine_historyrecord"},
                           @{@"title":@"Share", @"image" : @"mine_share"},
                           @{@"title":@"Feedback", @"image" : @"mine_yijianfankui"},
                           @{@"title":@"About us.", @"image" : @"mine_guanyuwomen"}
                           
                           ];
    [self.arrayItems addObject:titleArr0];
    [self.arrayItems addObject:titleArr1];
    [self.mineTableView reloadData];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrayItems.count >0 ?self.arrayItems.count :0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.arrayItems.count >0) {
        if (section ==0) {
            return 0;
        }else{
            NSArray * array=[self.arrayItems objectAtIndex:section];
            return array.count;
        }
       
    }else{
        
        return 0;
    }
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIDent =@"MineTableViewCellID";
    
    MineTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellIDent];
    if (cell == nil) {
        cell =[[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDent];
    }
    NSArray * ArrayTitle =[self.arrayItems objectAtIndex:indexPath.section];
    NSDictionary * dict =[ArrayTitle objectAtIndex:indexPath.row];
    cell.imageIconVi.image=[UIImage imageNamed:[dict objectForKey:@"image"]];
    cell.titleOLabel.text=[dict objectForKey:@"title"];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }else{
        return 0.0;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section ==0) {
        
    }else if (indexPath.section ==1){
        
        switch (indexPath.row) {
            case 0:
            {
               //Histroy
                HistroyViewController *histroyVC = [[HistroyViewController alloc]init];
                histroyVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:histroyVC animated:YES];
                
            }
                break;
            case 1:
            {
                //share
                NSString *shareText = @"PartTime-App";
                UIImage *shareImage = [UIImage imageNamed:@"引导页1"];
                NSURL *shareURL = [NSURL URLWithString:@"https://www.baidu.com/"];
                NSArray *activityItems = [[NSArray alloc] initWithObjects:shareText, shareImage, shareURL, nil];
    
                UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
                UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
                    NSLog(@"%@",activityType);
                    if (completed) {
                        NSLog(@"分享成功");
                    } else {
                        NSLog(@"分享失败");
                    }
                    [vc dismissViewControllerAnimated:YES completion:nil];
                };
                vc.completionWithItemsHandler = myBlock;
                [self presentViewController:vc animated:YES completion:nil];
            }
                break;
            case 2:
            {
                //Feedback
                MineFeedbackViewController * feedback =[[MineFeedbackViewController alloc]init];
                feedback.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:feedback animated:YES];
            }
                break;
            case 3:
            {
                MineAboutViewController * about =[[MineAboutViewController alloc]init];
                about.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:about animated:YES];
                
            }
                break;
                
            default:
                break;
        }

    }
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc]init];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    return nil;
}

-(void)pushHeaderVodeVC
{
    MineHeaderViewController * about =[[MineHeaderViewController alloc]init];
    about.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:about animated:YES];
    
    
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
