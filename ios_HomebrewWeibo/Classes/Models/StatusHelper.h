//
//  StatusHelper.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/17/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusHelper : NSObject

+ (void)fetchHomeTimelineWithParams:(NSDictionary *)params complete:(void (^)(NSDictionary *result))complete;

@end
