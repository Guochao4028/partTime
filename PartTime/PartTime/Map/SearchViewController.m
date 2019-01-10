//
//  SearchViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/2.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchNavgationView.h"
#import "SearchHeardCell.h"
#import "SearchWorkTypeCell.h"
#import "SearchDistanceCell.h"
#import "SearchHomeCell.h"
#import "SearchBottomView.h"

static NSString *const SearchHeardCellIdentifier = @"SearchHeardCellIdentifier";
static NSString *const SearchWorkTypeCellIdentifier = @"SearchWorkTypeCellIdentifier";
static NSString *const SearchDistanceCellIdentifier = @"SearchDistanceCellIdentifier";
static NSString *const SearchHomeCellIdentifier = @"SearchHomeCellIdentifier";

@interface SearchViewController ()<SearchNavgationViewDelegate, UITableViewDelegate, UITableViewDataSource, SearchBottomViewDelegate, SearchHomeCellDelegate>
@property(nonatomic, strong)SearchNavgationView *navgationView;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)SearchBottomView *bottomView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI{
    [self.view addSubview:self.navgationView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}

#pragma mark - SearchNavgationViewDelegate
-(void)selectJumpPage:(NSInteger)type{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{ return 90; break;}
        case 1:{ return 215; break;}
        case 2:{ return 78; break;}
        case 3:{ return 144; break;}
        default:{break;}
    }
    return 78;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            SearchHeardCell *cell = [tableView dequeueReusableCellWithIdentifier:SearchHeardCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setCurrLocationStr:self.currLocationStr];
            return cell;
            break;
        }
        case 1:{
            SearchWorkTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:SearchWorkTypeCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        }
        case 2:{
            SearchDistanceCell *cell = [tableView dequeueReusableCellWithIdentifier:SearchDistanceCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        }
        case 3:{
            SearchHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:SearchHomeCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setDelegate:self];
            return cell;
            break;
        }
        default:{break;}
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - SearchBottomViewDelegate
-(void)selectDone{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - SearchHomeCellDelegate
-(void)random{
    NSUInteger r = arc4random_uniform(10) + 1;
    self.bottomView.numberJob = [NSString stringWithFormat:@"%ld",r];
}


#pragma mark - getter/ setter
-(SearchNavgationView *)navgationView{
    if (_navgationView == nil) {
        _navgationView = [[SearchNavgationView alloc]initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, 40)];
        [_navgationView setDelegate:self];
    }
    return _navgationView;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navgationView.frame), ScreenWidth, (ScreenHeight - CGRectGetHeight(self.navgationView.frame) - CGRectGetHeight(self.bottomView.frame) - SafeAreaBottomHeight))];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"SearchHeardCell" bundle:nil] forCellReuseIdentifier:SearchHeardCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"SearchWorkTypeCell" bundle:nil] forCellReuseIdentifier:SearchWorkTypeCellIdentifier];
        
        [_tableView registerNib:[UINib nibWithNibName:@"SearchDistanceCell" bundle:nil] forCellReuseIdentifier:SearchDistanceCellIdentifier];
        
        [_tableView registerNib:[UINib nibWithNibName:@"SearchHomeCell" bundle:nil] forCellReuseIdentifier:SearchHomeCellIdentifier];
    }
    return _tableView;
}

-(SearchBottomView *)bottomView{
    if (_bottomView == nil) {
        
        CGFloat bottomY = ScreenHeight - 88 - SafeAreaBottomHeight;
        
        _bottomView = [[SearchBottomView alloc]initWithFrame:CGRectMake(0, bottomY, ScreenWidth, 88)];
        [_bottomView setDelegate:self];
    }
    return _bottomView;
}


@end
