//
//  HttpHelper.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/13/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "HttpHelper.h"

@implementation HttpHelper

+ (void)sendGetRequestWithUrl:(NSString *)url params:(NSDictionary *)params complete:(completeBlock)complete
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (complete) {
            complete(responseObject,operation.response,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (complete) {
            complete(nil,operation.response,error);
        }
    }];
}

+ (void)sendPostRequestWithUrl:(NSString *)url params:(NSDictionary *)params complete:(completeBlock)complete
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (complete) {
            complete(responseObject,operation.response,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (complete) {
            complete(nil,operation.response,error);
        }
    }];
}

+ (void)sendPutRequestWithUrl:(NSString *)url params:(NSDictionary *)params complete:(completeBlock)complete
{

}

+ (void)sendDeleteRequestWith:(NSString *)url params:(NSDictionary *)params complete:(completeBlock)complete
{

}

@end
