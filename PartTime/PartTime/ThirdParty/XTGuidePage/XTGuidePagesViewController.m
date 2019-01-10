//
//  XTGuidePagesViewController.m
//  XTGuidePagesView
//
//  Created by zjwang on 16/5/30.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "XTGuidePagesViewController.h"

#define s_w [UIScreen mainScreen].bounds.size.width
#define s_h [UIScreen mainScreen].bounds.size.height
#define s_status CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define VERSION_INFO_CURRENT @"currentversion"
@interface XTGuidePagesViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIButton * subMitBtn;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation XTGuidePagesViewController

- (void)guidePageControllerWithImages:(NSArray *)images
{
    UIScrollView *gui = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, s_w, s_h)];
    gui.delegate = self;
    gui.pagingEnabled = YES;
    // 隐藏滑动条
    gui.showsHorizontalScrollIndicator = NO;
    gui.showsVerticalScrollIndicator = NO;
    // 取消反弹
    gui.bounces = NO;
    for (NSInteger i = 0; i < images.count; i ++) {
        [gui addSubview:({
            self.btnEnter = [UIButton buttonWithType:UIButtonTypeCustom];
            self.btnEnter.frame = CGRectMake(s_w * i, 0, s_w, s_h);
            [self.btnEnter setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
            self.btnEnter;
        })];
        
        [self.btnEnter addSubview:({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setTitle:@"跳过" forState:UIControlStateNormal];
            if (i == images.count - 1) {
//                [btn setTitle:@"点击进入" forState:UIControlStateNormal];
            }
            btn.frame = CGRectMake(s_w * i, s_h - 200, s_w - 40*2, 50);
            btn.center = CGPointMake(s_w / 2, s_h - 160);
            btn.layer.cornerRadius = 4;
            btn.clipsToBounds = YES;
            [btn addTarget:self action:@selector(clickEnter) forControlEvents:UIControlEventTouchUpInside];
            btn;
        })];
    }
    gui.contentSize = CGSizeMake(s_w * images.count, 0);
    [self.view addSubview:gui];
    
    NSString * titleSkip =@"跳过";
    NSString * titleBtn =@"Skip";
    
    UIColor * colorSubMit =[UIColor colorWithRed:43/255.0 green:143/255.0 blue:235/255.0 alpha:1.0];
    
    UIFont * targetFont=[UIFont systemFontOfSize:15];
    NSDictionary * arrtib=@{NSFontAttributeName : targetFont};
    CGFloat width=[titleSkip sizeWithAttributes:arrtib].width + 20;
    
    self.subMitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.subMitBtn.frame=CGRectMake(15 ,s_status + 20 , width, 20);
    [self.subMitBtn setTitle:titleBtn forState:UIControlStateNormal];
    [self.subMitBtn setTitleColor:colorSubMit forState:UIControlStateNormal];
    self.subMitBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.subMitBtn.layer.masksToBounds=YES;
    self.subMitBtn.layer.cornerRadius=CGRectGetHeight(self.subMitBtn.frame)/2;
    self.subMitBtn.layer.borderColor=colorSubMit.CGColor;
    self.subMitBtn.layer.borderWidth=1.0;
    [self.subMitBtn addTarget:self action:@selector(clickInfoBtnEnter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.subMitBtn];
    
    // pageControl
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, s_w / 2, 30)];
    self.pageControl.center = CGPointMake(s_w / 2, s_h - 95);
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = images.count;
}
- (void)clickInfoBtnEnter
{
    [XTGuidePagesViewController saveCurrentVersion];
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(clickEnter)]) {
        [self.delegate clickEnter];
    }
}
+ (BOOL)isShow
{
    // 读取版本信息
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [user objectForKey:VERSION_INFO_CURRENT];
    NSString *currentVersion =[[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if (localVersion == nil || ![currentVersion isEqualToString:localVersion]) {
       
        return YES;
    }else
    {
        return NO;
    }
}
// 保存版本信息
+ (void)saveCurrentVersion
{
    NSString *version =[[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:version forKey:VERSION_INFO_CURRENT];
    [user synchronize];
}
#pragma mark - ScrollerView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / s_w;
}

@end


