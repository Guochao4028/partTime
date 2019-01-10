//
//  ListDetailsViewController.m
//  PartTime
//
//  Created by AYLiOS on 2019/1/3.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListDetailsViewController.h"
#import "JobsModel.h"
#import "ListNavgationView.h"
#import "Company.h"
#import "UIImageView+WebCache.h"
#import "ListDetailsTableViewCell.h"
#import "SVProgressHUD.h"
#import <MessageUI/MessageUI.h>
#import "DBManager.h"

#import "ListDetailsBottomView.h"

static NSString *const ListDetailsTableViewCellIdentifier = @"ListDetailsTableViewCellIdentifier";

@interface ListDetailsViewController ()<ListNavgationViewDelegate, UITableViewDelegate, UITableViewDataSource, ListDetailsBottomViewDelegate, MFMailComposeViewControllerDelegate>
@property(nonatomic, strong)ListNavgationView *navgationView;

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)UIView *back;

@property(nonatomic, strong)UIImageView *headView;

@property(nonatomic, strong)ListDetailsBottomView *bottomView;

@property (nonatomic,strong) MFMailComposeViewController *mailComposer;

@end

@implementation ListDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initUI];
}

-(void)initUI{
    [self.view addSubview:self.navgationView];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.tableView];
    
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
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * htmlString = self.model.job_description;
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    CGFloat height =  [attrStr boundingRectWithSize:CGSizeMake((ScreenWidth - 28), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    
    return height+20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListDetailsTableViewCellIdentifier];
    [cell setModel:self.model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - ListDetailsBottomViewDelegate

-(void)callUp{
    
    [[DBManager shareInstance]savePlist:self.model];
    
    NSString *email = @"test@sina.com";
    if ([MFMailComposeViewController canSendMail]) { // 用户已设置邮件账户
        
    }else{
        [SVProgressHUD showInfoWithStatus:@"无邮件帐户,请设置邮件帐户来发送电子邮    件"];
        return;
    }
    if ([MFMessageComposeViewController canSendText] == YES) {
        _mailComposer = [[MFMailComposeViewController alloc]init];
        _mailComposer.mailComposeDelegate = self;
        [_mailComposer setSubject:@""];
        NSArray *arr = @[email];
        //收件人
        [_mailComposer setToRecipients:arr];
        
        
        [_mailComposer setMessageBody:@"你好,很高兴认识你" isHTML:NO];
        [self presentViewController:_mailComposer animated:YES completion:nil];
    }else{
        [SVProgressHUD showInfoWithStatus:@"设备不支持"];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %ld",(long)result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    switch (result)
    {
        case MFMailComposeResultCancelled: // 用户取消编辑
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved: // 用户保存邮件
            NSLog(@"Mail saved...");
            break;
        case MFMailComposeResultSent: // 用户点击发送
            NSLog(@"Mail sent...");
            break;
        case MFMailComposeResultFailed: // 用户尝试保存或发送邮件失败
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter/ setter

-(ListNavgationView *)navgationView{
    if (_navgationView == nil) {
        _navgationView = [[ListNavgationView alloc]initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, 40)];
        [_navgationView setDelegate:self];
    }
    return _navgationView;
}

-(void)setModel:(JobsModel *)model{
    self.navgationView.titleLabelStr = model.company.name;
    _model = model;
}

-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (CGRectGetMaxY(self.navgationView.frame) + TabBarHeight + 65);//-44;
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navgationView.frame), ScreenWidth, tabelViewH)
                                                 style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> headView
        self.headView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 14, ScreenWidth-28, 244)];
        
        if([self.model.company.logo rangeOfString:@"https://d2fcz5no062gar.cloudfront.neth"].location !=NSNotFound){
            NSRange range = [self.model.company.logo rangeOfString:@"https://d2fcz5no062gar.cloudfront.net"];
            NSString *logo = [self.model.company.logo substringFromIndex:(range.location + range.length)];
            [self.headView sd_setImageWithURL: [NSURL URLWithString:logo]];
        }else{
            [self.headView setImage:[UIImage imageNamed:@"CompanyLogo"]];
        }
        
        self.back = ({
            UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 272)];
            back.backgroundColor = [UIColor clearColor];
            [back addSubview:self.headView];
            back;
        });
        
        _tableView.tableHeaderView = self.back;
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"ListDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:ListDetailsTableViewCellIdentifier];
    }
    return _tableView;
}

-(ListDetailsBottomView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[ListDetailsBottomView alloc]initWithFrame:CGRectMake(0, ScreenHeight - (TabBarHeight + 65), ScreenWidth, 65)];
        [_bottomView setDelegate:self];
    }
    return _bottomView;
}

@end
