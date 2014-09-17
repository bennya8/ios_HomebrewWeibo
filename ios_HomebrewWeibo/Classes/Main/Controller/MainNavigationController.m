//
//  MainNavigationController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/14/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    [self.navigationBar  setBackgroundImage:[UIImage imageNamed:@"main_navbar.png"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:60/255.0 green:208/255.0 blue:252/255.0 alpha:1]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
        NSForegroundColorAttributeName : [UIColor whiteColor],
        NSBackgroundColorAttributeName : [UIColor whiteColor],
        NSFontAttributeName : [UIFont fontWithName:kAppFontBold size:20]
    }];
    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:40/255.0 green:50/255.0 blue:52/255.0 alpha:1]];
    
    UITabBar *tabBar = [UITabBar appearance];
    tabBar.tintColor = [UIColor colorWithRed:60/255.0 green:208/255.0 blue:252/255.0 alpha:1];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes: @{
        NSFontAttributeName : [UIFont fontWithName:kAppFontBold size:13]
    } forState:UIControlStateNormal];
    
    [tabBarItem setTitleTextAttributes: @{
        NSFontAttributeName : [UIFont fontWithName:kAppFontBold size:13],
        NSForegroundColorAttributeName : [UIColor whiteColor],
        NSBackgroundColorAttributeName : [UIColor whiteColor]
    } forState:UIControlStateHighlighted];

    self.navigationController.navigationBar.topItem.title = @"";
    

}

@end
