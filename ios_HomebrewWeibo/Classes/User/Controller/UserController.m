//
//  UserController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/15/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "UserController.h"
#import "SettingController.h"


@interface UserController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation UserController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"用户";
    
    [self addNavButton];
    
    [self addTableView];
}

#pragma mark - 视图控件初始化
- (void)addNavButton
{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_config"] style:UIBarButtonItemStyleDone target:self action:@selector(tapSettingIcon)];
    rightButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
}

#pragma mark - 事件
- (void)tapSettingIcon
{
    SettingController *setting = [[SettingController alloc]init];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];

    [self.navigationController pushViewController:setting animated:YES];
}

#pragma mark - 代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"setting";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


@end
