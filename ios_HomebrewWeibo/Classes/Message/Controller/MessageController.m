//
//  MessageController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/15/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "MessageController.h"

@interface MessageController ()

@end

@implementation MessageController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"消息";
    
//    [self addNavItem];
}

- (void)addNavItem
{
    UIBarButtonItem *lefItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    lefItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = lefItem;
    
    
}


@end
