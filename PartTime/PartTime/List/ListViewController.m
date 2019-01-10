//
//  ListViewController.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "ListViewController.h"
#import "ListNavgationView.h"
#import "ListTableHeardView.h"
#import "JobsModel.h"
#import "ListTableViewCell.h"
#import "ListDetailsViewController.h"
#import "MJRefresh.h"
#import "HistroyViewController.h"

static NSString *const ListTableViewCellIdentifier = @"ListTableViewCellIdentifier";

@interface ListViewController ()<ListNavgationViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)ListNavgationView *navgationView;

@property(nonatomic, strong)NSMutableArray *dataList;

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataList = [NSMutableArray array];
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
//    [super viewWillDisappear:animated];
//}


//-(void)viewDidDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [super viewDidDisappear:animated];
//}

-(void)initData{
    NSUInteger r = arc4random_uniform(6) + 2;
    NSDictionary *dic = [self readLocalFileWithName:[NSString stringWithFormat:@"homedata%ld",r]];
    self.dataList = [JobsModel mj_objectArrayWithKeyValuesArray:dic[@"listings"][@"listing"]];
    [self.tableView reloadData];
}

-(void)initUI{
    [self.view addSubview:self.navgationView];
    [self.view addSubview:self.tableView];
}

-(void)loadRefreshingData{
    NSDictionary *dic = [self readLocalFileWithName:@"homedata1"];
    self.dataList = [JobsModel mj_objectArrayWithKeyValuesArray:dic[@"listings"][@"listing"]];
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

-(void)loadMoreData{
    NSUInteger r = arc4random_uniform(6) + 2;
    NSDictionary *dic = [self readLocalFileWithName:[NSString stringWithFormat:@"homedata%ld",r]];
    NSArray *tem = [JobsModel mj_objectArrayWithKeyValuesArray:dic[@"listings"][@"listing"]];
    [self.dataList addObjectsFromArray:tem];
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

- (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

#pragma mark - ListNavgationViewDelegate
-(void)goback{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 114;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:[self.dataList objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsModel *model = [self.dataList objectAtIndex:indexPath.row];
    ListDetailsViewController *detailsVC = [[ListDetailsViewController alloc]init];
    [detailsVC setModel:model];
    [self.navigationController pushViewController:detailsVC animated:YES];
}

#pragma mark - getter/ setter

-(ListNavgationView *)navgationView{
    if (_navgationView == nil) {
        _navgationView = [[ListNavgationView alloc]initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, 40)];
        [_navgationView setDelegate:self];
    }
    return _navgationView;
}


-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (CGRectGetMaxY(self.navgationView.frame) + TabBarHeight);//-44;
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navgationView.frame), ScreenWidth, tabelViewH)
                                                 style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> headView
        ListTableHeardView *headView = [[ListTableHeardView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 75)];
        
        _tableView.tableHeaderView = ({
            UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 75)];
            back.backgroundColor = [UIColor clearColor];
            [back addSubview:headView];
            back;
        });
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:ListTableViewCellIdentifier];
        
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshingData)];
        
    }
    return _tableView;
}

-(void)setTitleString:(NSString *)titleString{
    _titleString = titleString;
    [self.navgationView setTitleLabelStr:titleString];
}



@end
