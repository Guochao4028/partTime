//
//  HistroyViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "HistroyViewController.h"
#import "HistroyNavgtionView.h"
#import "DBManager.h"
#import "HistroyTableViewCell.h"

static NSString *const HistroyTableViewCellIdentifier = @"HistroyTableViewCellIdentifier";

static NSString *const TableViewCellIdentifier = @"TableViewCellIdentifier";


@interface HistroyViewController ()<HistroyNavgtionViewDelegate, UITableViewDelegate, UITableViewDataSource, HistroyTableViewCellDelegate>
@property(nonatomic, strong)HistroyNavgtionView *navgationView;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataList;

@end

@implementation HistroyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initUI];
    [self initData];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

-(void)initUI{
    [self.view addSubview:self.navgationView];
    [self.view addSubview:self.tableView];
}

-(void)initData{
    NSArray *tem = [[DBManager shareInstance]queryPlist];
    self.dataList = [NSMutableArray arrayWithArray:tem];
    [self.tableView reloadData];
}

#pragma mark - HistroyNavgtionViewDelegate
-(void)goback{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clearedAction{
    [[DBManager shareInstance] deleteFileToPlist];
    [self.dataList removeAllObjects];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.dataList.count > 0) {
        return self.dataList.count;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataList.count > 0) {
        return 291;
    }else{
        CGFloat tabelViewH = ScreenHeight - (CGRectGetMaxY(self.navgationView.frame) + TabBarHeight);
        return tabelViewH;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataList.count > 0) {
        HistroyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HistroyTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setModel:[self.dataList objectAtIndex:indexPath.row]];
        [cell setIndexPath:indexPath];
        [cell setDelegate:self];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"收藏-暂无"]];
        [imageView setFrame:CGRectMake((ScreenWidth-177/2)/2, 100, 177/2, 177/2)];
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+10, ScreenWidth, 17)];
        [label setText:@"您还没有收藏工作，快去逛逛吧。"];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor lightGrayColor]];
        [cell.contentView addSubview:label];
        return cell;
    }
}

#pragma mark - HistroyTableViewCellDelegate

-(void)deleteCell:(NSIndexPath *)indexPath{
    [[DBManager shareInstance]deleteOnce:indexPath.row];
    NSArray *tem = [[DBManager shareInstance]queryPlist];
    self.dataList = [NSMutableArray arrayWithArray:tem];
    [self.tableView reloadData];
}

#pragma mark - getter/ setter

-(HistroyNavgtionView *)navgationView{
    if (_navgationView == nil) {
        _navgationView = [[HistroyNavgtionView alloc]initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, 44)];
        [_navgationView setDelegate:self];
    }
    return _navgationView;
}

-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (CGRectGetMaxY(self.navgationView.frame) + TabBarHeight);
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navgationView.frame), ScreenWidth, tabelViewH)
                                                 style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"HistroyTableViewCell" bundle:nil] forCellReuseIdentifier:HistroyTableViewCellIdentifier];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    }
    return _tableView;
}

@end
