//
//  StatusHelper.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/17/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "StatusHelper.h"
#import "Account.h"
#import "HttpHelper.h"

@implementation StatusHelper

+ (void)fetchHomeTimelineWithParams:(NSDictionary *)params complete:(void (^)(NSDictionary *result))complete
{
    Account *account = [[Account sharedAccount]unserializeAccount];
    NSString *url = @"https://api.weibo.com/2/statuses/home_timeline.json";
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithDictionary:params];
    [query setObject:account.access_token forKey:@"access_token"];
    [HttpHelper sendGetRequestWithUrl:url params:query complete:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            complete((NSDictionary *)data);
        }else{
            complete(nil);
        }
    }];
}

@end
