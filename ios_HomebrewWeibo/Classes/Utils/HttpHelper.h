//
//  HttpHelper.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/13/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^completeBlock) (NSData *data, NSURLResponse *response, NSError *error);

@interface HttpHelper : NSObject

+ (void)sendGetRequestWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                     complete:(completeBlock)complete;

+ (void)sendPostRequestWithUrl:(NSString *)url
                 params:(NSDictionary *)params
               complete:(completeBlock)complete;

+ (void)sendPutRequestWithUrl:(NSString *)url
                       params:(NSDictionary *)params
                     complete:(completeBlock)complete;

+ (void)sendDeleteRequestWith:(NSString *)url
                       params:(NSDictionary *)params
                     complete:(completeBlock)complete;

@end
