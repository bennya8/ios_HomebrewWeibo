//
//  MainController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/14/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
//    self.tabBar.barTintColor = [UIColor whiteColor];
    
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"sdfdsf" image:[UIImage imageNamed:@"main_tabitem_home.png"] tag:1];

    self.tabBar.items = @[item,item];
}




@end
