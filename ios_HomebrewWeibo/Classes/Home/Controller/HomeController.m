//
//  HomeController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/14/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "HomeController.h"
#import "User.h"
#import "Status.h"
#import "StatusHelper.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface HomeController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    NSMutableArray *_statusList;
    
    BOOL _first; // 首次加载标识
}
@end

@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    _first = NO;
    _statusList = [NSMutableArray array];
    
    [self addNavButton];
    
    [self addTableView];

    if (!_first) {
        [_tableView headerBeginRefreshing];
        _first = YES;
    }
}

#pragma mark - 控件
- (void)addNavButton
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_user_group"] style:UIBarButtonItemStyleDone target:nil action:nil];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_status_post"] style:UIBarButtonItemStyleDone target:nil action:nil];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addTableView
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView addHeaderWithTarget:self action:@selector(headerRefreshing)];
    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
//    self.tableView.headerPullToRefreshText = @"下拉可以刷新了";
//    self.tableView.headerReleaseToRefreshText = @"松开马上刷新了";
//    self.tableView.headerRefreshingText = @"MJ哥正在帮你刷新中,不客气";
    
//    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    self.tableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";
}

#pragma mark - 代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    Status *status = _statusList[indexPath.row];
    cell.textLabel.text = status.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:status.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"icon_user_profile"] options:SDWebImageLowPriority | SDWebImageRetryFailed];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _statusList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


#pragma mark - 事件
- (void)headerRefreshing
{
    Status *status = [_statusList firstObject];
    long long sinceId = [status ID];

    [StatusHelper fetchHomeTimelineWithParams:@{
        @"since_id" : @(sinceId)
    } complete:^(NSDictionary *result) {
        NSMutableArray *newData = [NSMutableArray array];
        
        for (NSDictionary *dict in result[@"statuses"]) {
            Status *status = [[Status alloc]initWithDict:dict];
            [newData addObject:status];
        }

        [_statusList insertObjects:newData atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newData.count)]];

        [_tableView headerEndRefreshing];
        [_tableView reloadData];
    }];
}

- (void)footerRereshing
{
    Status *lastStatus = [_statusList lastObject];
    long long max_id = [lastStatus ID];
    [StatusHelper fetchHomeTimelineWithParams:@{
        @"max_id" : @(max_id - 1)
    } complete:^(NSDictionary *result) {
        NSMutableArray *newData = [NSMutableArray array];
        for (NSDictionary *dict in result[@"statuses"]) {
            Status *status = [[Status alloc]initWithDict:dict];
            [newData addObject:status];
        }
        
        [_statusList addObjectsFromArray:newData];
        
        [_tableView footerEndRefreshing];
        [_tableView reloadData];
    }];
}



@end
