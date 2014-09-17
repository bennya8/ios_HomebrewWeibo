//
//  MainController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/14/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "MainController.h"
#import "MainNavigationController.h"
#import "HomeController.h"
#import "MessageController.h"
#import "SearchController.h"
#import "UserController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self addChildsController];
}

- (void)addChildsController
{
    // 首页导航
    UITabBarItem *homeItem = [[UITabBarItem alloc]init];
    homeItem.title = @"首页";
    homeItem.image = [UIImage imageNamed:@"main_tabbar_home"];
    homeItem.selectedImage = [UIImage imageNamed:@"main_tabbar_home_selected"];
    MainNavigationController *homeNav = [[MainNavigationController alloc]initWithRootViewController:[[HomeController alloc]init]];;
    homeNav.tabBarItem = homeItem;
    
    
    // 消息导航
    UITabBarItem *messageItem = [[UITabBarItem alloc]init];
    messageItem.title = @"消息";
    messageItem.image = [UIImage imageNamed:@"main_tabbar_message_center"];
    messageItem.selectedImage = [UIImage imageNamed:@"main_tabbar_message_center_selected"];
    MainNavigationController *messageNav = [[MainNavigationController alloc]initWithRootViewController:[[MessageController alloc]init]];;
    messageNav.tabBarItem = messageItem;
    
    
    // 广场导航
    UITabBarItem *searchItem = [[UITabBarItem alloc]init];
    searchItem.title = @"广场";
    searchItem.image = [UIImage imageNamed:@"main_tabbar_discover"];
    searchItem.selectedImage = [UIImage imageNamed:@"main_tabbar_discover_highlighted"];
    MainNavigationController *searchNav = [[MainNavigationController alloc]initWithRootViewController:[[SearchController alloc]init]];;
    searchNav.tabBarItem = searchItem;
    
    // 用户导航
    UITabBarItem *userItem = [[UITabBarItem alloc]init];
    userItem.title = @"用户";
    userItem.image = [UIImage imageNamed:@"main_tabbar_profile"];
    userItem.selectedImage = [UIImage imageNamed:@"main_tabbar_profile_highlighted"];
    MainNavigationController *userNav = [[MainNavigationController alloc]initWithRootViewController:[[UserController alloc]init]];;
    userNav.tabBarItem = userItem;
    
    [self setViewControllers:@[homeNav,messageNav,searchNav,userNav]];
}




@end
