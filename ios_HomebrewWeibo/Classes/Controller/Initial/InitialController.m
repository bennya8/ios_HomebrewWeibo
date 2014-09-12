//
//  InitialController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/12/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "InitialController.h"
#import "WeiboSDK.h"

@interface InitialController ()

@end

@implementation InitialController

- (void)loadView
{
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeiboSDK *weiboSDK = [[WeiboSDK alloc]init];
    [WeiboSDK registerApp:@"2308818352"];
}

@end
