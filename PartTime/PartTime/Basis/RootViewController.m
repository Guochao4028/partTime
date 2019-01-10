//
//  RootViewController.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "RootViewController.h"
#import "BaseViewController.h"

//#import "MyViewController.h"
#import "MinesViewController.h"
#import "IndexViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *indexNav = [self p_SetTabBarItem:[[IndexViewController alloc]init] withViewControllerTitle:@"index" image:[UIImage imageNamed:@"index_uned"] selectImage:[UIImage imageNamed:@"index"]];
    
    UINavigationController *myNav = [self p_SetTabBarItem:[[MinesViewController alloc] init] withViewControllerTitle:@"my" image:[UIImage imageNamed:@"mine_uned"] selectImage:[UIImage imageNamed:@"mine"]];
    
    
    self.viewControllers = @[indexNav, myNav];
}

#pragma mark - private

-(UINavigationController *)p_SetTabBarItem:(BaseViewController *)vc withViewControllerTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage{
    [vc setTitle:title];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [selectImage  imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:selectImage];
    nav.tabBarItem = tabBarItem;
    return nav;
}


@end
