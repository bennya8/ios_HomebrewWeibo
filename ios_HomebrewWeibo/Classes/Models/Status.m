//
//  Status.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/16/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _ID = [dict[@"id"]longLongValue];
        _mid = [dict[@"mid"]longLongValue];
        _idstr = dict[@"idstr"];
        _text = dict[@"text"];
        _source = dict[@"source"];
        _created_at = dict[@"create_at"];
        _reposts_count = [dict[@"reposts_count"]integerValue];
        _comments_count = [dict[@"comments_count"]integerValue];
        _attitudes_count = [dict[@"attitudes_count"]integerValue];
        _user = [[User alloc]initWithDict:dict[@"user"]];
        
    }
    return self;
}

@end
