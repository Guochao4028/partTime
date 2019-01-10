//
//  IndexViewController.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "IndexViewController.h"
#import "IndexTableHeardView.h"
#import "MapViewController.h"
#import "IndexTableViewCell.h"

#import "ListViewController.h"

static NSString *const IndexTableViewCellIdentifier = @"IndexTableViewCellIdentifier";

@interface IndexViewController ()<UITableViewDelegate, UITableViewDataSource, IndexTableHeardViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)IndexTableHeardView *tableHeardView;

@property(nonatomic, strong)NSArray *titleArray;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self initData];
}



-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [super viewWillDisappear:animated];
//}


#pragma mark - private
-(void)initData{
    self.titleArray = @[@"Work list", @"Anytime work", @"Part-time work", @"Weekly work"];
}

//初始化UI
-(void)initUI{
    [self.view addSubview:self.tableView];
}

#pragma mark -  IndexTableHeardViewDelegate
-(void)selectJumpPage:(NSInteger)type{
    if(type == 0){
        MapViewController *mapVC = [[MapViewController alloc]init];
        mapVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mapVC animated:YES];
    }else{
     
        ListViewController *listVC = [[ListViewController alloc]init];
        [listVC setTitleString:@"Work list"];
        listVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
    }
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IndexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IndexTableViewCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *titleStr = self.titleArray[indexPath.row];
    ListViewController *listVC = [[ListViewController alloc]init];
    [listVC setTitleString:titleStr];
    listVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:listVC animated:YES];
}

#pragma mark - setter
-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (SafeAreaBottomHeight + TabBarHeight);
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, tabelViewH) style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> headView
        self.tableHeardView = ({
            IndexTableHeardView *view = [[IndexTableHeardView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 330)];
            [view setDelegate:self];
            view;
        });
        
        _tableView.tableHeaderView = ({
            UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 330)];
            back.backgroundColor = [UIColor clearColor];
            [back addSubview:self.tableHeardView];
            back;
        });
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"IndexTableViewCell" bundle:nil] forCellReuseIdentifier:IndexTableViewCellIdentifier];
//
//
//        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}

@end
