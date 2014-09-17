//
//  User.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/15/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _ID = [dict[@"id"]longLongValue];
        _idstr = dict[@"idstr"];
        _screen_name = dict[@"screen_name"];
        _name = dict[@"name"];
        _profile_image_url = dict[@"profile_image_url"];
        _verified = [dict[@"verified"]boolValue];
        _verified_type = [dict[@"verified_type"]integerValue];
    }
    return self;
}

@end
