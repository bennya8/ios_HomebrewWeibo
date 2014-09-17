//
//  UserHelper.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/15/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//


#import "UserHelper.h"
#import "User.h"
#import "Account.h"
#import "HttpHelper.h"

@implementation UserHelper

#pragma mark - 根据用户ID获取用户信息
+ (void)fetchUserByUid:(NSInteger)uid complete:(void(^)(User *user))complete
{
    if (!complete) return;
    Account *account = [[Account sharedAccount]unserializeAccount];
    NSString *url = @"https://api.weibo.com/2/users/show.json";
    NSDictionary *params = @{
        @"access_token" : account.access_token,
        @"uid" : @(account.uid)
    };
    [HttpHelper sendGetRequestWithUrl:url params:params complete:^(NSData *data, NSURLResponse *response, NSError *error) {
        User *user = [[User alloc]initWithDict:(NSDictionary *)data];
        complete(user);
    }];
}

@end
