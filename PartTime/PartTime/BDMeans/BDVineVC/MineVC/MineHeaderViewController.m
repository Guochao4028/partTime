//
//  MineHeaderViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/4.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "MineHeaderViewController.h"
#import "BDSetMinConfig.h"
#import "MineHeaderCollectionViewCell.h"
#import "LoginManager.h"
#import "UserInfoModel.h"
#import "SVProgressHUD.h"
#import "MBProgressHUD+Add.h"
#import "BDCustomNavtionInView.h"

@interface MineHeaderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) BDCustomNavtionInView * navInView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray * arrayItems;
@end

@implementation MineHeaderViewController

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
    self.navInView.titleLable.text=@"Change the Avatar";
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
    self.arrayItems=[NSMutableArray arrayWithCapacity:0];
    [self createNavTionView];
    [self creatCollectionView];
    [self requestWithData];
}
-(void)requestWithData
{
    [self.arrayItems removeAllObjects];
    for (int i =0; i<15; i++) {
        NSString * stringItem =[NSString stringWithFormat:@"imageHeader%02d",i+1];
        [self.arrayItems addObject:stringItem];
        NSLog(@"stringItem %@",stringItem);
    }
    [self.collectionView reloadData];
}
-(void)creatCollectionView
{
     CGFloat heightNav =STATUSHEIGHT + CGRectGetHeight(self.navigationController.navigationBar.frame);
    UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
    self.collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, heightNav, SCREEN_WIDTH, ScreenHeight-heightNav) collectionViewLayout:flowLayout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[MineHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"cellIndexIDOne"];

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayItems.count >0 ? self.arrayItems.count : 0;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    MineHeaderCollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIndexIDOne" forIndexPath:indexPath];
    cell.imageHeaderVi.image=[UIImage imageNamed:[self.arrayItems objectAtIndex:indexPath.row]];
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD show];
    if (self.arrayItems.count >indexPath.row) {
        NSString * stringHead= [self.arrayItems objectAtIndex:indexPath.row];
        UserInfoModel * userInfo =[LoginManager getLoginUserInfo];
        userInfo.avatar=stringHead;
        [LoginManager saveLoginWithInfoUser:userInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"headerGengRefrash" object:nil];
        [self performSelector:@selector(headerInfoWithImage) withObject:self afterDelay:0.8];
    }else{
        [SVProgressHUD dismiss];
    }
    
}
-(void)headerInfoWithImage
{
    [SVProgressHUD dismiss];
    [MBProgressHUD showError:@"Replacement Success" toView:self.view];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (SCREEN_WIDTH - 4*12)/3 ;
    return CGSizeMake(width, width);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 0);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 12;
    
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 12;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(12, 12, 12, 12);
    
    
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
